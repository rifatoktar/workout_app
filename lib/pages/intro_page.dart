import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home.dart';
import '../widgets/button_gradient_widget.dart';
import 'pt_intro_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  _ptItem() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      context: context,
      builder: (context) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * .25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Color(0xff010005),
              border: Border.all(color: Color(0xff04ECA6), width: 2)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset("assets/icons/arrow-down.svg"),
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
                        'If you going to work with a PT (Personal Trainer), this provides has a price.',
                        style: GoogleFonts.lexendDeca(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
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
                )
              ]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff010005),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * .4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/intro.png"),
                      fit: BoxFit.cover)),
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
                    "Speaking of yourself, that have to stay sportive and healthy. But you can achieve that workout alone or with a PT. \n\nLet's summon your own competitive soul.",
                    style: GoogleFonts.lexendDeca(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Flex(
              direction: Axis.vertical,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Get Started',
                          style: GoogleFonts.lexendDeca(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff04ECA6)),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 50),
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      padding: EdgeInsets.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      alignment: Alignment.centerLeft),
                                  child: Container(
                                    height: 40,
                                    width: 170,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xff04ECA6)),
                                    child: Center(
                                        child: Text(
                                      'by Yourself',
                                      style: GoogleFonts.lexendDeca(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    )),
                                  )),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                UnicornOutlineButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PtIntroPage()),
                                    );
                                  },
                                  strokeWidth: 2,
                                  radius: 10,
                                  gradient: LinearGradient(
                                    colors: const [
                                      Color(0xff3550D1),
                                      Color(0xff04ECA6)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  child: Text(
                                    'with a PT',
                                    style: GoogleFonts.lexendDeca(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    _ptItem();
                                  },
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  icon: SvgPicture.asset(
                                    "assets/icons/info.svg",
                                    height: 20,
                                    width: 20,
                                    fit: BoxFit.scaleDown,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ]),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
