import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubwiru/helper/colors/constcolor.dart';

import '../controller/signin_controller.dart';




class SignInPage extends StatelessWidget {

  SignInController signUpController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: GetBuilder<SignInController>(
          builder: (signUpController) =>
           Form(
              key: SignInController.formKeyy,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Welcome to,',style: TextStyle(
                        color:titletextcolor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),),
                    ],
            
                  ),
            
                  SizedBox(height: 20,),
            
                  Text('Ubwiru',style: TextStyle(
                        color:maincolor,
                        fontSize: 58,
                        fontWeight: FontWeight.w500
                      ),),
            
            
                      SizedBox(height: 20,),
            
                 
            
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                     child: TextFormField(
                      onChanged : (_){
                         signUpController.email = _;
                              signUpController.vaalidate();
                              },
                      validator: (value) {
                         if (value == null || EmailValidator.validate(value) == false
                              ) {return 'Please enter valid email';
                              }
                              return null;
                              },
                              
                             decoration: InputDecoration(
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.email),
                              filled: true,
                              fillColor: textfieldbackgroundcolor,
                              border:OutlineInputBorder(
                                borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5.0),
                ),
            
                             ),
                            ),
                   ),
            
                   Padding(
                     padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                     child: TextFormField(
                      onChanged : (_){
                        signUpController.password = _;
                              signUpController.vaalidate();
                              },
                       validator: (value) {
                              if (value == null || value.isEmpty) {return 'Please enter password';
                              }
                              return null;
                              },
                              
                             decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              filled: true,
                              fillColor: textfieldbackgroundcolor,
                              border:OutlineInputBorder(
                                borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5.0),
                ),
            
                             ),
                            ),
                   ),
            
                    
            
                   Obx( () => signUpController.isLoading.value ? Padding(
                     padding: const EdgeInsets.only(top: 20),
                     child: CircularProgressIndicator(),
                   )
                     : Padding(
                       padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                       child: MaterialButton(onPressed: (){
                        signUpController.validate();
                       },
                       height: 50,
                       minWidth: double.infinity,
                       shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                       color: buttoncolor,
                       child: Text('SignIn',style: TextStyle(color: Colors.white,
                       fontSize: 20
                       ),),
                       ),
                     ),
                   ),

                   Padding(
                       padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                       child: MaterialButton(onPressed: (){
                        signUpController.vaalidate();
                       },
                       height: 50,
                       minWidth: double.infinity,
                       shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                       color: Colors.blueAccent.shade400,
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                          Icon(Icons.facebook,color: Colors.white,),
                          SizedBox(width: 10,),
                           Text('Log in with Facebook',style: TextStyle(color: Colors.white,
                           fontSize: 20
                           ),),
                         ],
                       ),
                       ),
                     ),
            
                   Padding(
                     padding: const EdgeInsets.only(left: 40,right: 40,top: 20),
                     child: RichText(
              text:  TextSpan(
                style: TextStyle(fontSize: 18, color:textandiconcolor),
                children: [
                  TextSpan(
              text: "Don't have account yet? ",
              style: TextStyle(fontSize: 18),
                  ),
                  TextSpan(
              text: '"Sign Up"',
              style: TextStyle(
                  decoration: TextDecoration.underline, fontSize: 19,color: buttoncolor), //<-- SEE HERE
                  ),
                
                ],
              ),
            ),
                   ),
            
            
            
                   
            
            
            
                ],
              ),
            ),
        ),
      )
    );
  }
}