import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

PanelController panelController = PanelController();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double blur;
  @override
  void initState() {
    blur = 6;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1440, allowFontScaling: true);
    Future.delayed(Duration(milliseconds: 1000)).then((value) {
      setState(() {
        blur = panelController.panelPosition * 3;
      });
    });
    return SlidingUpPanel(
      controller: panelController,
      renderPanelSheet: false,
      backdropEnabled: true,
      backdropOpacity: 0,
      backdropTapClosesPanel: true,
      panel: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: Colors.white.withOpacity(0.5),
          child: SizedBox(
            width: 720.w,
            height: 1000,
            child: Text('sdagfjhbgknmkngbfjdhvsgjb'),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image:
                DecorationImage(image: AssetImage('assets/images/HomeBG.png'))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: SingleChildScrollView(
              child: SizedBox(
                width: 720.w,
                height: 1000,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 140.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              ScreenUtil.defaultWidth * 0.09, 0, 0, 0),
                          child: Container(
                            height: 180.h,
                            child: Image.asset('assets/images/HomeText.png'),
                          ),
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                          child: Text(' '),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
