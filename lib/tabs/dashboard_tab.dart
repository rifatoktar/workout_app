import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/chart_widgets/chart.dart';
import '../widgets/daily_routine_card.dart';
import '../widgets/header.dart';
import '../widgets/trending_workout_card.dart';

class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/bolt-fill.svg",
              height: 24,
              width: 24,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).cardColor, BlendMode.srcIn),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'DASHBOARD',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/bell.svg",
              colorFilter: ColorFilter.mode(
                  Theme.of(context).cardColor, BlendMode.srcIn),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Header(
              header: 'Daily Routines',
              buttonText: 'Create another one',
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 160,
              margin: EdgeInsets.only(left: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  DailyRoutineCard(
                    containerColor: Color(0xff04ECA6),
                    imageAsset: "assets/images/indoor-bike.png",
                    type: 'Indoor Bike',
                    time: '20',
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  DailyRoutineCard(
                    containerColor: Color(0xff3B61EB),
                    imageAsset: "assets/images/stability-ball.png",
                    type: 'Stability Ball',
                    time: '15',
                  ),
                  SizedBox(
                    width: 16,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Header(
              buttonText: 'Chart settings',
              header: 'Activity',
            ),
            SizedBox(
              height: 20,
            ),
            Flex(
              direction: Axis.vertical,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  height: 400,
                  child: LineChartScreen(),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Header(
              buttonText: 'See all workouts',
              header: 'Trending Workouts',
            ),
            SizedBox(
              height: 20,
            ),
            Flex(
              direction: Axis.vertical,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '*That suggested workouts are the same level as your current level',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size(50, 30),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerLeft),
                                onPressed: () {},
                                child: Text(
                                  'Learn more',
                                  style: GoogleFonts.lexendDeca(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff04ECA6)),
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset("assets/icons/arrow-right.svg")
                          ],
                        ),
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Flex(
              direction: Axis.vertical,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: const [
                      TrendingWorkoutCard(
                        imageAsset: 'assets/images/dumbbell-exercise.png',
                        workoutCount: '20 sets of dumbbell exercise',
                        exerciseType: 'Dumbbell Exercise',
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TrendingWorkoutCard(
                        imageAsset: 'assets/images/stretch.png',
                        workoutCount: '30 sets of stretch exercise',
                        exerciseType: 'Stretch',
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
