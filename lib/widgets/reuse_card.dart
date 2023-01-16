import 'package:flutter/material.dart';

// For the same elevation, shadow and margin of card within app.
class ReUseCard extends StatelessWidget {

  final Widget child;
  final BorderRadius borderRadius;
  final Color? color;
  final BorderSide? borderSide;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Offset? shadowOffset;
  final Color? shadowColor;
  final Gradient? gradient;
  
  const ReUseCard({
    required this.child,
    required this.borderRadius,
    this.color = Colors.white,
    this.borderSide,
    this.height,
    this.margin = const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
    this.padding,
    this.shadowOffset = const Offset(0, 0),
    this.shadowColor = Colors.black12,
    this.gradient,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: borderSide == null? null : Border.all(
          color: borderSide!.color,
          width: borderSide!.width,
        ),
        color: color,
        gradient: gradient,
        boxShadow: [
          BoxShadow(
            color: shadowColor!,
            offset: shadowOffset!,
            blurRadius: 5.0,
            spreadRadius: 0.5,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(0, 0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: child
    );
  }

}