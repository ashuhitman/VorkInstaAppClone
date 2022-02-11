import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vorkinsta/models/box_item.dart';
import 'package:vorkinsta/values/app_colors.dart';

class Box extends StatelessWidget {
  final BoxItem item;
  const Box({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        child: Container(
          height: 70,
          color: AppColors.skyBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.numbers.toString(),
                style: const TextStyle(
                    color: AppColors.darkBlue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(item.title,
                  style:
                      const TextStyle(color: AppColors.darkBlue, fontSize: 8))
            ],
          ),
        ),
      ),
    );
  }
}
