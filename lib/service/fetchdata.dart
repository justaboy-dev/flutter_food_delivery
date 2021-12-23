import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/model/addressmodel.dart';
import 'package:flutter_food_delivery_v1/model/billmodel.dart';
import 'package:flutter_food_delivery_v1/model/foodmodel.dart';
import 'package:flutter_food_delivery_v1/model/restaurantmodel.dart';
import 'package:flutter_food_delivery_v1/model/usermodel.dart';

class FetchData {
  List<UserModel> listUser = [];
  List<RestaurantModel> listRestaurant = [];
  List<BillModel> listBill = [];
  final List<RestaurantModel> tempRestaurant = [
    RestaurantModel(
        "R1",
        "Dao Hoa Vien",
        const TimeOfDay(hour: 9, minute: 0),
        1.3,
        [
          FoodModel(
              "F1",
              "Rau muong xao",
              19000,
              "Rong xanh vuot dai duong",
              1,
              "https://anv.vn/wp-content/uploads/2020/12/tra-dao-e1617079976149.jpg",
              0),
          FoodModel(
              "F2",
              "Rau muong xao toi",
              19000,
              "Rong xanh vuot dai duong",
              1,
              "https://anv.vn/wp-content/uploads/2020/12/tra-dao-e1617079976149.jpg",
              0),
          FoodModel(
              "F3",
              "Rau muong xao me",
              19000,
              "Rong xanh vuot dai duong",
              1,
              "https://anv.vn/wp-content/uploads/2020/12/tra-dao-e1617079976149.jpg",
              0),
          FoodModel(
              "F4",
              "Rau muong xao chanh",
              19000,
              "Rong xanh vuot dai duong",
              1,
              "https://anv.vn/wp-content/uploads/2020/12/tra-dao-e1617079976149.jpg",
              0),
          FoodModel(
              "F5",
              "Rau muong xao tac",
              19000,
              "Rong xanh vuot dai duong",
              1,
              "https://anv.vn/wp-content/uploads/2020/12/tra-dao-e1617079976149.jpg",
              0),
        ],
        "https://danangjob.vn/Upload/Member/20191218112653.png",
        0),
    RestaurantModel(
        "R2",
        "Thang Thien Res",
        const TimeOfDay(hour: 9, minute: 0),
        2.7,
        [
          FoodModel("F1", "Rau muong xao", 19000, "Rong xanh vuot dai duong", 1,
              "https://danangjob.vn/Upload/Member/20191218112653.png", 0),
          FoodModel(
              "F2",
              "Rau muong xao toi",
              19000,
              "Rong xanh vuot dai duong",
              1,
              "https://danangjob.vn/Upload/Member/20191218112653.png",
              0),
          FoodModel("F3", "Rau muong xao me", 19000, "Rong xanh vuot dai duong",
              1, "https://danangjob.vn/Upload/Member/20191218112653.png", 0),
          FoodModel(
              "F4",
              "Rau muong xao chanh",
              19000,
              "Rong xanh vuot dai duong",
              1,
              "https://danangjob.vn/Upload/Member/20191218112653.png",
              0),
          FoodModel(
              "F5",
              "Rau muong xao tac",
              19000,
              "Rong xanh vuot dai duong",
              1,
              "https://danangjob.vn/Upload/Member/20191218112653.png",
              0),
        ],
        "https://danangjob.vn/Upload/Member/20191218112653.png",
        0),
    RestaurantModel(
        "R3",
        "Thang Thien Res",
        const TimeOfDay(hour: 9, minute: 0),
        3.4,
        [
          FoodModel("F1", "Rau muong xao", 19000, "Rong xanh vuot dai duong", 1,
              "https://danangjob.vn/Upload/Member/20191218112653.png", 0),
          FoodModel(
              "F2",
              "Rau muong xao toi",
              19000,
              "Rong xanh vuot dai duong",
              1,
              "https://danangjob.vn/Upload/Member/20191218112653.png",
              0),
          FoodModel("F3", "Rau muong xao me", 19000, "Rong xanh vuot dai duong",
              1, "https://danangjob.vn/Upload/Member/20191218112653.png", 0),
          FoodModel(
              "F4",
              "Rau muong xao chanh",
              19000,
              "Rong xanh vuot dai duong",
              1,
              "https://danangjob.vn/Upload/Member/20191218112653.png",
              0),
          FoodModel(
              "F5",
              "Rau muong xao tac",
              19000,
              "Rong xanh vuot dai duong",
              1,
              "https://danangjob.vn/Upload/Member/20191218112653.png",
              0),
        ],
        "https://danangjob.vn/Upload/Member/20191218112653.png",
        0),
    RestaurantModel(
        "R4",
        "Thang Thien Res",
        const TimeOfDay(hour: 9, minute: 0),
        4.2,
        [
          FoodModel("F1", "Rau muong xao", 19000, "Rong xanh vuot dai duong", 1,
              "https://danangjob.vn/Upload/Member/20191218112653.png", 0),
          FoodModel(
              "F2",
              "Rau muong xao toi",
              19000,
              "Rong xanh vuot dai duong",
              1,
              "https://danangjob.vn/Upload/Member/20191218112653.png",
              0),
          FoodModel("F3", "Rau muong xao me", 19000, "Rong xanh vuot dai duong",
              1, "https://danangjob.vn/Upload/Member/20191218112653.png", 0),
          FoodModel(
              "F4",
              "Rau muong xao chanh",
              19000,
              "Rong xanh vuot dai duong",
              1,
              "https://danangjob.vn/Upload/Member/20191218112653.png",
              0),
          FoodModel(
              "F5",
              "Rau muong xao tac",
              19000,
              "Rong xanh vuot dai duong",
              1,
              "https://danangjob.vn/Upload/Member/20191218112653.png",
              0),
        ],
        "https://danangjob.vn/Upload/Member/20191218112653.png",
        0),
    RestaurantModel(
        "R5",
        "Thang Thien Res",
        const TimeOfDay(hour: 9, minute: 0),
        5,
        [
          FoodModel("F1", "Rau muong xao", 19000, "Rong xanh vuot dai duong", 1,
              "https://danangjob.vn/Upload/Member/20191218112653.png", 0),
          FoodModel(
              "F2",
              "Rau muong xao toi",
              19000,
              "Rong xanh vuot dai duong",
              1,
              "https://danangjob.vn/Upload/Member/20191218112653.png",
              0),
          FoodModel("F3", "Rau muong xao me", 19000, "Rong xanh vuot dai duong",
              1, "https://danangjob.vn/Upload/Member/20191218112653.png", 0),
          FoodModel(
              "F4",
              "Rau muong xao chanh",
              19000,
              "Rong xanh vuot dai duong",
              1,
              "https://danangjob.vn/Upload/Member/20191218112653.png",
              0),
          FoodModel(
              "F5",
              "Rau muong xao tac",
              19000,
              "Rong xanh vuot dai duong",
              1,
              "https://danangjob.vn/Upload/Member/20191218112653.png",
              0),
        ],
        "https://danangjob.vn/Upload/Member/20191218112653.png",
        0),
  ];

