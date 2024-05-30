// ignore_for_file: avoid_print

import '../jsons.dart';
import '../mixin_date_formate.dart';

class CompanyTwo with DateHelper {
  int isActive;
  String name;
  AddressTwo? address;
  String established;
  List<DepartmentTwo> departments;

  CompanyTwo({
    required this.isActive,
    required this.name,
    required this.address,
    required this.established,
    required this.departments,
  });

  factory CompanyTwo.fromJson(Map<String, dynamic> json) {
    return CompanyTwo(
      isActive: json['isActive'],
      name: json['name'],
      address:
          json['address'] == null ? null : AddressTwo.fromJson(json['address']),
      established: json['established'],
      departments: (json['departments'] as List<dynamic>)
          .map((e) => DepartmentTwo.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "is_active": isActive,
      "name": name,
      "address": address?.toJson(),
      "established": established,
      "departments": departments,
    };
  }
}

class AddressTwo {
  String street;
  String city;
  String state;
  String postalCode;

  AddressTwo({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
  });

  factory AddressTwo.fromJson(Map<String, dynamic> json) {
    return AddressTwo(
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

class DepartmentTwo {
  String deptId;
  String name;
  String manager;
  double budget;
  int? year;
  String meetingTime;
  AvailabilityTwo availability;

  DepartmentTwo({
    required this.deptId,
    required this.name,
    required this.manager,
    required this.budget,
    this.year,
    required this.meetingTime,
    required this.availability,
  });

  factory DepartmentTwo.fromJson(Map<String, dynamic> json) {
    return DepartmentTwo(
      deptId: json['deptId'],
      name: json['name'],
      manager: json['manager'],
      budget: json['budget'],
      year: json['year'],
      meetingTime: json['meeting_time'],
      availability: AvailabilityTwo.fromJson(json['availability']),
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

class AvailabilityTwo {
  bool? online;
  bool? inStore;

  AvailabilityTwo({
    required this.online,
    required this.inStore,
  });

  factory AvailabilityTwo.fromJson(Map<String, dynamic>? json) {
    return AvailabilityTwo(
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
  // for the second json
  print(" ************************** SECOND: **************************");

  Map<String, dynamic> json2 = companyJson2['company'];
  CompanyTwo company2 = CompanyTwo.fromJson(json2);
  print(company2.toJson());
  // date review
  String formattedDate = company2.formatDate(json2['established']);
  print(" ************************** DATE: **************************");
  print(formattedDate);
}
