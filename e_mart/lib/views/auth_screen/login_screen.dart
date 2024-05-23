import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/consts/utils.dart';
import 'package:e_mart/controllers/auth_controller.dart';
import 'package:e_mart/views/auth_screen/signup_screen.dart';
import 'package:e_mart/views/home_screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:e_mart/consts/lists.dart';
import 'package:e_mart/widgets_common/applogo_widget.dart';
import 'package:e_mart/widgets_common/bg_widget.dart';
import 'package:e_mart/widgets_common/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../../widgets_common/buttons.dart';
var controller = AuthController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // bool _loading = false;
  // bool get loading => _loading;
  // setLoading(bool value) {
  //   _loading = value;
  //   // notifyListeners();
  // }
  // FirebaseAuth _auth = FirebaseAuth.instance;
  // void _login() {
  //   setState(() {
  //     _loading = true;
  //   });
  //   _auth
  //       .signInWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text.toString())
  //       .then((value) {
  //     Utils.toastMessage(value.user!.email.toString());
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: (context) => const Home()));
  //     setState(() {
  //       _loading = false;
  //     });
  //   }).onError((error, stackTrace) {
  //     debugPrint(error.toString());
  //     Utils.toastMessage(error.toString());
  //     setState(() {
  //       _loading = false;
  //     });
  //   });
  // }
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
                "Log in to ${appname}".text.fontFamily(bold).white.size(18).make(),
                5.heightBox,
                Column(
                  children: [
                    customTextField(email, emailhint, controller.emailController,false),
                    10.heightBox,
                    customTextField(password, passwordhint, controller.passwordController,true),
                    TextButton(
                        onPressed: (){},
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: forgotpassword.text.make()
                        )
                    ),
                    // ElevatedButton(onPressed: (){_login();}, child: Text('Login'))
                    buttons(() async{
                      await controller.loginMethod(context).then((value){
                        if(value != null){
                          VxToast.show(context, msg: loggedIn);
                          Get.offAll(() =>const Home());
                        }else{
                          VxToast.show(context, msg: "Error to logged in");
                        }
                      });
                    }, redColor, whiteColor, login)
                        .box.width(context.screenWidth -50).make(),
                    5.heightBox,
                    createNewAccount.text.color(fontGrey).make(),
                    5.heightBox,
                    buttons((){Get.to(()=> const SignupScreen());}, lightGolden, redColor, signup)
                    .box.width(context.screenWidth - 50).make(),
                    5.heightBox,
                    loginWith.text.color(fontGrey).fontFamily(bold).make(),
                    5.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) => CircleAvatar(
                        backgroundColor: lightGrey,
                        radius: 25,
                        child: Image.asset(socialIconLogo[index], width: 30),
                      ).box.margin(EdgeInsets.symmetric(horizontal: 3)).make()),

                    )
                  ],
                ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),

              ],
            ),
          ),

    ));
  }
}
