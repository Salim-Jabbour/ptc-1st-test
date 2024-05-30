// using AI
// ignore_for_file: avoid_print

import '../jsons.dart';

class Company {
  int isActive;
  String name;
  String? address;
  DateTime established;
  List<dynamic> departments;

  Company({
    required this.isActive,
    required this.name,
    this.address,
    required this.established,
    required this.departments,
  });

  // Factory method to create a Company instance from JSON
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      isActive: json['isActive'],
      name: json['name'],
      address: json['address'],
      established: DateTime.parse(json['established']),
      departments: List<dynamic>.from(json['departments']),
    );
  }

  // Method to convert a Company instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'isActive': isActive,
      'name': name,
      'address': address,
      'established': established.toIso8601String(),
      'departments': departments,
    };
  }
}

void main() {
  // for the second json
  print(" ************************** SECOND: **************************");

  Map<String, dynamic> json = companyJson2['company'];
  Company company = Company.fromJson(json);
  print(company.toJson());
}
