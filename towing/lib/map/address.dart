class Address {
  String? pickUpPlaceName;
  String? pickUpPlaceId;
  double? pickUpLatitude;
  double? pickUpLongitude;
  String? dropOffPlaceName;
  String? dropOffPlaceId;
  double? dropOffLatitude;
  double? dropOffLongitude;

  Address(
      {this.pickUpPlaceName,
      this.pickUpPlaceId,
      this.pickUpLatitude,
      this.pickUpLongitude,
      this.dropOffPlaceName,
      this.dropOffPlaceId,
      this.dropOffLatitude,
      this.dropOffLongitude});

  factory Address.fromMap(map) {
    return Address(
      pickUpLatitude: map['pickUpLatitude'],
      pickUpLongitude: map['pickUpLongitude'],
      dropOffLatitude: map['dropOffLatitude'],
      dropOffLongitude: map['dropOffLongitude'],

    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'pickUpLatitude': pickUpLatitude,
      'pickUpLongitude': pickUpLongitude,
      'dropOffLatitude': dropOffLatitude,
      'dropOffLongitude': dropOffLongitude,

    };
  }
}

