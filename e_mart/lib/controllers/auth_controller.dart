import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  //Text Controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> loginMethod(context) async{
    UserCredential? userCredential;
    try{
      userCredential = await _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
      print(e.toString());
    }
    return userCredential;
  }


  //Signup Method
  Future<UserCredential?> signupMethod(email, password, context) async{
    UserCredential? userCredential;
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  storeUserData(name,password,email) async{
    DocumentReference store = firestore.collection(userCollections).doc(currentUser!.uid);
    store.set({'name':name, 'password':password, 'email':email, 'imageUrl':""});
  }

  //signout method
  signOutMethod(context) async{
    try{
      await auth.signOut();
    }catch(e){
      VxToast.show(context, msg: e.toString());
    }
  }
}