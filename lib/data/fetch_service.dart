import 'dart:convert';

import 'package:flutter/services.dart';

import 'models/vehicle_model.dart';

// @TODO implement filter features
Future fetchAndFilterVehicles(String query) async {
  final jsonObj = await rootBundle.loadString("assets/data/data.json");
  return Vehicle.asListFromJson(json.decode(jsonObj));
}
