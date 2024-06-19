import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/responsive.dart';

class AddEquipmentCard extends StatefulWidget {
  const AddEquipmentCard(
      {super.key,
      required this.equipmentName,
      required this.equipmentImageUrl,
      required this.noOfMinutes,
      required this.noOfCalories,
      required this.toggleAddEquipment,
      required this.toggleFavEquipment,
      required this.isFav, required this.isAdded});

  final String equipmentName;
  final String equipmentImageUrl;
  final int noOfMinutes;
  final double noOfCalories;
  final Function() toggleAddEquipment;
  final Function() toggleFavEquipment;
  final bool isFav;
  final bool isAdded;

  @override
  State<AddEquipmentCard> createState() => _AddEquipmentCardState();
}

class _AddEquipmentCardState extends State<AddEquipmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
          children: [
            Text(
              widget.equipmentName,
              style: const TextStyle(
                  fontSize: 20,
                  color: kTitleColor,
                  fontWeight: FontWeight.w700),
            ),
            // SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    widget.equipmentImageUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Time : ${widget.noOfMinutes.toString()} minutes",
                        style: const TextStyle(
                            fontSize: 18,
                            color: kLightBlueColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${widget.noOfCalories.toString()} Calories will burn",
                        style: const TextStyle(
                            fontSize: 18,
                            color: kLightBlueColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: kSubContentColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  widget.toggleAddEquipment();
                                },
                                icon: Icon( widget.isAdded ? Icons.remove :
                                  Icons.add,
                                  color: kDarkBlueColor.withOpacity(0.5),

                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: kSubContentColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  widget.toggleFavEquipment();
                                },
                                icon: Icon(widget.isFav? Icons.favorite:
                                    Icons.favorite_border,
                                    color: kRedColor.withOpacity(0.5)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
