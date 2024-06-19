import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner_app/models/exercise_model.dart';

import '../constants/colors.dart';
import '../constants/responsive.dart';
import '../widgets/exercise_card.dart';

class ExerciseDetailsPage extends StatefulWidget {
  const ExerciseDetailsPage(
      {super.key,
      required this.title,
      required this.description,
      required this.exercisesList});

  final String title;
  final String description;
  final List<Exercise> exercisesList;

  @override
  State<ExerciseDetailsPage> createState() => _ExerciseDetailsPageState();
}

class _ExerciseDetailsPageState extends State<ExerciseDetailsPage> {
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
              "Exercises",
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
                widget.description,
                style: TextStyle(fontSize: 18, color: kMainContentColor),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: kDefaultPadding,
                    mainAxisSpacing: kDefaultPadding),
                itemCount: widget.exercisesList.length,
                itemBuilder: (context, index) {
                  Exercise exercise = widget.exercisesList[index];
                  return ExerciseCard(
                    title: exercise.exerciseName,
                    description: "${exercise.noOfMinutes.toString()} of workout",
                    imageUrl: exercise.exerciseImageUrl,
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
