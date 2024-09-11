class AddressModel {
  String? addressUrl;
  String? address;
  AddressModel({
    this.addressUrl,
    this.address,
  });
  AddressModel.fromJson(Map<String, dynamic> json) {
    addressUrl = json['addressUrl'];
    address = json['address'];
  }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = {};
    data['addressUrl'] = addressUrl;
    data['address'] = address;
    return data;
  }
}
