import 'package:flutter/material.dart';
import 'package:todo_app/core/firebase_utils.dart';
import 'package:todo_app/core/services/snack_bar_servce.dart';

class registerationview extends StatefulWidget {
  const registerationview({super.key});

  @override
  State<registerationview> createState() => _registerationviewState();
}

class _registerationviewState extends State<registerationview> {
  @override
  var formkey= GlobalKey<FormState>();
  TextEditingController personcontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();

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
          title: Text("Create Account",
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

                TextFormField(
                  controller: personcontroller,
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

                    return null;
                  },
                  decoration:
                  InputDecoration(
                    hintText: "Enter your Name",
                    hintStyle: theme.textTheme.displaySmall,
                    label: Text(
                      "Full Name",
                      style: theme.textTheme.displaySmall,
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: theme.primaryColor,
                          width: 2,
                        )
                    ),
                    suffixIcon: const Icon(Icons.person),
                    errorStyle: const TextStyle(

                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "poppians",
                      // color: Colors.black,
                    ),
                  ),


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
                // TextFormField(
                //   controller: passwordcontroller,
                //   cursorColor: theme.primaryColor,
                //   obscureText: isobscured,
                //   obscuringCharacter: "*",
                //   cursorHeight: 25,
                //   style: TextStyle(
                //
                //     fontSize: 17,
                //     fontWeight: FontWeight.bold,
                //     fontFamily: "poppians",
                //     color: Colors.black,
                //   ),
                //   validator: (value) {
                //     if(value==null|| value.trim().isEmpty){
                //       return "Plz Enter Your Email adress";
                //     }
                //
                //
                //     return null;
                //   },
                //   decoration:
                //   InputDecoration(
                //     hintText: "Enter your Password",
                //     hintStyle: theme.textTheme.displaySmall,
                //     label: Text(
                //       "Password",
                //       style: theme.textTheme.displaySmall,
                //     ),
                //     focusedBorder: UnderlineInputBorder(
                //         borderSide: BorderSide(
                //           color: theme.primaryColor,
                //           width: 2,
                //         )
                //     ),
                //     suffixIcon: InkWell(
                //         onTap: () {
                //           setState(() {
                //             isobscured=!isobscured;
                //           });
                //
                //         },
                //         child: Icon(
                //           isobscured ? Icons.visibility: Icons.visibility_off,
                //         )
                //     ),
                //     errorStyle: TextStyle(
                //
                //       fontSize: 14,
                //       fontWeight: FontWeight.bold,
                //       fontFamily: "poppians",
                //       // color: Colors.black,
                //     ),
                //   ),
                // ),

                const SizedBox(height: 20,),


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
                        FirebaseUtils.createAccount(emailcontroller.text, passwordcontroller.text).then((Value){
                          if(Value){
                            Navigator.pop(context);
                            SnackBarService.showSuccessMessage("Account Successfully Created");
                          }
                        });

                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Create Account",
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
              ],
            ),
          ),
        ),

      ),
    );

  }
}
