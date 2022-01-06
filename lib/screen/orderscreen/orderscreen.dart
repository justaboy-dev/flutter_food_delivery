import 'package:flutter/material.dart';

class OrderSreen extends StatelessWidget {
  const OrderSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(),
          )
        ],
      ),
    );
  }
}
