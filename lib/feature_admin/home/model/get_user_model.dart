class GetUserModel {
  final int? id;
  final String? password;
  final DateTime? lastLogin;
  final bool? isSuperuser;
  final String? username;
  final String? firstName;
  final String? lastName;
  final bool? isStaff;
  final bool? isActive;
  final DateTime? dateJoined;
  final String? email;
  final bool? providesServices;
  final bool? requestServices;
  final String? phone;
  final String? country;
  final String? location;
  final String? lan;
  final String? name;
  final List<dynamic>? groups;
  final List<dynamic>? userPermissions;

  GetUserModel({
     this.id,
     this.password,
    this.lastLogin,
     this.isSuperuser,
     this.username,
     this.firstName,
     this.lastName,
     this.isStaff,
     this.isActive,
     this.dateJoined,
     this.email,
     this.providesServices,
     this.requestServices,
     this.phone,
     this.country,
     this.location,
     this.lan,
     this.name,
     this.groups,
     this.userPermissions,
  });

  factory GetUserModel.fromJson(Map<String, dynamic> json) {
    return GetUserModel(
      id: json['id'],
      password: json['password'],
      lastLogin: json['last_login'] != null ? DateTime.parse(json['last_login']) : null,
      isSuperuser: json['is_superuser'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      isStaff: json['is_staff'],
      isActive: json['is_active'],
      dateJoined: json['date_joined'] != null ? DateTime.parse(json['date_joined']) : null,
      email: json['email'],
      providesServices: json['Provides_services'], // Correctly mapped
      requestServices: json['request_services'],   // Correctly mapped
      phone: json['phone'],
      country: json['country'],
      location: json['location'],
      lan: json['lan'],
      name: json['name'],
      groups: List<dynamic>.from(json['groups']),
      userPermissions: List<dynamic>.from(json['user_permissions']),
    );
  }

}
