import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/consts/lists.dart';
import 'package:e_mart/controllers/auth_controller.dart';
import 'package:e_mart/views/auth_screen/login_screen.dart';
import 'package:e_mart/views/profile/components/details_card.dart';
import 'package:e_mart/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgwidget(
      Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              //Edit profile section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                    child: Icon(Icons.edit, color: whiteColor,)
                ).onTap(() { }),
              ),
              //User Details Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Image.asset(imgProfile2, width: 80, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                    2.widthBox,
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Dummy User".text.fontFamily(bold).white.make(),
                            "customer@example.com".text.white.make()
                          ],
                        )
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Colors.white
                        )
                      ),
                        onPressed: () async{
                        Get.put(AuthController()).signOutMethod(context);
                        Get.offAll(() => LoginScreen());
                        },
                        child: logout.text.fontFamily(semibold).white.make()
                    )
                  ],
                ),
              ),
              12.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  dedailsCard(count: "0.00",title: "In your cart", width: context.screenWidth/3.3),
                  dedailsCard(count: "32",title: "In your wishlist", width: context.screenWidth/3.3),
                  dedailsCard(count: "675",title: "Your orders", width: context.screenWidth/3.3)
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index){
                  return const Divider(color: lightGrey,);
                },
                itemCount: profileButtonsList.length,
                  itemBuilder:(BuildContext context, int index){
                    return ListTile(
                      leading: Image.asset(
                        profileButtonsIcon[index],
                        width: 22,
                      ),
                      title: profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                    );
                  }
              ).box.white.rounded.margin(EdgeInsets.all(12)).padding(EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make()
            ],
          ),
        ),
      ),
    );
  }
}