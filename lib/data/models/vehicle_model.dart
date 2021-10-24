class Vehicle {
  String make;
  String model;
  int quantity;
  int year;
  int price;

  Vehicle(this.make, this.model, this.quantity, this.year, this.price);

  String description() {
    return "${this.make} ${this.model}, ${this.year}";
  }

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(json['make'], json['model'], json['vehicle_count'],
        json['year'], json['price']);
  }

  static List<Vehicle> asListFromJson(List<dynamic> json) {
    return json.map((i) => Vehicle.fromJson(i)).toList();
  }
}
