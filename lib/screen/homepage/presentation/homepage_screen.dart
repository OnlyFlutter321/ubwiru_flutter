import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubwiru/helper/colors/constcolor.dart';
import 'package:ubwiru/screen/homepage/controller/controller.dart';
import 'package:ubwiru/screen/widget/postwidget.dart';

class HomePageScreen extends StatelessWidget{
  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: Column(
          children: [
            
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Text('Ubwiru',style: TextStyle(
                              color:maincolor,
                              fontSize: 55,
                              fontWeight: FontWeight.w500
                            ),),

                            Icon(Icons.search,color: buttoncolor,size: 40,)
                      ],
                    ),
                  ),

                  SizedBox(height: 20,),
                  textpostwidget(),

                  SizedBox(height: 20,),
                 
                   Expanded(
                     child: Obx( ()=>
                        ListView.builder(
                          
                          itemCount: homePageController.postlength.value,
                          itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Container(
                              color:Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: PostWidget(profilePic: "profilePic",
                                postBody: homePageController.postModel!.data![index].body,
                                postedBy:homePageController.postModel!.data![index].postedBy!.firstname,
                                image: homePageController.postModel!.data![index].image,
                                ),
                              ),
                            ),
                          );
                        }
                        ),
                     ),
                   )
                 
          ],
        )
      ),
    );
  }
textpostwidget() {
  return Container(
    decoration: BoxDecoration(
      boxShadow:  [BoxShadow(
        offset: Offset(1, 2),
      color: Colors.grey.shade200,
      blurRadius: 10.0,
    ),]
    ),
    child: Column(
      children: [
        Container(
          color: Colors.white,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                 height: 60,
                width: Get.width/3,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(children: [
                    Icon(Icons.add_card_rounded),
                    SizedBox(width: 5,),
                    Text('Status',style: TextStyle(fontSize: 18),)
                  ],),
                ),
              ),
              
        
              Container(
                width: Get.width/3,
                height: 60,
                color: backgroundcolor,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(children: [
                    Icon(Icons.photo),
                    SizedBox(width: 5,),
                    Text('Photo',style: TextStyle(fontSize: 18),)
                  ],),
                ),
              ),
              
        
              Container(
                 height: 60,
                width: Get.width/3,
                color: backgroundcolor,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(children: [
                    
                    Icon(Icons.video_call),
                    SizedBox(width: 5,),
                    Text('video',style: TextStyle(fontSize: 18),)
                  ],),
                ),
              )
             
        
            ],
          ),
        ),

     
      Container(
         decoration: BoxDecoration(
          
          border: Border(
           
            bottom: BorderSide(width: 2.0, color: Colors.grey.shade300),
          ),
          color: Colors.white,
        ),
        // color: Colors.white,
        // height: Get.height/5.2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                CircleAvatar(
                      radius: 25.0,
                     
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(width: 5,),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: Get.height/7.2,
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: ((value) {
                              homePageController.poststatus(value);
                            }),
                            
                            maxLines: null,
                            decoration: InputDecoration.collapsed(hintText: 'What do you wanna  say'),
                                        
                          ),
                        ),
                      ),
                    ),
                     
 

              ]),
            
            ],
          ),
        ),
      ),


       
       


      Container(
        color: Colors.white,
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 5,),
                    Text('Checkin')
                  ],
                ),

                SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    thickness: 2,
                  ),
                ),

                Row(
                  children: [
                    Icon(Icons.face),
                    SizedBox(width: 5,),
                    Text('Activity')
                  ],
                ),

                
                SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    thickness: 2,
                  ),
                ),

                  Row(
                  children: [
                    Icon(Icons.camera_alt_outlined),
                    SizedBox(width: 5,),
                    Text('Media')
                  ],
                ),


              ],
            )
          ],
        ),
      )

     






      ],
    ),
  );
}


}

 