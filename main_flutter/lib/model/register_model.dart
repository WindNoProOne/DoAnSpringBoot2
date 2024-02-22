class RegisterModel {
  final String? id;
  final String? email;
  final String? password;
  final String? fullname;
  final String? address;
  final String? phone_number;
  final String? retype_password;
  final DateTime? date_of_birth;
  final String? facebook_account_id;
  final String? google_account_id;
  final String? role_id;
  final String? token;

  RegisterModel({
    required this.id,
    required this.email,
    required this.password,
    required this.fullname,
    required this.address,
    required this.phone_number,
    required this.retype_password,
    required this.date_of_birth,
    required this.facebook_account_id,
    required this.google_account_id,
    required this.role_id,
    required this.token,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      fullname: json['fullname'],
      address: json['address'],
      phone_number: json['phone_number'],
      retype_password: json['retype_password'],
      date_of_birth: json['date_of_birth'] != null
          ? DateTime.parse(json['date_of_birth'])
          : null,
      facebook_account_id: json['facebook_account_id'] ?? 0, // Default value: 0
      google_account_id: json['google_account_id'] ?? 0, // Default value: 0
      role_id: json['role_id'] ?? 1, // Default value: 1
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      'email': email,
      'password': password,
      'fullname': fullname,
      'address': address,
      'phone_number': phone_number,
      'retype_password': retype_password,
      'date_of_birth': date_of_birth?.toIso8601String(),
      'facebook_account_id': facebook_account_id,
      'google_account_id': google_account_id,
      'role_id': role_id,
      'token': token,
    };
  }
}
