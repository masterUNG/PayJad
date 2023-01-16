import 'package:bang_pun_pay/widgets/reuse_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class NewsPageView extends StatefulWidget {
  const NewsPageView({super.key});

  @override
  State<NewsPageView> createState() => _NewsPageViewState();
}

class _NewsPageViewState extends State<NewsPageView> {
  final PageController pageViewCtr = PageController();

  final String imagesSrc = "assets/images/";
  final String newsImgSrc = "news/";
  final List<String> newsImg = [
    "news.png",
    "news.png",
    "news.png"
  ];

  RxInt pageIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ReUseCard(
        borderRadius: BorderRadius.circular(20.0),
        height: 180.0,
        shadowColor: AppColors.blue,
        child: Stack(
          children: [
            PageView.builder(
              controller: pageViewCtr,
              onPageChanged: (value) => pageIndex.value = value,
              itemCount: newsImg.length,
              itemBuilder: (context, index) => getEachNewsPage(index),
            ),
          
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 50,
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    newsImg.length,
                    (index) => getIndicator(pageIndex.value == index)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getEachNewsPage(int index) {
    return Image(
      image: AssetImage(imagesSrc + newsImgSrc + newsImg[index]),
      fit: BoxFit.cover,
    );
  }

  // Animation indicator for pageView.
  Widget getIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: (isActive? 30.0 : 8.0),
      decoration: BoxDecoration(
        color: isActive? AppColors.darkGrey : AppColors.lightGrey,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}