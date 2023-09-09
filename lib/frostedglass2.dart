import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FrostedGlassBox2 extends StatelessWidget {

  FrostedGlassBox2({this.myChild});

  late dynamic myChild;



  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        width: 80,
        height: 100,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2.0,
                sigmaY: 2.0,
              ),
              // child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: Colors.white.withOpacity(0.13)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.greenAccent.withOpacity(0.03),
                      Colors.greenAccent.withOpacity(0.03),
                    ],

                  )
              ),
            ),
            myChild,

          ],
        ),
      ),
    );
  }
}
