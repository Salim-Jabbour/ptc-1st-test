// using AI

// ignore_for_file: avoid_print

import '../jsons.dart';

class Company {
  int isActive;
  String name;
  Address address;
  DateTime established;
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
      established: DateTime.parse(json['established']).toUtc(),
      departments: List<Department>.from(
        json['departments'].map((dept) => Department.fromJson(dept)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'is_active': isActive,
      'name': name,
      'address': address.toJson(),
      'established': established.toIso8601String(),
      'departments': departments.map((dept) => dept.toJson()).toList(),
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
      'street': street,
      'city': city,
      'state': state,
      'postalCode': postalCode,
    };
  }
}

class Department {
  String deptId;
  String name;
  String manager;
  double budget;
  int year;
  Availability? availability;
  String meetingTime;

  Department({
    required this.deptId,
    required this.name,
    required this.manager,
    required this.budget,
    required this.year,
    this.availability,
    required this.meetingTime,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      deptId: json['deptId'],
      name: json['name'],
      manager: json['manager'],
      budget: json['budget'],
      year: json['year'] ?? 0,
      availability: json['availability'] != null
          ? Availability.fromJson(json['availability'])
          : null,
      meetingTime: json['meeting_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deptId': deptId,
      'name': name,
      'manager': manager,
      'budget': budget,
      'year': year,
      'availability': availability?.toJson(),
      'meeting_time': meetingTime,
    };
  }
}

class Availability {
  bool online;
  bool inStore;

  Availability({
    required this.online,
    required this.inStore,
  });

  factory Availability.fromJson(Map<String, dynamic> json) {
    return Availability(
      online: json['online'],
      inStore: json['inStore'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'online': online,
      'inStore': inStore,
    };
  }
}

void main() {
  print(" ************************** FIRST: **************************");
  Map<String, dynamic> json = companyJson['company'];
  Company company = Company.fromJson(json);
  print(company.toJson());
}
