import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubwiru/screen/Dashboard/dashboard.dart';
import 'package:ubwiru/screen/sign_in/model/signmodel.dart';
import '../../../helper/colors/constapi.dart';

class SignInController extends GetxController{

var isLoading = false.obs;
String? password;
 String? email;
  static GlobalKey<FormState> formKeyy = GlobalKey<FormState>();
SignInModel? signInModel;


  vaalidate(){
  if (formKeyy.currentState!.validate() ){
  update();

  }
else{
 update();
 
}

 }

 validate(){
  if (formKeyy.currentState!.validate() ){
  update();
  signinApi();

  }
else{
 update();
 
}

 }


  signinApi() async {
 isLoading = true.obs;
 Map data = {
    "email" : email,
    "password" : password,
 };
 print(data);

 try{
 var response = await http.post(Uri.parse("${ApiUrl}login"),
    headers: {
      "Content-type": "application/json", "Accept": "application/json"
    },
    body: jsonEncode(data)
 );

  print(response.body);
  var b = jsonDecode(response.body);
   if(b['success'] == false){
    Get.snackbar("Error", b["error"]);
    isLoading = false.obs;
  update();
   }

 if(b['success'] == true){
   signInModel = SignInModel.fromJson(b);
   final prefs = await SharedPreferences.getInstance();
   String? t = signInModel!.token;
   prefs.setString('token',t!);
   print(prefs.getString('token'));
    isLoading = false.obs;
  update();
  Get.to(()=>DashboardScreen());
   }
 } catch (e) {
  print(e);
   isLoading = false.obs;
  update();

 }

 
 

 }




}