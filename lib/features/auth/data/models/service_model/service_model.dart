class ServicesPlan {
  String? title;
  List<String>? services;
  String? price;

  ServicesPlan({
    this.title,
    this.services,
    this.price,
  });
  ServicesPlan.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    services = json['services'].cast<String>();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['price'] = price;
    data['services'] = services;

    return data;
  }
}
