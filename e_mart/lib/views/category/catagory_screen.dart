import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/consts/lists.dart';
import 'package:e_mart/views/category/category_details.dart';
import 'package:e_mart/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgwidget(
        Scaffold(
          appBar: AppBar(
            title: categories.text.fontFamily(bold).white.make(),
            elevation: 0,
          ),
          body: Container(
            padding:const EdgeInsets.all(12),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8,mainAxisExtent: 200),
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      Image.asset(
                          categoriesImages[index],
                        height: 120,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      10.heightBox,
                      categoriesLists[index].text.fontFamily(bold).color(darkFontGrey).align(TextAlign.center).make()
                    ],
                  ).box.rounded.white.outerShadow.clip(Clip.antiAlias).make().onTap(() {
                    Get.to(()=> CategoryDetails(title: categoriesLists[index]));
                  });
                }
            ),
          ),
        )
    );
  }
}