import 'dart:ui';

import 'package:flutter/material.dart';

final _borderRadius = BorderRadiusGeometry.circular(20);

class Glassbutton extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  final bool shadow;

  const Glassbutton({
    super.key,
    this.height,
    this.width,
    required this.child,
    this.shadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _borderRadius,
      child: Container(
        width: width,
        height: height,

        decoration: BoxDecoration(
          boxShadow: shadow
              ? [
                  BoxShadow(
                    color: const Color.fromARGB(95, 3, 25, 22),
                    blurRadius: 30,
                    offset: Offset(0, 10),
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(
                    255,
                    0,
                    0,
                    0,
                  ).withValues(alpha: 0.2),
                  // width: 0.2,
                ),
                borderRadius: _borderRadius,
                gradient: LinearGradient(
                  begin: AlignmentGeometry.topLeft,
                  end: AlignmentGeometry.bottomRight,

                  colors: [
                    const Color.fromARGB(
                      255,
                      255,
                      255,
                      255,
                    ).withValues(alpha: 0.1),
                    const Color.fromARGB(
                      255,
                      255,
                      255,
                      255,
                    ).withValues(alpha: 0.15),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(20),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
