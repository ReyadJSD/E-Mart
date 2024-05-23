import 'package:e_mart/views/category/item_details.dart';
import 'package:e_mart/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:e_mart/consts/consts.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({Key?key, required this.title}) :super(key:key);

  @override
  Widget build(BuildContext context) {
    return bgwidget(
      Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (index) => "Baby Clothing".text.fontFamily(semibold).size(14).color(darkFontGrey).makeCentered().box.roundedSM.size(120, 60).white.margin(EdgeInsets.symmetric(horizontal: 4)).make()),
                ),
              ),
              20.heightBox,

              Expanded(
                  child: GridView.builder(
                    physics:const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 250),
                    itemBuilder: (context, index){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            imgP1,
                            width: 200,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                          10.heightBox,
                          "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                          10.heightBox
                        ],
                      ).box.white.roundedSM.outerShadowSm.padding(const EdgeInsets.all(12)).margin(const EdgeInsets.symmetric(horizontal: 4)).make().onTap(() {
                        Get.to(()=> const ItemDetails(title: "Dummy Item"));
                      });
                    },
                  )
              )
            ],
          ),
        ),
      )
    );
  }
}
