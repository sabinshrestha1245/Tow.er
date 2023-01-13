class RequestTowOrder {
  String? uid;
  String? firstName;
  String? lastName;
  String? phone;
  String? pickUplocation;
  String? dropOfflocation;
  String? carModel;
  String? carPlateNo;
  String? remarks;
  String? date;
  String? time;

  RequestTowOrder(
      {this.uid,
      this.firstName,
      this.lastName,
      this.phone,
      this.pickUplocation,
      this.dropOfflocation,
      this.carModel,
      this.carPlateNo,
      this.remarks,
      this.date,
      this.time});
}
