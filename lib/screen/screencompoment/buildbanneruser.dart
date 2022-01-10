import 'dart:convert';

import 'package:flutter/material.dart';

class BuildBannerUser extends StatelessWidget {
  const BuildBannerUser({
    Key? key,
    required this.name,
    required this.address,
    required this.image,
    this.imageBase64 = "",
  }) : super(key: key);

  final String name;
  final String address;
  final String image;
  final String imageBase64;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  address,
                  softWrap: true,
                ),
                const Spacer(),
              ],
            ),
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: Container(
              height: 80,
              width: 80,
              child: imageBase64.isNotEmpty
                  ? Image.memory(
                      base64Decode(
                        imageBase64.toString(),
                      ),
                      fit: BoxFit.cover,
                    )
                  : null,
              decoration: BoxDecoration(
                  image: image.isNotEmpty
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(image),
                        )
                      : null),
            ),
          )
        ],
      ),
    );
  }
}
