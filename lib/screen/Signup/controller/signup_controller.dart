import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ubwiru/helper/colors/constapi.dart';

class SignUpController extends GetxController{
  TextEditingController dob = TextEditingController();
 String? firstName;
 var isLoading = false.obs;
 var errorDateText ;
 var errorGenderText ;
 var errorLookingForText ;
 String? lastName;
 String? email;
 String? password;
 String? confPassword;
 var validate = false.obs;
 var gender;
 var lookingFor;
 static GlobalKey<FormState> formKeyy = GlobalKey<FormState>();


var selecteddate ;
DateTime selected = DateTime.now();
DateTime initial = DateTime(2000);

  var ba;


 void selectDate(BuildContext context) async {
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selected, // Refer step 1
    firstDate: DateTime(2000),
    lastDate: DateTime(2025),
  );
  if (picked != null && picked != selecteddate)
      ba = picked!.toLocal();
      dob.text = ba.toString().split(' ')[0];
      update();

}

  vaalidate(){
  if (formKeyy.currentState!.validate() && selecteddate.toString() != null && gender.toString() != null && lookingFor.toString() != null){
    errorDateText = null;
   errorGenderText = null;
   errorLookingForText = null;
  update();
  signupApi();

  }
else{
   errorDateText = 'Please Select Date';
   errorGenderText = 'Please Select Gender';
   errorLookingForText = 'Please Select Looking For';
 update();
 
}

 }

 Future<void> signupApi() async {
 isLoading = true.obs;
 Map data = {
    "firstname" : firstName,
    "lastname" : lastName,
    "email" : email,
    "gender" : gender,
    "lookingfor" : lookingFor,
    "dob" : selecteddate,
    "password" : password,
 };
 print(data);
 var response = await http.post(Uri.parse("${ApiUrl}createaccount"),
    headers: {
      "Content-type": "application/json", "Accept": "application/json"
    },
    body: jsonEncode(data)
 );

  print(response.body);
  isLoading = false.obs;


 }



}