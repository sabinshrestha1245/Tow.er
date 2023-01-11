class OrderRequestModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? phone;
  String? role;
  String? pickup;
  String? dropoff;
  String? status;
  String? type;
  String? servicediscription;
  String? carmodel;
  String? plate;
  String? remarks;
  String? date;
  String? time;

  OrderRequestModel({
    this.uid,
    this.firstName,
    this.lastName,
    this.phone,
    this.role,
    this.pickup,
    this.dropoff,
    this.status,
    this.type,
    this.servicediscription,
    this.carmodel,
    this.plate,
    this.remarks,
    this.date,
    this.time,
  });

  // receiving data from server
  factory OrderRequestModel.fromMap(map) {
    return OrderRequestModel(
        uid: map['uid'],
        firstName: map['firstName'],
        lastName: map['lastName'],
        phone: map['phone'],
        role: map['role'],
        pickup: map['pickup'],
        dropoff: map['dropoff'],
        status: map['status'],
        type: map['type'],
        servicediscription: map['servicediscription'],
        carmodel: map['carmodel'],
        plate: map['plate'],
        remarks: map['remarks'],
        date: map['date'],
        time: map['time']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'role': role,
      'pickup': pickup,
      'dropoff': dropoff,
      'status': status,
      'type': type,
      'servicediscription': servicediscription,
      'carmodel': carmodel,
      'plate': plate,
      'remarks': remarks,
      'date': date,
      'time': time,





    };
  }
}
