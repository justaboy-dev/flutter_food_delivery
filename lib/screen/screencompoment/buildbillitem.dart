import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_v1/constant/constant.dart';
import 'package:flutter_food_delivery_v1/model/billviewmodel.dart';
import 'package:flutter_food_delivery_v1/screen/orderscreen/orderscreen.dart';
import 'package:flutter_food_delivery_v1/service/appservice.dart';
import 'package:get/get.dart';

class BuildBillItem extends StatelessWidget {
  const BuildBillItem({Key? key, required this.bill, required this.index})
      : super(key: key);

  final BillViewModel bill;
  final int index;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      delay: Duration(milliseconds: 300 * index),
      child: GestureDetector(
        onTap: () => Get.to(() => const OrderScreen(),
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 400),
            transition: Transition.rightToLeftWithFade,
            arguments: bill.billID),
        child: SizedBox(
          height: 140,
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(bill.restaurantImage),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: size.width * 0.58,
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bill.restaurantName,
                      style: const TextStyle(fontSize: defautfontsize + 1),
                      softWrap: true,
                    ),
                    const Spacer(),
                    Text(
                      AppService().toMoney(bill.cash) + " VNĐ",
                      style: const TextStyle(fontSize: defautfontsize + 5),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          "Số món: " + bill.foodAmout.toString(),
                          style: const TextStyle(fontSize: defautfontsize),
                        ),
                        const Spacer(),
                        const Text(
                          "Trạng thái: ",
                          style: TextStyle(
                            fontSize: defautfontsize,
                          ),
                        ),
                        Text(
                          bill.status,
                          style: TextStyle(
                              fontSize: defautfontsize,
                              fontWeight: FontWeight.bold,
                              color: bill.status == "Cancel"
                                  ? Colors.red
                                  : Colors.green),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
