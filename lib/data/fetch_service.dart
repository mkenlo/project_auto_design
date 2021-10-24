import 'dart:convert';

import 'package:flutter/services.dart';

import 'models/vehicle_model.dart';

// @TODO implement filter features
Future fetchAndFilterVehicles(String query) async {
  final jsonObj = await rootBundle.loadString("assets/data/data.json");
  List<Vehicle> vehicles = Vehicle.asListFromJson(json.decode(jsonObj));
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
  return vehicles.where((item) => item.year.startsWith(year)).toList();
}
