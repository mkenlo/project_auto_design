import 'package:flutter_test/flutter_test.dart';
import 'package:project_auto_design/data/fetch_service.dart';
import 'package:project_auto_design/data/models/vehicle_model.dart';

Map searchVehicles(List<Vehicle> vehicles,
    {String make: '', String model: '', String year: '', String price: ''}) {
  Map res = {
    'total_vehicles': 0,
    'lower_price': 0,
    'highest_price': 0,
    'median_price': 0
  };
  if (make.isNotEmpty) vehicles = filterByMake(vehicles, make);
  if (model.isNotEmpty) vehicles = filterByModel(vehicles, model);
  if (year.isNotEmpty) vehicles = filterByYear(vehicles, year);
  if (price.isNotEmpty) vehicles = filterByPrice(vehicles, price);

  if (vehicles.isNotEmpty) {
    vehicles.sort((car1, car2) => car1.price.compareTo(car2.price));
    res['total_vehicles'] = vehicles.length;
    res['lower_price'] = vehicles.first.price;
    res['highest_price'] = vehicles.last.price;
    int mid = vehicles.length ~/ 2;
    res['median_price'] = vehicles.elementAt(mid).price;
    if (vehicles.length % 2 == 0) {
      res['median_price'] =
          (res['median_price'] + vehicles.elementAt(mid - 1).price) / 2;
    }
  }
  return res;
}

void main() async {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  test('Search by Make Only', () async {
    List<Vehicle> vehicles = await fetchVehicles("assets/data/test.json");
    Map res = searchVehicles(vehicles, make: 'Nissan');
    expect(res['total_vehicles'], 0);
    expect(res['lower_price'], 0);
    expect(res['highest_price'], 0);
    expect(res['median_price'], 0);
  });

  test('Search by Make Only', () async {
    List<Vehicle> vehicles = await fetchVehicles("assets/data/test.json");
    Map res = searchVehicles(vehicles, make: 'Volvo');
    expect(res['total_vehicles'], 2);
    expect(res['lower_price'], 18572);
    expect(res['highest_price'], 108856);
    expect(res['median_price'], 63714.0);
  });
  test('Search by Make and Model', () async {
    List<Vehicle> vehicles = await fetchVehicles("assets/data/test.json");
    Map res = searchVehicles(vehicles, make: 'Volkswagen', model: 'Passat');
    expect(res['total_vehicles'], 3);
    expect(res['lower_price'], 1907);
    expect(res['highest_price'], 63903);
    expect(res['median_price'], 12323.0);
  });
  test('Search by Year Only', () async {
    List<Vehicle> vehicles = await fetchVehicles("assets/data/test.json");
    Map res = searchVehicles(vehicles, year: '2019');
    expect(res['total_vehicles'], 2);
    expect(res['lower_price'], 12323);
    expect(res['highest_price'], 108856);
    expect(res['median_price'], 60589.5);
  });
  test('Search by Make, Year', () async {
    List<Vehicle> vehicles = await fetchVehicles("assets/data/test.json");
    Map res = searchVehicles(vehicles, make: 'Volkswagen', year: '2019');
    expect(res['total_vehicles'], 1);
    expect(res['lower_price'], 12323);
    expect(res['highest_price'], 12323);
    expect(res['median_price'], 12323.0);
  });
  test('Search by Budget', () async {
    List<Vehicle> vehicles = await fetchVehicles("assets/data/test.json");
    Map res = searchVehicles(vehicles, price: '30000');
    expect(res['total_vehicles'], 3);
    expect(res['lower_price'], 1907);
    expect(res['highest_price'], 18572);
    expect(res['median_price'], 12323);
  });
}
