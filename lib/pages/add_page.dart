import 'package:flutter/material.dart';
import 'package:workout_planner_app/data/equipment_data.dart';
import 'package:workout_planner_app/models/exercise_model.dart';
import '../constants/colors.dart';
import '../constants/responsive.dart';
import '../data/exercise_data.dart';
import '../data/user_data.dart';
import '../models/equipment_model.dart';
import '../widgets/add_equipment_card.dart';
import '../widgets/add_exercise_card.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    super.key,
  });

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final userData = user;
  final List<Exercise> exercisesList = ExerciseData().exerciseList;
  final List<Equipment> equipmentList = EquipmentData().equipmentList;

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
                  "Lets Add Some Workouts and Equipment for today!",
                  style: TextStyle(fontSize: 20, color: kLightBlueColor),
                ),
                const SizedBox(height: 30),
                const Text(
                  "All Exercises",
                  style: TextStyle(
                      fontSize: 20,
                      color: kTitleColor,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.225,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: exercisesList.length,
                    itemBuilder: (context, index) {
                      Exercise exercise = exercisesList[index];
                      return AddExerciseCard(
                        isFav: userData.favExerciseList.contains(exercise),
                        isAdded: userData.exerciseList.contains(exercise),
                        exerciseName: exercise.exerciseName,
                        imageUrl: exercise.exerciseImageUrl,
                        noOfMinutes: "${exercise.noOfMinutes} minutes",
                        toggleAddExercise: () {
                          setState(() {
                            if (userData.exerciseList.contains(exercise)) {
                              userData.removeExercise(exercise);
                            } else {
                              userData.addExercise(exercise);
                            }
                          });
                        },
                        toggleFavExercise: () {
                          setState(() {
                            if (userData.favExerciseList.contains(exercise)) {
                              userData.removeFavExercise(exercise);
                            } else {
                              userData.addFavExercise(exercise);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "All Equipment",
                  style: TextStyle(
                      fontSize: 20,
                      color: kTitleColor,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: equipmentList.length,
                    itemBuilder: (context, index) {
                      Equipment equipment = equipmentList[index];
                      return AddEquipmentCard(
                        equipmentName: equipment.equipmentName,
                        equipmentImageUrl: equipment.equipmentImageUrl,
                        noOfMinutes: equipment.noOfMinutes,
                        noOfCalories: equipment.noOfCalories,
                        isFav: userData.favEquipmentList.contains(equipment),
                        isAdded: userData.equipmentList.contains(equipment),
                        toggleAddEquipment: () {
                          setState(() {
                            if (userData.equipmentList.contains(equipment)) {
                              userData.removeEquipment(equipment);
                            } else {
                              userData.addEquipment(equipment);
                            }
                          });
                        },
                        toggleFavEquipment: () {
                          setState(() {
                            if (userData.favEquipmentList.contains(equipment)) {
                              userData.removeFavEquipment(equipment);
                            } else {
                              userData.addFavEquipment(equipment);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
