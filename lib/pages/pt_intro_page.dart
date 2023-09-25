import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PtIntroPage extends StatefulWidget {
  const PtIntroPage({super.key});

  @override
  State<PtIntroPage> createState() => _PtIntroPageState();
}

class _PtIntroPageState extends State<PtIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff010005),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * .4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/pt.png"))),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text(
                'Get started with a PT',
                style: GoogleFonts.lexendDeca(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff04ECA6)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flex(
              direction: Axis.vertical,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "PTs are able to teach you many attractive moves. That moves going to help you lose weight and gather muscle. However, this provides has a price.",
                    style: GoogleFonts.lexendDeca(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.centerLeft),
                      onPressed: () {},
                      child: Text(
                        'Learn more',
                        style: GoogleFonts.lexendDeca(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff04ECA6)),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset("assets/icons/arrow-right.svg")
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
                margin: EdgeInsets.only(right: 16),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/arrow-left.svg",
                          height: 24,
                          width: 24,
                          fit: BoxFit.scaleDown,
                        )),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                        child: Container(
                          height: 40,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff04ECA6)),
                          child: Center(
                              child: Text(
                            'Get Started',
                            style: GoogleFonts.lexendDeca(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          )),
                        )),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
