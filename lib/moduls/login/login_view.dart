import 'package:flutter/material.dart';
import 'package:todo_app/core/firebase_utils.dart';
import 'package:todo_app/core/page_routs_names.dart';
import 'dart:core';

import 'package:todo_app/moduls/layout_view.dart';

class loginview extends StatefulWidget {
  const loginview({super.key});

  @override
  State<loginview> createState() => _loginviewState();
}

class _loginviewState extends State<loginview> {
  var formkey= GlobalKey<FormState>();
  TextEditingController   emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  bool  isobscured=true;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);

     return Container(
       decoration:
     const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Rectangle 13.png",
                    ),
                     fit: BoxFit.contain,
                      alignment: Alignment.topCenter
                  ),

                 color: Color(0xffDFECDB),
     ),


       child: Scaffold(
         backgroundColor: Colors.transparent  ,
         appBar: AppBar(
           title: Text("Login",
           style: theme.textTheme.titleLarge,),
           shadowColor: Colors.transparent,
           centerTitle: true,


         ),

         body:
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20.0),
           child: Form(
             key: formkey,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 SizedBox(height: mediaQuery.size.height*0.2),
                 Text(
                   "Welcome Back!",
                   style: theme.textTheme.titleLarge?.
                   copyWith(color: Colors.black,
                       fontWeight: FontWeight.w600),

                 ),
                 TextFormField(
                   controller: emailcontroller,
                   cursorColor: theme.primaryColor,
                   cursorHeight: 25,
                   style: const TextStyle(

                     fontSize: 17,
                     fontWeight: FontWeight.bold,
                     fontFamily: "poppians",
                     color: Colors.black,
                   ),
                   validator: (value) {
                     if(value==null|| value.trim().isEmpty){
                       return "Plz Enter Your Email adress";
                     }
                     var regex= RegExp(
                       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$&%`*-+-/=?^_`{|}~]+@[a-zA-Z0-9]+|.[a-zA-Z]+"
                     );
                     if (!regex.hasMatch(value)){
                       return "invalid email";
                     }
                     return null;
                   },
                   decoration:
                   InputDecoration(
                     hintText: "Enter your E_mail",
                     hintStyle: theme.textTheme.displaySmall,
                     label: Text(
                       "E_mail",
                       style: theme.textTheme.displaySmall,
                     ),
                     focusedBorder: UnderlineInputBorder(
                       borderSide: BorderSide(
                         color: theme.primaryColor,
                         width: 2,
                       )
                     ),
                     suffixIcon: const Icon(Icons.email),
                     errorStyle: const TextStyle(

                       fontSize: 14,
                       fontWeight: FontWeight.bold,
                       fontFamily: "poppians",
                       // color: Colors.black,
                     ),
                   ),


                 ),
                 TextFormField(
                   controller: passwordcontroller,
                   cursorColor: theme.primaryColor,
                   obscureText: isobscured,
                   obscuringCharacter: "*",
                   cursorHeight: 25,
                   style: const TextStyle(

                     fontSize: 17,
                     fontWeight: FontWeight.bold,
                     fontFamily: "poppians",
                     color: Colors.black,
                   ),
                   validator: (value) {
                     if(value==null|| value.trim().isEmpty){
                       return "Plz Enter Your Email adress";
                     }


                     return null;
                   },
                   decoration:
                   InputDecoration(
                     hintText: "Enter your Password",
                     hintStyle: theme.textTheme.displaySmall,
                     label: Text(
                       "Password",
                       style: theme.textTheme.displaySmall,
                     ),
                     focusedBorder: UnderlineInputBorder(
                       borderSide: BorderSide(
                         color: theme.primaryColor,
                         width: 2,
                       )
                     ),
                     suffixIcon: InkWell(
                       onTap: () {
                         setState(() {
                           isobscured=!isobscured;
                         });

                       },
                         child: Icon(
                             isobscured ? Icons.visibility: Icons.visibility_off,
                         )
                     ),
                     errorStyle: const TextStyle(

                       fontSize: 14,
                       fontWeight: FontWeight.bold,
                       fontFamily: "poppians",
                       // color: Colors.black,
                     ),
                   ),
                 ),
                 const SizedBox(height: 20,),

                 InkWell(
                   child: Text(
                     " Forget Password?",
                     style: theme.textTheme.displaySmall?.copyWith(
                       fontWeight: FontWeight.w500,
                       fontSize: 14,
                       decoration: TextDecoration.underline,
                     ),
                   ),
                 ),

                 const SizedBox(height: 60,),
                 FilledButton(

                     style: FilledButton.styleFrom(
                       padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                       backgroundColor: theme.primaryColor,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(8.0),
                       )
                     ),

                     onPressed: () {
                        if(formkey.currentState!.validate()){
                        FirebaseUtils.signIn(emailcontroller.text, passwordcontroller.text)
                            .then(
                                (Value){
                          if(Value){
                            Navigator.pushReplacementNamed(context,pageroutesname.layout )

                            ;
                          }
                        }
                        );
                        }
                     },
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                           "Login",
                           style: theme.textTheme.displaySmall?.copyWith(
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                             fontSize: 15
                           ),
                         ),
                         const Icon(Icons.arrow_forward,),
                       ],
                     )
                 ),
                 const SizedBox(height: 20,),

                 InkWell(
                   onTap: () {
                     Navigator.pushNamed(context, pageroutesname.registeration);
                   },
                   child: Text(
                     "Or Create New Account",
                     style: theme.textTheme.displaySmall?.copyWith(
                       fontWeight: FontWeight.w500,
                       fontSize: 14,
                       decoration: TextDecoration.underline,
                     ),
                   ),
                 ),

               ],
             ),
           ),
         ),

       ),
     );
       // Scaffold(
    //   body: Column(
    //     children: [
    //       Container(
    //         decoration: BoxDecoration(
    //           image: DecorationImage(
    //             image: AssetImage("assets/images/Rectangle 13.png"),
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //         child: SizedBox(
    //           width: double.infinity,
    //           child: Padding(
    //             padding: EdgeInsets.only(top: mediaQuery.size.height * 0.2,left: 20,right: 20,),
    //             child: Column(
    //                // crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 Text(
    //                   "Login",
    //                   textAlign: TextAlign.center,
    //                   style: theme.textTheme.titleLarge,
    //                 ),
    //                 SizedBox(height: mediaQuery.size.height * 0.1),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //       // Add an additional space here
    //       SizedBox(height: 2,), // Adjust as necessary
    //       Row(
    //         children: [
    //           Text(
    //
    //             "Welcome Back!",
    //             style: theme.textTheme.titleLarge?.
    //             copyWith(color: Colors.black,
    //             fontWeight: FontWeight.w500),
    //
    //           ),
    //
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
