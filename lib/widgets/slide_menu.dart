import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SlideMenu extends StatelessWidget {
  final String label;
  final double height;
  final Widget child;
  final Function()? func;
  final bool? hasSeeMore;
  const SlideMenu({
    required this.child,
    required this.label,
    required this.height,
    this.func,
    this.hasSeeMore = true,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getModuleHeader(context, label: label, hasSeeMore: hasSeeMore!, func: func),

          const SizedBox(height: 5),

          Container(
            margin: const EdgeInsets.only(top: 10.0),
            height: height + 22,
            child: child,
          ),
        ],
      ),
    );
  }

  static Widget getModuleHeader(BuildContext context, 
  {
    required String label, 
    required bool hasSeeMore, 
    Function()? func
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        hasSeeMore?
        GestureDetector(
          onTap: func,
          child: Text(
            "ดูทั้งหมด",
              style: Theme.of(context).textTheme.bodyText1!.apply(color: AppColors.blue),
          ),
        )
        : Container()
      ],
    );
  }

}