import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AddExerciseCard extends StatefulWidget {
  const AddExerciseCard({
    super.key,
    required this.exerciseName,
    required this.imageUrl,
    required this.noOfMinutes,
    required this.toggleAddExercise,
    required this.isAdded,
    required this.toggleFavExercise,
    required this.isFav,
  });

  final String exerciseName;
  final String imageUrl;
  final String noOfMinutes;
  final bool isAdded;
  final bool isFav;
  final void Function() toggleAddExercise;
  final void Function() toggleFavExercise;

  @override
  State<AddExerciseCard> createState() => _AddExerciseCardState();
}

class _AddExerciseCardState extends State<AddExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      height: 220,
      width: 180,
      decoration: BoxDecoration(
        color: kSubContentColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.exerciseName,
              style: const TextStyle(
                  color: kTitleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Image.asset(
              widget.imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            Text(
              widget.noOfMinutes,
              style: const TextStyle(
                  fontSize: 18,
                  color: kSubContentColor,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          widget.toggleAddExercise();
                        },
                        icon: Icon(
                          widget.isAdded ? Icons.remove : Icons.add,
                          color: kDarkBlueColor.withOpacity(0.5),
                        ),
                      ),
                    ),
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
                          widget.toggleFavExercise();
                        },
                        icon: Icon(
                            widget.isFav
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: kRedColor.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
