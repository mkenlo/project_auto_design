import 'dart:convert';

import 'package:flutter/services.dart';

import 'models/vehicle_model.dart';

/*Parameter <query> is a string of parameters (Make Model Year) space separated. Example: Nissan Rogue 2013*/
Future fetchAndFilterVehicles(String query) async {
  List<Vehicle> vehicles = await fetchVehicles("assets/data/data.json");
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

List<Vehicle> filterByMake(List<Vehicle> vehicles, String make) {
  return vehicles
      .where((item) => item.make.toLowerCase().startsWith(make.toLowerCase()))
      .toList();
}

List<Vehicle> filterByModel(List<Vehicle> vehicles, String model) {
  return vehicles
      .where((item) => item.model.toLowerCase().startsWith(model.toLowerCase()))
      .toList();
}

List<Vehicle> filterByYear(List<Vehicle> vehicles, String year) {
  return vehicles.where((item) => item.year == int.parse(year)).toList();
}

List<Vehicle> filterByPrice(List<Vehicle> vehicles, String price) {
  return vehicles.where((item) => item.price <= int.parse(price)).toList();
}

Future fetchVehicles(String filename) async {
  final jsonObj = await rootBundle.loadString(filename);
  List<Vehicle> vehicles = Vehicle.asListFromJson(json.decode(jsonObj));
  return vehicles;
}
