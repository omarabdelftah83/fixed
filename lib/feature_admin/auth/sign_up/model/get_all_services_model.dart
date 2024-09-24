class GetAllServicesModel{
  final int id;
  final String name;
  final String photo;
  final String detal;

  GetAllServicesModel({
    required this.id,
    required this.name,
    required this.photo,
    required this.detal,
  });

  factory GetAllServicesModel.fromJson(Map<String, dynamic> json) {
    return GetAllServicesModel(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
      detal: json['detal'],
    );
  }

}
