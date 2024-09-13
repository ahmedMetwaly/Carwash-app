class ServicesPlan {
  String? title;
  String? price;

  ServicesPlan({
    this.title,
    this.price,
  });
  ServicesPlan.toInitial(){
    title= "";
    price="";
  }
  ServicesPlan.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['price'] = price;

    return data;
  }
}
