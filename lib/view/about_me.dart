import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Consumer<DarkThemeProvider>(
            builder: (BuildContext context, data, child) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back_ios)),
                        const Text(
                          "ABOUT",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Icon(Icons.more_vert_outlined),
                      ]),
                ),
                SizedBox(
                  height: 0.01 * h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: w * 0.3,
                        child: Divider(
                            height: 15.0,
                            color: data.isDark ? Colors.white : Colors.black)),
                    Wrap(
                      direction: Axis.horizontal,
                      children: List.generate(
                          3,
                          (index) => Container(
                                margin: EdgeInsets.all(w * 0.01),
                                height: h * 0.05,
                                width: h * 0.01,
                                decoration: BoxDecoration(
                                    color: data.isDark
                                        ? Colors.white
                                        : Colors.black,
                                    borderRadius:
                                        BorderRadius.circular(0.02 * h)),
                              )),
                    ),
                    SizedBox(
                        width: w * 0.3,
                        child: Divider(
                          height: 15.0,
                          color: data.isDark ? Colors.white : Colors.black,
                        )),
                  ],
                ),
                SizedBox(
                  height: 0.03 * h,
                ),
                Container(
                  height: h / 5,
                  width: h / 5,
                  decoration: BoxDecoration(
                      color: data.isDark ? Colors.white : Colors.black,
                      borderRadius: BorderRadius.circular(h / 5),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/personal.jpg"),
                          fit: BoxFit.cover),
                      border:
                          Border.all(width: 3, color: Colors.lightBlueAccent)),
                ),
                SizedBox(
                  height: 0.02 * h,
                ),
                SizedBox(
                  height: h / 6,
                  width: w * 0.9,
                  child: const Text(
                    "I am Blessing Wisdom, a Pharmacy Student who is learning mobile application development",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 0.01 * h,
                ),
                SizedBox(
                  height: h / 6,
                  width: w * 0.9,
                  child: const Text(
                    "I believe I have the skills to help your company build and grow your products.",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 0.01 * h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.05 * w, right: 0.05 * w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "*  Phone: +2349023623020",
                        style: _cStyle(),
                      ),
                      Text(
                        "*  Email: blessingdavid705@gmail.com",
                        style: _cStyle(),
                      ),
                      Text(
                        "*  Location: Calabar, Nigeria",
                        style: _cStyle(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  TextStyle _cStyle() {
    return const TextStyle(fontSize: 15);
  }
}
