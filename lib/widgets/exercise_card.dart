import 'package:flutter/material.dart';
import 'package:workout_planner_app/constants/colors.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  final String title;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.43,
      height: 180,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadowColor: Colors.grey,
        elevation: 3,
        color: kCardBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    color: kTitleColor,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 100,
                // width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    imageUrl,
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                    fontSize: 15,
                    color: kLightBlueColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
