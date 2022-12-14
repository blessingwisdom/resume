import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme.dart';

class Resume extends StatelessWidget {
  const Resume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    // double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Consumer<DarkThemeProvider>(
            builder: (BuildContext context, data, child) {
          return Column(
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
                          child: const Icon(Icons.arrow_back)),
                      const Text(
                        "RESUME",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.more_vert_outlined),
                    ]),
              ),
              SizedBox(
                height: 0.05 * h,
              ),
            ],
          );
        }),
      ),
    );
  }

  TextStyle _cStyle() {
    return const TextStyle(fontSize: 17);
  }
}
