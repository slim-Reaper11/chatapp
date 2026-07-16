import 'dart:ui';

import 'package:flutter/material.dart';

final _borderRadius = BorderRadiusGeometry.circular(20);

class GlassContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  final bool shadow;
  const GlassContainer({
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
                    color: const Color.fromARGB(25, 0, 0, 0),
                    blurRadius: 10,
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
                  color: Colors.white.withValues(alpha: 0.2),
                  // width: 0.2,
                ),
                borderRadius: _borderRadius,
                gradient: LinearGradient(
                  begin: AlignmentGeometry.topLeft,
                  end: AlignmentGeometry.bottomRight,

                  colors: [
                    Colors.white.withValues(alpha: 0.1),
                    Colors.white.withValues(alpha: 0.15),
                  ],
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
