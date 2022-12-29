import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../helper/colors/constapi.dart';
import '../model/postmodel.dart';

class HomePageController extends GetxController {


PostModel? postModel;
var postlength = 0.obs;

 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getpost();
  }

  poststatus(val) async {
    print('object');
    Map data ={
      "body": val.toString(),
      "title": "bb"
    };
    var response = await http.post(Uri.parse("$ApiUrl/post"),
   
  headers: {
    'Accept': "application/json",
     'Content-Type' : "application/json",
    'Authorization' : "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MzhiMTBjZGJmMTg5NjZmNDdkYTUzYWEiLCJpYXQiOjE2NzA1NjgxMTB9.f1ALkJu4V0vWX_A_iowAsQWGfLgykdP-0UnrdEu8UQI"
  },
  body : jsonEncode(data)
  );
  var b = jsonDecode(response.body);
  print(b);

  getpost();

  }

 getpost() async {
  var response = await http.get(Uri.parse("$ApiUrl/post"),
  headers: {
    'Accept': "application/json",
     'Content-Type' : "application/json",
    'Authorization' : "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MzhiMTBjZGJmMTg5NjZmNDdkYTUzYWEiLCJpYXQiOjE2NzA1NjgxMTB9.f1ALkJu4V0vWX_A_iowAsQWGfLgykdP-0UnrdEu8UQI"
  }
  );
  var b = jsonDecode(response.body);

   postModel = PostModel.fromJson(b);
   postlength.value = postModel!.data!.length;
   print(postlength);
   

 } 

}