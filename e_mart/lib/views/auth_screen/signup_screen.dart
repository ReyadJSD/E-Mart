import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/controllers/auth_controller.dart';
import 'package:e_mart/views/auth_screen/login_screen.dart';
import 'package:e_mart/views/home_screen/home.dart';
import 'package:e_mart/widgets_common/applogo_widget.dart';
import 'package:e_mart/widgets_common/bg_widget.dart';
import 'package:e_mart/widgets_common/buttons.dart';
import 'package:e_mart/widgets_common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key?key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isChecked = false;
  var controller = Get.put(AuthController());
  //Text Controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var retypePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return bgwidget(
        Scaffold(
          resizeToAvoidBottomInset: false ,
          body: Center(
            child: Column(
              children: [
                (context.screenHeight * 0.1).heightBox,
                applogowidget(),
                10.heightBox,
                "Join to $appname".text.fontFamily(bold).white.size(18).make(),
                5.heightBox,
                Expanded(
                  child: Column(
                    children: [
                      customTextField(name, namehint,nameController,false),
                      10.heightBox,
                      customTextField(email, emailhint, emailController,false),
                      10.heightBox,
                      customTextField(password, passwordhint,passwordController,true),
                      10.heightBox,
                      customTextField(retypePassword, passwordhint,retypePasswordController,true),
                      10.heightBox,
                      Row(
                        children: [
                          Checkbox(
                              activeColor: redColor,
                              value: isChecked,
                              onChanged: (newValue){
                                setState(() {
                                  isChecked = newValue;
                                });
                              }
                          ),
                          2.widthBox,
                          Expanded(
                            child: RichText(
                                text:const TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "I agree to the ",
                                          style: TextStyle(
                                              fontFamily: regular,
                                              color: fontGrey
                                          )
                                      ),
                                      TextSpan(
                                          text: termsCondition,
                                          style: TextStyle(
                                              fontFamily: regular,
                                              color: redColor
                                          )
                                      ),
                                      TextSpan(
                                          text: " & ",
                                          style: TextStyle(
                                              fontFamily: regular,
                                              color: fontGrey
                                          )
                                      ),
                                      TextSpan(
                                          text: privacyPolicy,
                                          style: TextStyle(
                                              fontFamily: regular,
                                              color: redColor
                                          )
                                      )
                                    ]
                                )
                            ),
                          ),
                        ],
                      ),
                      buttons(() async{
                        if(isChecked != false){
                          try{
                            await controller.signupMethod(emailController.text, passwordController.text, context).then((value){
                              return controller.storeUserData(nameController.text, passwordController.text, emailController.text);
                            }).then((value){
                              VxToast.show(context, msg: loggedIn);
                              Get.offAll(()=> LoginScreen());
                            });
                          }catch(e){
                            auth.signOut();
                            VxToast.show(context, msg: e.toString());
                          }
                        }
                      }, isChecked == true? redColor : fontGrey, whiteColor, signup)
                          .box.width(context.screenWidth -50).make(),
                      10.heightBox,
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: RichText(text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: alreadyHaveAnAccount,
                                  style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey
                                  )
                              ),
                              TextSpan(text: " "),
                              TextSpan(
                                  text: login,
                                  style: TextStyle(
                                      fontFamily: regular,
                                      color: redColor
                                  )
                              )
                            ]
                        )),
                      )
                    ],
                  ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).margin(EdgeInsets.only(bottom: 15)).shadowSm.make(),
                ),
              ],
            ),
          ),

        ));
  }
}

