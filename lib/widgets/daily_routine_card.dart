import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyRoutineCard extends StatelessWidget {
  final String imageAsset;
  final Color containerColor;
  final String type;
  final String time;
  const DailyRoutineCard(
      {super.key,
      required this.containerColor,
      required this.imageAsset,
      required this.type,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerLeft),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            height: 160,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: containerColor),
            child: Row(
              children: [
                Image.asset(imageAsset),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          type,
                          style: GoogleFonts.lexendDeca(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset(
                          "assets/icons/arrow-right.svg",
                          colorFilter:
                              ColorFilter.mode(Colors.black, BlendMode.srcIn),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "$time Minutes",
                      style: GoogleFonts.lexendDeca(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Text(
                      'per day',
                      style: GoogleFonts.lexendDeca(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(.5)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
