
import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlassBox extends StatelessWidget {
  const FrostedGlassBox({this.theWidth,this.theHeight,this.theChild});

  final theWidth;
  final theHeight;
  final theChild;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: theWidth,
        height: theHeight,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2.0,
                  sigmaY: 2.0,
                ),
               child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: Color(0xffC8A58A),width: 2),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                  Color(0xffC8A58A).withOpacity(0.55),
                  Color(0xffC8A58A).withOpacity(0.55),
                ],

                )
              ),
            ),
            theChild,

          ],
        ),
      ),
    );
  }
}
