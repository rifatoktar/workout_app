import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrendingWorkoutCard extends StatelessWidget {
  final String imageAsset;
  final String workoutCount;
  final String exerciseType;
  const TrendingWorkoutCard(
      {super.key, required this.imageAsset, required this.workoutCount, required this.exerciseType});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerLeft),
      child: Container(
        height: 100,
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xff04ECA6), width: 2),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 80,
              child: Image.asset(imageAsset),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      exerciseType,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(
                      "assets/icons/arrow-right.svg",
                      height: 15,
                      width: 15,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).cardColor, BlendMode.srcIn),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  workoutCount,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
