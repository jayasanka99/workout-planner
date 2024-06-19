import 'package:flutter/material.dart';
import 'package:workout_planner_app/constants/responsive.dart';

import '../constants/colors.dart';

class EquipmentCard extends StatelessWidget {
  const EquipmentCard(
      {super.key,
      required this.equipmentName,
      required this.equipmentDescription,
      required this.equipmentImageUrl,
      required this.noOfMinutes,
      required this.noOfCalories});

  final String equipmentName;
  final String equipmentDescription;
  final String equipmentImageUrl;
  final int noOfMinutes;
  final double noOfCalories;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 250,
      decoration: BoxDecoration(
        color: kSubContentColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(
              equipmentName,
              style: const TextStyle(
                  fontSize: 20, color: kTitleColor, fontWeight: FontWeight.w700),
            ),
            // SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(equipmentImageUrl,width: 80,height: 80,fit: BoxFit.cover,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${noOfMinutes.toString()} of workout",style: const TextStyle(fontSize: 18, color: kLightBlueColor,fontWeight: FontWeight.bold),),
                      Text("${noOfCalories.toString()} Calories will burn",style: const TextStyle(fontSize: 18, color: kLightBlueColor,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),
            ),
            Text("Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
              style: TextStyle(fontSize: 18, color: kMainContentColor),),
          ],
        ),
      ),
    );
  }
}
