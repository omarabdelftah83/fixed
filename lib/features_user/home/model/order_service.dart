class OrderServiceModel {
  final int id;
  final String name;
  final String photo;
  final String detail;

  OrderServiceModel({
    required this.id,
    required this.name,
    required this.photo,
    required this.detail,
  });

  factory OrderServiceModel.fromJson(Map<String, dynamic> json) {
    return OrderServiceModel(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
      detail: json['detal'],
    );
  }


}
