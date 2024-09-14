import 'package:carwashapp/features/auth/data/models/address/address_model.dart';
import 'package:carwashapp/features/auth/data/models/service_model/service_model.dart';

class AppointmentModelAuth {
  String? date;
  String? time;
  AddressModel? address;
  String? paymentMethod;
  String? carType;
  ServicesPlan? services;
  AppointmentModelAuth.toInitial() {
    date = '';
    time = '';
    address = AddressModel.toInitial();
    // carType = '';
    paymentMethod = '';
    services = ServicesPlan.toInitial();
  }
  AppointmentModelAuth(
      {this.date,
      this.time,
      this.address,
      this.paymentMethod,
      this.carType,
      this.services});
  AppointmentModelAuth.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    address = AddressModel.fromJson(json['address']);
    paymentMethod = json["paymentMethod"];
    carType = json["carType"];
    services = ServicesPlan.fromJson(json['services']);
    address = AddressModel.fromJson(json['address']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["date"] = date;
    data["time"] = time;
    if (address != null) {
      data["address"] = address!.toJson();
    }
    data["paymentMethod"] = paymentMethod;
    data["carType"] = carType;
    if (services != null) {
      data["services"] = services!.toJson();
    }

    return data;
  }
}
