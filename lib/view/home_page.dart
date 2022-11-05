import 'package:flutter/material.dart';
import 'package:resume/view/about_me.dart';
import 'package:resume/view/resume1.dart';
import 'package:resume/view/my_skills.dart';
import 'package:provider/provider.dart';

import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/dark_theme.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/button.dart';
import '../widgets/social.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _provider = Provider.of<DarkThemeProvider>(context, listen: false);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(
                tittle: "Blessing Wisdom",
              ),
              SizedBox(
                height: 0.05 * h,
              ),
              Consumer<DarkThemeProvider>(
                  builder: (BuildContext context, data, child) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const Resume(),
                                  inheritTheme: true,
                                  ctx: context),
                            );
                          },
                          child: Container(
                            height: h / 3.5,
                            width: w * 0.1,
                            decoration: BoxDecoration(
                              color: data.isDark ? Colors.white : Colors.black,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: RotatedBox(
                                quarterTurns: 3,
                                child: Center(
                                    child: Text(
                                  "Resume",
                                  style: TextStyle(
                                      color: data.isDark
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 22),
                                ))),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: h / 2.8,
                              width: h / 3,
                              decoration: BoxDecoration(
                                  color:
                                      data.isDark ? Colors.white : Colors.black,
                                  borderRadius: BorderRadius.circular(h * 0.1),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/personal.jpg"),
                                      fit: BoxFit.cover),
                                  border: Border.all(
                                      width: 3, color: Colors.lightBlueAccent)),
                            ),
                            SizedBox(
                              height: 0.01 * h,
                            ),
                            SizedBox(
                              width: h / 3,
                              child: Column(
                                children: const [
                                  Text(
                                    "Blessing Wisdom",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "Mobile Developer(Flutter )",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const Resume(),
                                  inheritTheme: true,
                                  ctx: context),
                            );
                          },
                          child: Container(
                            height: h / 3.5,
                            width: w * 0.1,
                            decoration: BoxDecoration(
                                color:
                                    data.isDark ? Colors.white : Colors.black,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                )),
                            child: RotatedBox(
                                quarterTurns: 1,
                                child: Center(
                                    child: Text(
                                  "Resume",
                                  style: TextStyle(
                                      color: data.isDark
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 22),
                                ))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: w / 8, right: w / 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: const About(),
                                      inheritTheme: true,
                                      ctx: context),
                                );
                              },
                              child: const CustomButton(
                                text: "About",
                              )),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: const Skills(),
                                      inheritTheme: true,
                                      ctx: context),
                                );
                              },
                              child: const CustomButton(
                                text: "Skills",
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: w / 15, right: w / 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () async {
                                if (!await launchUrl(
                                    Uri.parse(
                                        "https://https://www.linkedin.com/in/blessingdavid/"),
                                    mode: LaunchMode.externalApplication)) {
                                  throw 'Could not launch ${"https://www.linkedin.com/in/blessingdavid/"}';
                                }
                              },
                              child: const Socials(
                                  image: "assets/images/linkdln.jpeg")),
                          GestureDetector(
                              onTap: () async {
                                if (!await launchUrl(
                                    Uri.parse(
                                        "https://www.github.com/blessingwisdom"),
                                    mode: LaunchMode.externalApplication)) {
                                  throw 'Could not launch ${"https://www.github.com/blessingwisdom"}';
                                }
                              },
                              child: const Socials(
                                  image: "assets/images/github.png")),
                          const Socials(image: "assets/images/twitter.png"),
                        ],
                      ),
                    )
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
