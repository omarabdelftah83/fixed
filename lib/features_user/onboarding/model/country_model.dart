class RequestCountryModel {
  final String lan;
  final String country;

  RequestCountryModel({
    required this.lan,
    required this.country,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};

    if (lan != null && lan!.isNotEmpty) {
      data['lan'] = lan;
    }
    if (country != null && country!.isNotEmpty) {
      data['country'] = country;
    }

    return data;

  }


}
