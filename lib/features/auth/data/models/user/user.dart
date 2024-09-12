
import '../address/address_model.dart';
import '../appointment_model/appointment_model.dart';

class UserModel {
  String? uid;
  String? name;
  String? email;
  String? imageUrl;
  String? password;
  String? phoneNumber;
  AddressModel? address;
  AppointmentModelAuth? appointment;

  UserModel(
      {this.uid,
      required this.name,
      required this.email,
      required this.imageUrl,
      required this.password,
      this.phoneNumber,
      this.address,
      this.appointment,
      });
  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    password = json["password"];
    imageUrl = json["imageUrl"];
    phoneNumber = json["phoneNumber"];
    address = AddressModel.fromJson(json['address']);
    appointment = AppointmentModelAuth.fromJson(json["appointement"]);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["uid"] = uid;
    data["name"] = name;
    data["email"] = email;
    data["password"] = password;
    data["imageUrl"] = imageUrl;
    data["phoneNumber"] = phoneNumber;
    data["address"] = address!.toJson();
    data["appointement"] = appointment!.toJson();
    return data;
  }
}
