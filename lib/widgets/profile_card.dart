import 'package:flutter/material.dart';
import 'package:workout_planner_app/constants/responsive.dart';

import '../constants/colors.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({
    super.key,
    required this.exerciseName,
    required this.exerciseImageUrl,
    required this.markAsDone,
  });

  final String exerciseName;
  final String exerciseImageUrl;
  final Function() markAsDone;

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kSubContentColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              widget.exerciseImageUrl,
              height: 50,
            ),
            Text(
              widget.exerciseName,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kTitleColor),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                widget.markAsDone();
              },
              icon: const Icon(Icons.check),
            ),
          ],
        ),
      ),
    );
  }
}
