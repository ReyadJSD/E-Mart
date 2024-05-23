import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/consts/lists.dart';
import 'package:e_mart/views/home_screen/components/featured_buttons.dart';
import 'package:e_mart/widgets_common/bg_widget.dart';
import 'package:e_mart/widgets_common/home_buttons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 80,
              color: lightGrey,
              child: TextFormField(
                decoration:const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchAnything,
                  hintStyle: TextStyle(color: textfieldGrey)
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics:const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Swiper Brands
                    VxSwiper.builder(
                      aspectRatio: 16/9,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      height: 150,
                      itemCount: sliderList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          clipBehavior: Clip.antiAlias,
                          margin:const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: Image.asset(
                              sliderList[index],
                              fit: BoxFit.fill
                          ),
                        );
                      },
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(2, (index) => homeButtons(
                        context.screenWidth / 2.5,
                        context.screenHeight * 0.15,
                        index == 0? icTodaysDeal:icFlashDeal,
                            (){},
                        index == 0? todayDeal:flashSell,
                      )),
                    ),
                    10.heightBox,
                    //Second Swiper
                    VxSwiper.builder(
                      aspectRatio: 16/9,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      height: 150,
                      itemCount: secondSlider.length,
                      itemBuilder: (context, index) {
                        return Container(
                          clipBehavior: Clip.antiAlias,
                          margin:const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: Image.asset(
                              secondSlider[index],
                              fit: BoxFit.fill
                          ),
                        );
                      },
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(3, (index) => homeButtons(
                          context.screenWidth / 3.5,
                          context.screenHeight * 0.15,
                          index == 0? icTopCategories : index == 1? icBrands:icTopSeller,
                              (){},
                          index == 0? topCategories : index == 1? brand:topSeller
                      )),
                    ),
                    20.heightBox,

                    //Feature Categories
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featureCategories.text.size(18).fontFamily(semibold).color(darkFontGrey).make(),
                    ),
                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(3,
                                (index) => Column(
                                  children: [
                                    featuredButtons(icon: featuredImage1[index], title: featuredTitels1[index]),
                                    10.heightBox,
                                    featuredButtons(icon: featuredImage2[index], title: featuredTitels2[index])
                                  ],
                                )
                        ).toList()
                      ),
                    ),
                    20.heightBox,
                      Container(
                        padding:const EdgeInsets.all(12),
                        width: double.infinity,
                        decoration:const BoxDecoration(
                            image: DecorationImage(image: AssetImage(imgBackground1), fit: BoxFit.fill,)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            featuredProduct.text.white.fontFamily(bold).size(18).make(),
                            10.heightBox,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(6, (index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      imgP1,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                    10.heightBox,
                                    "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                                    10.heightBox,
                                    "\$600".text.color(redColor).fontFamily(bold).size(16).make()
                                  ],
                                ).box.white.roundedSM.padding(const EdgeInsets.all(8)).margin(const EdgeInsets.symmetric(horizontal: 4)).make()
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    20.heightBox,
                    //Third Swiper
                    VxSwiper.builder(
                      aspectRatio: 16/9,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      height: 150,
                      itemCount: secondSlider.length,
                      itemBuilder: (context, index) {
                        return Container(
                          clipBehavior: Clip.antiAlias,
                          margin:const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: Image.asset(
                              secondSlider[index],
                              fit: BoxFit.fill
                          ),
                        );
                      },
                    ),
                    20.heightBox,
                    //All Products
                    GridView.builder(
                      physics:const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 300),
                      itemBuilder: (context, index){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              imgP1,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            const Spacer(),
                            "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                            10.heightBox,
                            "\$600".text.color(redColor).fontFamily(bold).size(16).make()
                          ],
                        ).box.white.roundedSM.padding(const EdgeInsets.all(12)).margin(const EdgeInsets.symmetric(horizontal: 4)).make();
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
