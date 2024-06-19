import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner_app/constants/responsive.dart';
import 'package:workout_planner_app/data/user_data.dart';
import 'package:workout_planner_app/models/exercise_model.dart';

import '../constants/colors.dart';
import '../models/equipment_model.dart';
import '../widgets/profile_card.dart';
import '../widgets/progrss_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final userData = user;

  // final List<Exercise> exerciseList = user.exerciseList;
  final DateFormat dateFormat = DateFormat('EEEE, MMMM dd');

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    final String formattedDate = dateFormat.format(dateTime);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedDate,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kSubContentColor),
                ),
                Text(
                  "Hello ${userData.fullName}",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                 ProgressCard(progressValue: userData.totalCaloriesBurnedCalculation(), total: 100),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kSubContentColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Minutes Spend : ${userData.calculateTotalMinutesSpend().toString()}",
                          style: const TextStyle(
                              fontSize: 22,
                              color: kLightBlueColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Total Exercises Completed : ${userData.totalExercisesCompleted.toString()}",
                          style: const TextStyle(fontSize: 18, color: kTitleColor),
                        ),
                        Text(
                          "Total Equipment Handover : ${userData.totalEquipmentHandOver.toString()}",
                          style: const TextStyle(fontSize: 18, color: kTitleColor),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Your Exercises",
                  style: TextStyle(
                      fontSize: 20,
                      color: kLightBlueColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: userData.exerciseList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    Exercise exercise = userData.exerciseList[index];
                    return ProfileCard(
                      markAsDone: () {
                        setState(() {
                          userData.completedExercise(exercise.id);
                        });
                      },
                      exerciseName: exercise.exerciseName,
                      exerciseImageUrl: exercise.exerciseImageUrl,
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Your Equipments",
                  style: TextStyle(
                      fontSize: 20,
                      color: kLightBlueColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: userData.equipmentList.length,
                  itemBuilder: (context, index) {
                    Equipment equipment = userData.equipmentList[index];
                    return ProfileCard(
                      markAsDone: () {
                        setState(() {
                          userData.handOverEquipment(equipment.id);
                        });
                      },
                      exerciseName: equipment.equipmentName,
                      exerciseImageUrl: equipment.equipmentImageUrl,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
