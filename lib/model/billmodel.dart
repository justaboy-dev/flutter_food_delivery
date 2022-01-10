class BillModel {
  String? billId;
  String userID;
  String restaurantID;
  String? driverID;
  String status;
  double cash;
  double rate;
  List<FoodId> foodID;

  BillModel(this.billId, this.userID, this.restaurantID, this.driverID,
      this.status, this.cash, this.foodID, this.rate);
  factory BillModel.fromMap(Map<String, dynamic> map) {
    List<FoodId> list =
        List<FoodId>.from(map["Food"].map((e) => FoodId.fromMap(e)));
    return BillModel(
        map["_id"],
        map["UserID"],
        map["RestaurantID"],
        map["DriverID"] ?? "",
        map["Status"],
        double.parse(map["Cash"].toString()),
        list,
        double.parse(map["Rate"].toString()));
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "_id": billId,
      "UserID": userID,
      "RestaurantID": restaurantID,
      "DriverID": driverID,
      "Status": status,
      "Cash": cash,
      "Food": foodID.map((e) => e.toMap()).toList(),
      "Rate": rate,
    };
  }
}

class FoodId {
  String foodID;
  int amount;
  FoodId(this.foodID, this.amount);
  factory FoodId.fromMap(Map<String, dynamic> map) {
    return FoodId(map["FoodID"], map["FoodAmount"]);
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "FoodID": foodID,
      "FoodAmount": amount,
    };
  }
}
