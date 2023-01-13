class LocationModel {
  String? PickUpLat;
  String? PickUpLong;
  String? DropOffLat;
  String? DropOffLong;

  LocationModel(
      {this.PickUpLat, this.PickUpLong, this.DropOffLat, this.DropOffLong});

  // receiving data from server
  factory LocationModel.fromMap(map) {
    return LocationModel(
      PickUpLat: map['PickUpLat'],
      PickUpLong: map['PickUpLong'],
      DropOffLat: map['DropOffLat'],
      DropOffLong: map['DropOffLong'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'PickUpLat': PickUpLat,
      'PickUpLong': PickUpLong,
      'DropOffLat': DropOffLat,
      'DropOffLong': DropOffLong,
    };
  }
}
