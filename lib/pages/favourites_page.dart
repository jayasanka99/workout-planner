import 'package:flutter/material.dart';
import 'package:workout_planner_app/constants/responsive.dart';
import 'package:workout_planner_app/models/exercise_model.dart';

import '../constants/colors.dart';
import '../data/user_data.dart';
import '../models/equipment_model.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  final userData = user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello ${userData.fullName}",
                  style: const TextStyle(
                      fontSize: 25,
                      color: kTitleColor,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Here are all your favourite Workouts",
                  style: TextStyle(fontSize: 20, color: kLightBlueColor),
                ),
                const SizedBox(height: 30),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: userData.favExerciseList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPadding,
                    crossAxisSpacing: kDefaultPadding,
                  ),
                  itemBuilder: (context, index) {
                    Exercise favExercise = userData.favExerciseList[index];
                    return Card(
                      color: kCardBackgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Column(
                          children: [
                            Text(
                              favExercise.exerciseName,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: kTitleColor,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 15),
                            Image.asset(
                              favExercise.exerciseImageUrl,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "${favExercise.noOfMinutes.toString()} minutes",
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: kLightBlueColor,
                                  fontWeight: FontWeight.bold),
                            )
                            // Text(userData.favExerciseList[index].equipmentName),
                          ],
                        ),
                      ),
                    );
                  },
                ),const SizedBox(height: 20),
                const Text(
                  "Here are all your favourite Equipments",
                  style: TextStyle(fontSize: 20, color: kLightBlueColor),
                ),
                const SizedBox(height: 30),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: userData.favEquipmentList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 5/6,
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPadding,
                    crossAxisSpacing: kDefaultPadding,
                  ),
                  itemBuilder: (context, index) {
                    Equipment favEquipmentList = userData.favEquipmentList[index];
                    return Card(
                      color: kCardBackgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Column(
                          children: [
                            Text(
                              favEquipmentList.equipmentName,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: kTitleColor,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 15),
                            Image.asset(
                              favEquipmentList.equipmentImageUrl,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "${favEquipmentList.noOfMinutes.toString()} minutes",
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: kLightBlueColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "${favEquipmentList.noOfCalories.toString()} calories",
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: kRedColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            // Text(userData.favExerciseList[index].equipmentName),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
