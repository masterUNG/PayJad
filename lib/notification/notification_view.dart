import 'package:bang_pun_pay/constants/colors.dart';
import 'package:bang_pun_pay/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';


class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        title: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Text(
                "การแจ้งเตือน",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Positioned(
              right: 0,
              child: Text(
                "แก้ไข",
                style: Theme.of(context).textTheme.bodyText1!.apply(color: AppColors.blue),
              ),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) {
                List<Map<String, String>> notificationsData = controller.notifications;
                // For swipe to delete
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    extentRatio: 0.15,
                    children: [
                      getDeleteButton(context),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.lightGrey,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10, 
                        horizontal: 24
                      ),
                      child: Row(
                        children: [
                          getNotificationImg(context, notificationsData[0]["image"]!),               
                          const SizedBox(width: 10),
                          getNotificationDetail(context, notificationsData[0]),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Push the widgets up because it will stay at behide bottom navigation.
          const SizedBox(height: 80),
        ],
      )
    );
  }

  Widget getDeleteButton(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          color: const Color(0xFFFE4A49),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.delete,
                color: Colors.white,
              ),
              Text(
                "ลบ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Image that show in front of notifications.
  Widget getNotificationImg(BuildContext context, String img) {
    double imageSize = 50;
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width:  imageSize,
      height:  imageSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.lightestBlue,
      ),
      child: (img != "")
      ? Image(
        image: AssetImage(controller.imagesSrc + img)
      )
      : Icon(
        Icons.notifications,
        color: AppColors.blue,
      )
    );
  }

  Widget getNotificationDetail(BuildContext context, Map<String, String> notificationData) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  notificationData["title"]!,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText2!.apply(color: AppColors.lightGrey),
                  children: [
                    TextSpan(
                      text: "${notificationData["date"]!} ",
                    ),
                    TextSpan(
                      text: notificationData["time"]!,
                    ),
                  ]
                ),
              ),
            ],
          ),
          Text(
            notificationData["description"]!,
            style: Theme.of(context).textTheme.bodyText2!.apply(color: AppColors.lightGrey),
          ),
        ],
      ),
    );
  }

}