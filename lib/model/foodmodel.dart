class FoodModel {
  String foodID;
  String foodName;
  double foodPrice;
  String foodDescription;
  int foodAmount;
  String foodImage;
  double foodSpace;
  double foodMinute;
  String restaurantID;
  FoodModel(
      this.foodID,
      this.foodName,
      this.foodPrice,
      this.foodDescription,
      this.foodAmount,
      this.foodImage,
      this.foodSpace,
      this.foodMinute,
      this.restaurantID);
  factory FoodModel.fromMap(Map<dynamic, dynamic> map) {
    return FoodModel(
        map["_id"].toString(),
        map["FoodName"].toString(),
        double.parse(map["Price"].toString()),
        map["Description"].toString(),
        int.parse(map["Amount"].toString()),
        map["ImgFood"].toString(),
        double.parse(map["Space"].toString()),
        double.parse(map["Minute"].toString()),
        map["restaurantID"]);
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "_id": foodID,
      "FoodName": foodName,
      "Price": foodPrice,
      "Description": foodDescription,
      "Amount": foodAmount,
      "ImgFood": foodImage,
      "Space": foodSpace,
      "Minute": foodMinute,
      "restaurantID": restaurantID
    };
  }
}
