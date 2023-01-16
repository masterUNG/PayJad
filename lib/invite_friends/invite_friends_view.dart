import 'package:bang_pun_pay/constants/colors.dart';
import 'package:bang_pun_pay/widgets/pages_divide.dart';
import 'package:bang_pun_pay/widgets/reuse_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/gradient_appbar.dart';
import 'invite_friends_controller.dart';

class InviteFriendsView extends GetView<InviteFriendsController> {
  const InviteFriendsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        flexibleSpace: const GradientAppbar(),
        title: Text(
          "แนะนำเพื่อนใช้ BangPunPay",
          style: Theme.of(context).textTheme.headline1!.apply(color: Colors.white),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        children: [
          getMarketingModule(context),
          getSharingCodeModule(context),
          getFriendsCountModule(context),
          getInviteFriendsModule(context),
        ],
      )
    );
  }

  // The first card in this page
  Widget getMarketingModule(BuildContext context) {
    return ReUseCard(
      padding: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(20),
      color: AppColors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headline2!.apply(color: Colors.white),
              children: [
                const TextSpan(
                  text: "รับคะแนนสูงสุด "
                ),
                TextSpan(
                  text: "1,000 คะแนน",
                  style: TextStyle(color: AppColors.yellow),
                ),
              ]
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "สำหรับการชวนเพื่อนใช้",
            style: Theme.of(context).textTheme.headline3!.apply(color: Colors.white),
          ),
        ],
      ),
    );
  }
  
  Widget getSharingCodeModule(BuildContext context) {
    return ReUseCard(
      padding: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "รหัสแนะนำเพื่อน",
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(height: 5),
                Text(
                  controller.sharingCode,
                  style: Theme.of(context).textTheme.headline2!.apply(color: AppColors.blue),
                ),
              ],
            ),
          ),

          // Invite friends button (sharing)
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Text(
                  "ชวนเพื่อน",
                  style: Theme.of(context).textTheme.headline3!.apply(color: Colors.white),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.share_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  
  // Header of number of invited friends module
  Widget getModuleHeader(BuildContext context, String label) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyText1,
            children: [
              TextSpan(
                text: "${controller.numberInvitedFriends.toString()}/10",
                style: TextStyle(color: AppColors.blue),
              ),
              const TextSpan(text: " คน"),
            ]
          ),
        ),
      ],
    );
  }

  // Show number of invited friends module
  Widget getFriendsCountModule(BuildContext context) {
    double height = 82;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getModuleHeader(context, "จำนวนเพื่อนที่ใช้รหัสแนะนำของคุณ"),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            height: (height + 10),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: height,
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColors.lightBlue,
                      width: 1.0,
                    )
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.lightestBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // Person icon with 1 number
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Icon(Icons.person_outline, color: AppColors.blue,),
                            Positioned(
                              bottom: 2,
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: AppColors.lightestBlue,
                                child: Center(
                                  child: Text(
                                    "1",
                                    style: Theme.of(context).textTheme.bodyText2!.apply(color: AppColors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 2),

                      Text(
                        "100",
                        style: Theme.of(context).textTheme.headline4!.apply(color: AppColors.blue),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  
  // PageDivide
  Widget getInviteFriendsModule(BuildContext context) {
    return PagesDivide(
      isExpanded: false,
      labels: const [
        "เชิญร่วมแบ่งปัน",
        "แบ่งปันแล้ว",
      ],
      children: [
        getInviting(context),
        getInvited(context),
      ],
    );
  }

  // For invite friends
  Widget getInviting(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: AppColors.blue,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            controller.friendsData[0]["name"]!,
                            style: Theme.of(context).textTheme.headline4,
                          )
                        ),
                        Text(
                          "ใช้งานแล้ว ${controller.friendsData[0]["recent"]} วัน",
                          style: Theme.of(context).textTheme.bodyText2!.apply(color: AppColors.lightGrey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.blue),
                      ),
                      child: Center(
                        child: Text(
                          "เชิญเพื่อนแบ่งปัน",
                          style: Theme.of(context).textTheme.headline4!.apply(color: Colors.white),
                          ),
                      )
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  // For showing friends who were invited
  Widget getInvited(BuildContext context) {
    return Center(child: Text("Invited Friends"),);
  }
  
}