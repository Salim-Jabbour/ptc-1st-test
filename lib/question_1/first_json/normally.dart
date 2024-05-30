// ignore_for_file: avoid_print

import '../jsons.dart';
import '../mixin_date_formate.dart';

class Company with DateHelper {
  int isActive;
  String name;
  Address address;
  String established;
  List<Department> departments;

  Company({
    required this.isActive,
    required this.name,
    required this.address,
    required this.established,
    required this.departments,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      isActive: json['is_active'],
      name: json['name'],
      address: Address.fromJson(json['address']),
      established: json['established'],
      departments: (json['departments'] as List<dynamic>)
          .map((e) => Department.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "is_active": isActive,
      "name": name,
      "address": address.toJson(),
      "established": established,
      "departments": departments,
    };
  }
}

class Address {
  String street;
  String city;
  String state;
  String postalCode;

  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "street": street,
      "city": city,
      "state": state,
      "postalCode": postalCode,
    };
  }
}

class Department {
  String deptId;
  String name;
  String manager;
  double budget;
  int? year;
  String meetingTime;
  Availability availability;

  Department({
    required this.deptId,
    required this.name,
    required this.manager,
    required this.budget,
    this.year,
    required this.meetingTime,
    required this.availability,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      deptId: json['deptId'],
      name: json['name'],
      manager: json['manager'],
      budget: json['budget'],
      year: json['year'],
      meetingTime: json['meeting_time'],
      availability: Availability.fromJson(json['availability']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "deptId": deptId,
      "name": name,
      "manager": manager,
      "budget": budget,
      "year": year,
      "meeting_time": meetingTime,
      "availability": availability.toJson(),
    };
  }
}

class Availability {
  bool? online;
  bool? inStore;

  Availability({
    required this.online,
    required this.inStore,
  });

  factory Availability.fromJson(Map<String, dynamic>? json) {
    return Availability(
      online: json?['online'],
      inStore: json?['inStore'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "online": online,
      "inStore": inStore,
    };
  }
}

void main() {
  print(" ************************** FIRST: **************************");
  Map<String, dynamic> json = companyJson['company'];
  Company company = Company.fromJson(json);
  print(company.toJson());
  print("Instance of address: ");
  Address address = Address.fromJson(json['address']);
  print(address.toJson());
  List<Department> departments = (json['departments'] as List<dynamic>)
      .map((e) => Department.fromJson(e))
      .toList();
  for (Department department in departments) {
    print("Instance of department:");
    print(department.toJson());
    Availability? availability = department.availability;
    print("Instance of availability:");
    print(availability.toJson());
  }

  // date review
  String formattedDate = company.formatDate(json['established']);
  print(" ************************** DATE: ************************** ");
  print("Formatted date: $formattedDate");

  company.toLocalTime(json['established']);
}
