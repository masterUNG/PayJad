import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class PagesDivide extends StatefulWidget {
  final List<String> labels;
  final List<Widget> children;
  final bool isExpanded;
  const PagesDivide({
    required this.labels,
    required this.children,
    this.isExpanded = true,
    super.key
  });

  @override
  State<PagesDivide> createState() => _PagesDivideState();
}

class _PagesDivideState extends State<PagesDivide> {
  RxInt pageIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    if (widget.children.isEmpty || widget.labels.isEmpty || widget.children.length != widget.labels.length) {
      throw Error();
    }

    // Create all page buttons.
    List<Widget> pagesBtn = [];
    for (int i = 0; i < widget.labels.length; i++) {
      pagesBtn.add(Obx( () => getPageButton(context, widget.labels[i], i)));
    }
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.lightBlue,
            borderRadius: BorderRadius.circular(10)
          ),
          clipBehavior: Clip.hardEdge,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: pagesBtn,
          ),
        ),
        Obx(
          () => widget.isExpanded? 
          Expanded(
            child: IndexedStack(
              index: pageIndex.value,
              children: widget.children,
            ),
          )
          : IndexedStack(
              index: pageIndex.value,
              children: widget.children,
            ),
        )
      ],
    );
  }

  // Page button for select a page to show in bottom
  Widget getPageButton(BuildContext context, String label, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => pageIndex.value = index,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: (pageIndex.value == index)? AppColors.blue : AppColors.lightBlue,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.headline3!.apply(
                color: (pageIndex.value == index)? Colors.white : AppColors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}