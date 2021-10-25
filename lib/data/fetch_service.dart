import 'dart:convert';

import 'package:flutter/services.dart';

import 'models/vehicle_model.dart';

/*Parameter <query> is a string of parameters (Make Model Year) space separated. Example: Nissan Rogue 2013*/
Future fetchAndFilterVehicles(String query) async {
  List<Vehicle> vehicles = await fetchVehicles();
  final params = cleanQueryString(query);
  if (params.length >= 1) vehicles = filterByMake(vehicles, params[0]);
  if (params.length >= 2) vehicles = filterByModel(vehicles, params[1]);
  if (params.length >= 3) vehicles = filterByYear(vehicles, params[2]);
  return vehicles;
}

// remove empty spaces from query string
List<String> cleanQueryString(String query) {
  return query.split(" ").where((w) => w.isNotEmpty).toList();
}

List<Vehicle> filterByMake(List vehicles, String make) {
  return vehicles
      .where((item) => item.make.toLowerCase().startsWith(make.toLowerCase()))
      .toList();
}

List<Vehicle> filterByModel(List vehicles, String model) {
  return vehicles
      .where((item) => item.model.toLowerCase().startsWith(model.toLowerCase()))
      .toList();
}

List<Vehicle> filterByYear(List vehicles, String year) {
  return vehicles.where((item) => item.year == int.parse(year)).toList();
}

List<Vehicle> filterByPrice(List vehicles, String price) {
  return vehicles.where((item) => item.price <= int.parse(price)).toList();
}

Future fetchVehicles() async {
  final jsonObj = await rootBundle.loadString("assets/data/data.json");
  List<Vehicle> vehicles = Vehicle.asListFromJson(json.decode(jsonObj));
  return vehicles;
}

Future<Map<String, num>> searchVehicles(
    {String make, String model, String year, String price}) async {
  Map res = {
    'total_vehicles': 0,
    'lower_price': 0,
    'highest_price': 0,
    'median_price': 0
  };
  List<Vehicle> vehicles = await fetchVehicles();
  if (make != null && make.isNotEmpty) vehicles = filterByMake(vehicles, make);
  if (model != null && model.isNotEmpty)
    vehicles = filterByModel(vehicles, model);
  if (year != null && year.isNotEmpty) vehicles = filterByYear(vehicles, year);
  if (price != null && price.isNotEmpty)
    vehicles = filterByPrice(vehicles, price);

  if (vehicles != null && vehicles.isNotEmpty) {
    vehicles.sort((car1, car2) => car1.price.compareTo(car2.price));
    res['total_vehicles'] = vehicles.length;
    res['lower_price'] = vehicles.first;
    res['highest_price'] = vehicles.last;
    int mid = vehicles.length ~/ 2;
    res['median_price'] = vehicles.elementAt(mid).price;
    if (vehicles.length % 2 == 0) {
      res['median_price'] =
          (res['median_price'] + vehicles.elementAt(mid - 1).price) / 2;
    }
  }
  return res;
}
