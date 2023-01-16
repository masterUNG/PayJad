import 'package:bang_pun_pay/navigation/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/icons.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Showing a page that has selected by user.
      body: Stack(
        children: [
          Obx(
            () => IndexedStack(
              index: controller.selectedIndex.value,
              children: controller.pages,
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 5),
                    blurRadius: 15,
                    spreadRadius: 3,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0, 0),
                    blurRadius: 0,
                    spreadRadius: 0,
                  ),
                ],
              ),

              child: Obx(
                () => Stack(
                  children: [
                    Center(
                      heightFactor: 0.2,
                      child: GestureDetector(
                        onTap: () => controller.selectedIndex.value = 2,
                        child: Image(
                          image: AssetImage(
                            (controller.selectedIndex.value == 2)
                            ? AppIcons.src + AppIcons.scanBtnActive
                            : AppIcons.src + AppIcons.scanBtnInactive
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        getNavigationButton(context, Icons.home, "หน้าหลัก", 0),
                        getNavigationButton(context, Icons.notifications, "แจ้งเตือน", 1),
                        const SizedBox(width: 60),
                        getNavigationButton(context, Icons.local_activity, "สมาชิก", 3),
                        getNavigationButton(context, Icons.person, "โปรไฟล์", 4),
                      ],
                    ),
                  ],
                ),
              )
            ),
          ),
        ],
      ),
    );
  }

  Widget getNavigationButton(BuildContext context, IconData icon, String label, int index) {
    RxBool isActive = (controller.selectedIndex.value == index).obs;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          controller.selectedIndex.value = index; 
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive.value? const Color(0xFF2F80ED) : const Color(0xFF999999),
            ),
            Text(
              label, 
              style: Theme.of(context).textTheme.bodyText2!.apply(
                color: isActive.value? const Color(0xFF2F80ED) : const Color(0xFF999999)
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}