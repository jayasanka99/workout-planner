import 'package:flutter/material.dart';
import 'package:workout_planner_app/constants/colors.dart';

class ProgressCard extends StatefulWidget {
  const ProgressCard(
      {super.key, required this.progressValue, required this.total});

  final double progressValue;
  final int total;

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  Widget build(BuildContext context) {
    int done = (widget.progressValue * widget.total).toInt();
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [kLightBlueColor, kDarkBlueColor],
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Proteins, Fats & \nCarbohydrates",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Image.network(
                  "https://icon-library.com/images/gym-icon/gym-icon-12.jpg",
                  width: 60,
                  height: 60,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 55,),
            LinearProgressIndicator(
              value: widget.progressValue,
              backgroundColor: kDarkBlueColor,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              minHeight: 10,
              borderRadius: BorderRadius.circular(100),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    // const Text(
                    //   "Done",
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 18,
                    //   ),
                    // ),
                    // Text(
                    //   done.toString(),
                    //   style: const TextStyle(
                    //       color: Colors.white, fontWeight: FontWeight.w700),
                    // ),
                    _buildProgress("Done", done.toString()),
                  ],
                ),
                Column(
                  children: [
                    // const Text(
                    //   "Total",
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 18,
                    //   ),
                    // ),
                    // Text(
                    //   widget.total.toString(),
                    //   style: const TextStyle(
                    //       color: Colors.white, fontWeight: FontWeight.w700),
                    // ),
                    _buildProgress("Total", widget.total.toString())
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgress(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18,),
        ),
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
