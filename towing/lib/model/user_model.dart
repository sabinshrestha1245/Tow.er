class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? phone;
  String? role;
  String? password;

  UserModel({this.uid, this.email, this.firstName, this.lastName, this.phone, this.role, this.password});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      phone: map['phone'],
      role: map['role'],
      password: map['password'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phone' : phone,
      'role' : role,
      'password': password,
    };
  }
}