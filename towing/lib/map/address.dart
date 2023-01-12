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
}
