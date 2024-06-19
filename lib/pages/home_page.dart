import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner_app/constants/colors.dart';
import 'package:workout_planner_app/constants/responsive.dart';
import 'package:workout_planner_app/data/exercise_data.dart';
import 'package:workout_planner_app/models/equipment_model.dart';
import 'package:workout_planner_app/pages/exercise_details_page.dart';
import 'package:workout_planner_app/pages/stretching_page.dart';
import 'package:workout_planner_app/pages/warmup_details_page.dart';

import '../data/equipment_data.dart';
import '../data/user_data.dart';
import '../models/exercise_model.dart';
import '../widgets/exercise_card.dart';
import '../widgets/progrss_card.dart';
import 'equipment_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DateFormat dateFormat = DateFormat('EEEE, MMMM dd');
  final userData = user;
  final List<Exercise> exercises = ExerciseData().exerciseList;
  final List<Equipment> equipment = EquipmentData().equipmentList;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final String formattedDate = dateFormat.format(now);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(formattedDate,
                    style: const TextStyle(
                        fontSize: 20,
                        color: kSubContentColor,
                        fontWeight: FontWeight.w500)),
                Text("Hello, ${userData.fullName}",
                    style: const TextStyle(
                        fontSize: 25,
                        color: kTitleColor,
                        fontWeight: FontWeight.w700)),
                const SizedBox(
                  height: 20,
                ),
                const ProgressCard(progressValue: 0.3, total: 100),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Today’s Activity",
                  style: TextStyle(
                      fontSize: 20,
                      color: kTitleColor,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WarmupDetailsPage(
                              title: "Warmup",
                              description:
                                  "Warm-up exercises are simple exercises that can be used to prepare the body for ",
                              exercisesList: exercises,
                            ),
                          ),
                        );
                      },
                      child: const ExerciseCard(
                          title: "Warmup",
                          description: "see more...",
                          imageUrl: "assets/images/exercises/cobra.png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EquipmentDetailsPage(
                              equipmentDescription:
                                  "Exercise is a subset of physical activity that is planned, structured, and "
                                  "repetitive and has as a final or an intermediate objective the improvement or"
                                  " maintenance of physical fitness. Physical fitness is a set of attributes that are "
                                  "either health- or skill-related.",
                              equipmentList: equipment,
                            ),
                          ),
                        );
                      },
                      child: const ExerciseCard(
                          title: "Equipment",
                          description: "see more...",
                          imageUrl: "assets/images/equipments/dumbbells2.png"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              title: "Exercises",
                              description:
                                  "Exercise is a subset of physical activity that is planned, structured, and "
                                  "repetitive and has as a final or an intermediate objective the improvement or"
                                  " maintenance of physical fitness. Physical fitness is a set of attributes that are "
                                  "either health- or skill-related.",
                              exercisesList: exercises,
                            ),
                          ),
                        );
                      },
                      child: const ExerciseCard(
                          title: "Exercise",
                          description: "see more...",
                          imageUrl: "assets/images/exercises/hunch_back.png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StretchingPage(
                              title: "Stretching",
                              description:
                                  "Welcome to our travel app, your ultimate guide to discovering captivating destinations "
                                  "around the globe! Whether you're seeking the "
                                  "tranquility visit offers something for every traveler.",
                              exercisesList: exercises,
                            ),
                          ),
                        );
                      },
                      child: const ExerciseCard(
                          title: "Stretching",
                          description: "see more...",
                          imageUrl:
                              "assets/images/equipments/skipping-rope.png"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
