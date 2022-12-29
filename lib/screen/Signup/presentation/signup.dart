import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubwiru/helper/colors/constcolor.dart';
import 'package:ubwiru/screen/Signup/controller/signup_controller.dart';



class SignupPage extends StatelessWidget {

  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<SignUpController>(
            builder: (signUpController) =>
             Form(
                key: SignUpController.formKeyy,
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
                       padding: const EdgeInsets.only(left: 20,right: 20),
                       child: Row(children: [
                          Expanded(
                            child: TextFormField(
                               onChanged : (_){
                                signUpController.firstName = _;
                                signUpController.vaalidate();
                                },
                              validator: (value) {
                                if (value == null || value.isEmpty) {return 'Please enter first name';
                                }
                                return null;
                                },
                             
                             decoration: InputDecoration(
                             
                              hintText: 'First Name',
                              prefixIcon: Icon(Icons.account_circle),
                              filled: true,
                              fillColor: textfieldbackgroundcolor,
                              border:OutlineInputBorder(
                                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5.0),
                  ),
              
                             ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              onChanged : (_){
                                signUpController.lastName = _;
                                signUpController.vaalidate();
                                },
                              validator: (value) {
                                if (value == null || value.isEmpty) {return 'Please enter last name';
                                }
                                return null;
                                },
                              
                             decoration: InputDecoration(
                              hintText: 'Last Name',
                              prefixIcon: Icon(Icons.account_circle),
                              filled: true,
                              fillColor: textfieldbackgroundcolor,
                              border:OutlineInputBorder(
                                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5.0),
                  ),
              
                             ),
                            ),
                          )
                        ]),
                     ),
              
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
              
                      Padding(
                       padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                       child: TextFormField(
                        onChanged : (_){
                                print(signUpController.password);
                                signUpController.vaalidate();
                                },
                         validator: (value) {
                                if(value != signUpController.password ) {
                                  return 'Password dont match';
                                }
                                return null;
                                },
                                
                               decoration: InputDecoration(
                                hintText: 'Confirm Password',
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
              
                     Padding(
                       padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                       child: DropdownButtonFormField<String>(
                        
                 decoration: InputDecoration(
                   errorText: signUpController.errorGenderText,
                                  errorStyle: TextStyle(color: Colors.red),
                
                 prefixIcon: Icon(Icons.male,),
                 filled: true,
                 fillColor: Colors.white,
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
                 borderSide: BorderSide.none
                 )
                 
                 ),
                 hint: Text('Iam a'),
                 items: <String>['Male', 'Female'].map((String value) {
                 return DropdownMenuItem<String>(
                 value: value,
                 child: new Text(value),
                     );
                    }).toList(),
                   onChanged: (_) {
                    signUpController.gender = _;
                    signUpController.vaalidate();
                   },
              ),
                     ),
              
                Padding(
                       padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                       child: DropdownButtonFormField<String>(
                        
                 decoration: InputDecoration(
                   errorText: signUpController.errorLookingForText,
                                  errorStyle: TextStyle(color: Colors.red),
                 prefixIcon: Icon(Icons.male,),
                 filled: true,
                 fillColor: Colors.white,
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
                 borderSide: BorderSide.none
                 )
                 ),
                 hint: Text('Looking for a'),
                 items: <String>['Male', 'Female'].map((String value) {
                 return DropdownMenuItem<String>(
                 value: value,
                 child: new Text(value),
                     );
                    }).toList(),
                   onChanged: (_) {
                    signUpController.lookingFor = _;
                    signUpController.vaalidate();
                   },
              ),
                     ),
              
              
                      Padding(
                       padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                       child: GestureDetector(
                        onTap: (){
                           print('object');
                            signUpController.selectDate(context
                            );
                        },
                         child: TextFormField(
                          controller: signUpController.dob,
                          onChanged : (_){
                                signUpController.vaalidate();
                                },
                         initialValue: signUpController.selecteddate,
                          enabled: false,
                          validator: (value) {
                                if (value == null || signUpController.selecteddate.toString().isEmpty) {return 'Please enter password';
                              
                                }
                                return null;
                                },
                                  
                                 decoration: InputDecoration(
                                  
                                  errorText: signUpController.errorDateText,
                                  errorStyle: TextStyle(color: Colors.red),
                                  hintText: 'Date',
                                  prefixIcon: Icon(Icons.calendar_month),
                                  // suffix: Icon(Icons.arrow_drop_down),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 25),
                                    child: Icon(Icons.arrow_drop_down,color: Colors.black54,),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border:OutlineInputBorder(
                                    borderSide: BorderSide.none,
                               // borderRadius: BorderRadius.circular(5.0),
                           ),
                       
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
                          signUpController.vaalidate();
                         },
                         height: 50,
                         minWidth: double.infinity,
                         shape:  RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                         color: buttoncolor,
                         child: Text('SignUp',style: TextStyle(color: Colors.white,
                         fontSize: 20
                         ),),
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
                text: 'By selecting ',
                style: TextStyle(fontSize: 18),
                    ),
                    TextSpan(
                text: '"Sign Up"',
                style: TextStyle(
                    decoration: TextDecoration.underline, fontSize: 19,color: buttoncolor), //<-- SEE HERE
                    ),
                    TextSpan(
                text: ' You agree to our',
                style: TextStyle(fontSize: 18,color:textandiconcolor),
                    ),
                  ],
                ),
              ),
                     ),
              
              
                      Padding(
                       padding: const EdgeInsets.only(left: 35,right: 35),
                       child: RichText(
                text:  TextSpan(
                  style: TextStyle(fontSize: 18, color:textandiconcolor),
                  children: [
                    TextSpan(
                text: 'Terms and use.',
                style: TextStyle(
                    decoration: TextDecoration.underline, fontSize: 19,color: Colors.black87), //<-- SEE HERE
                    ),
                    TextSpan(
                text: ' (introducing the mandatory)',
                style: TextStyle(fontSize: 18,color:textandiconcolor),
                    ),
                  ],
                ),
              ),
                     ),
              
               Padding(
                       padding: const EdgeInsets.only(left: 35,right: 35),
                       child: RichText(
                text:  TextSpan(
                  style: TextStyle(fontSize: 18, color:textandiconcolor),
                  children: [
                    TextSpan(
                text: 'arbritation of disputes) and constent to our',
                style: TextStyle(fontSize: 18,color:textandiconcolor),
                    ),
                  ],
                ),
              ),
                     ),
              
                      Padding(
                       padding: const EdgeInsets.only(left: 35,right: 35),
                       child: RichText(
                text:  TextSpan(
                  style: TextStyle(fontSize: 18, color:textandiconcolor),
                  children: [
                    TextSpan(
                text: 'Privacy policy.',
                style: TextStyle(
                    decoration: TextDecoration.underline, fontSize: 19,color: Colors.black87), //<-- SEE HERE
                    ),
                  
                  ],
                ),
              ),
                     ),
              
              
                     
              
              
              
                  ],
                ),
              ),
          ),
        ),
      )
    );
  }
}