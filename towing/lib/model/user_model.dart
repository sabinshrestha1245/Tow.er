class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? phone;
  String? role;

  UserModel({this.uid, this.email, this.firstName, this.lastName, this.phone, this.role});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      role: map['user'],
      phone: map['phone'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'role' : 'user',
      'phone' : phone,
    };
  }
}