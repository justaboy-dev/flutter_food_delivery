class FoodModel {
  String foodID;
  String foodName;
  double foodPrice;
  String foodDescription;
  int foodAmount;
  String foodImage;
  double foodSpace;
  double foodMinute;
  FoodModel(this.foodID, this.foodName, this.foodPrice, this.foodDescription,
      this.foodAmount, this.foodImage, this.foodSpace, this.foodMinute);
  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      map["foodID"],
      map["foodName"],
      map["foodPrice"],
      map["foodDescription"],
      map["foodAmount"],
      map["foodImage"],
      map["foodSpace"],
      map["foodMinute"],
    );
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "foodID": foodID,
      "foodName": foodName,
      "foodPrice": foodPrice,
      "foodDescription": foodDescription,
      "foodAmount": foodAmount,
      "foodImage": foodImage,
      "foodSpace": foodSpace,
      "foodMinute": foodMinute,
    };
  }
}