  final List<UserModel> tempUser = [
    UserModel(
      "U1",
      "Trong",
      "Tan",
      "5f4dcc3b5aa765d61d8327deb882cf99",
      "0949990099",
      "https://haycafe.vn/wp-content/uploads/2021/11/Anh-avatar-dep-chat-lam-hinh-dai-dien.jpg",
      true,
      Address(
          10.7968047, 106.758861, "475, Dien Bien Phu, P. 25, Quan Binh Thanh"),
    ),
    UserModel(
      "U2",
      "Trong",
      "Lan",
      "5f4dcc3b5aa765d61d8327deb882cf99",
      "0949990099",
      "https://haycafe.vn/wp-content/uploads/2021/11/Anh-avatar-dep-chat-lam-hinh-dai-dien.jpg",
      true,
      Address(
          10.7968047, 106.758861, "475, Dien Bien Phu, P. 25, Quan Binh Thanh"),
    ),
    UserModel(
      "U3",
      "Trong",
      "Ha",
      "5f4dcc3b5aa765d61d8327deb882cf99",
      "0949990099",
      "https://haycafe.vn/wp-content/uploads/2021/11/Anh-avatar-dep-chat-lam-hinh-dai-dien.jpg",
      true,
      Address(
          10.7968047, 106.758861, "475, Dien Bien Phu, P. 25, Quan Binh Thanh"),
    ),
  ];

  final List<BillModel> tempBill = [
    BillModel(
      "U1",
      "R1",
      "U2",
      "Booking",
      76000,
      [
        FoodModel(
            "F5",
            "Rau muong xao tac",
            19000,
            "Rong xanh vuot dai duong",
            4,
            "https://vietblend.vn/wp-content/uploads/2016/10/vb.web-tra-dao.jpg",
            0),
      ],
    ),
    BillModel(
      "U3",
      "R2",
      "U2",
      "Booking",
      76000,
      [
        FoodModel(
            "F5",
            "Rau muong xao tac",
            19000,
            "Rong xanh vuot dai duong",
            4,
            "https://vietblend.vn/wp-content/uploads/2016/10/vb.web-tra-dao.jpg",
            0),
      ],
    ),
  ];

  Future<List<UserModel>> fetchUser() async {
    await Future.delayed(const Duration(seconds: 3));
    return tempUser;
  }

  Future<List<RestaurantModel>> fetchRestaurant() async {
    await Future.delayed(const Duration(seconds: 3));
    return tempRestaurant;
  }

  Future<List<BillModel>> fetchBill() async {
    await Future.delayed(const Duration(seconds: 3));
    return tempBill;
  }

  Future<UserModel> getCurrentUser() async {
    await Future.delayed(const Duration(seconds: 3));
    return tempUser.first;
  }
}
