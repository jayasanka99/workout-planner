import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';
import '../constants/responsive.dart';
import '../models/equipment_model.dart';
import '../widgets/equipment_card.dart';

class EquipmentDetailsPage extends StatefulWidget {
  const EquipmentDetailsPage(
      {super.key,
      required this.equipmentDescription,
      required this.equipmentList});

  final String equipmentDescription;
  final List<Equipment> equipmentList;

  @override
  State<EquipmentDetailsPage> createState() => _EquipmentDetailsPageState();
}

class _EquipmentDetailsPageState extends State<EquipmentDetailsPage> {
  final DateFormat dateFormat = DateFormat('EEEE, MMMM dd');

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final String formattedDate = dateFormat.format(now);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedDate,
              style: const TextStyle(
                fontSize: 20,
                color: kSubContentColor,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              "Equipment",
              style: TextStyle(
                fontSize: 25,
                color: kTitleColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Text(
                "When it comes to gym equipment, there are a ton of different brands, types, and styles of equipment; "
                "it can get a little overwhelming. From treadmills and rowing machines to adjustable dumbbells and kettlebells,"
                " a fitness business often requires a lot of different types of equipment to create the very best member "
                "experience.",
                style: TextStyle(fontSize: 18, color: kMainContentColor),
              ),
              const SizedBox(height: 20),
              // EquipmentCard(equipmentName: "Dumbbells", equipmentDescription: "Dumbbells can be used for many different purposes.", equipmentImageUrl: "assets/images/dumbbells.png", noOfMinutes: 0, noOfCalories: 0,),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                childAspectRatio: 16 /13,),
                itemCount: widget.equipmentList.length,
                itemBuilder: (context, index) {
                  Equipment equipment = widget.equipmentList[index];
                  return Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: EquipmentCard(
                      equipmentName: equipment.equipmentName,
                      equipmentDescription:
                      equipment.equipmentDescription,
                      equipmentImageUrl:
                      equipment.equipmentImageUrl,
                      noOfMinutes: equipment.noOfMinutes,
                      noOfCalories: equipment.noOfCalories,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
