import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateNA extends StatefulWidget {
  const CreateNA({super.key});

  @override
  State<CreateNA> createState() => _CreateNAState();
}

class _CreateNAState extends State<CreateNA> {
  TextEditingController _email = TextEditingController();
  TextEditingController _createpassword = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool emailValid = true;
  bool passValid = true;
  bool cpassValid = true;
  Color emailColor = Color(0xFF1F41BB);
  Color passColor = Color(0xFF1F41BB);
  String spasswod = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        /* appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
     //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          backgroundColor: Color(0xFFFFFFFF),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      //  title: Text(widget.title),
      ),*/
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyle(
                          color: Color(0xFF1F41BB),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Create an account so you can explore all the existing jobs",
                      style: TextStyle(
                        color: Color(
                          0xFF000000,
                        ),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        autocorrect: true,
                        enableSuggestions: true,
                        //  enableIMEPersonalizedLearning: true,
                        //  scribbleEnabled: true,
                        //  showCursor: true,
                        canRequestFocus: true,
                        cursorColor: Colors.greenAccent,
                        cursorOpacityAnimates: true,
                        autofocus: true,
                        decoration: InputDecoration(
                          errorText: emailValid ? null :"Please Email ID",
                          label: Text('Email',style: TextStyle(color: Color(0xFF626262)),),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: emailColor,width: 3),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: emailColor, width: 3),
                          ),
                          /* disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: emailColor,width: 10),
                          ),*/
                          /*  enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: emailColor, width: 3),
                          ),*/
                          /*focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: emailColor, width: 4),
                          ),*/
                          /* errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: emailColor, width: 3),
                          ),*/
                          filled: true,
                          fillColor: Color(0xFFF1F4FF),
                        ),
                        onChanged: (value){
                          setState(() {
                            emailValid = true;
                          });
                        },
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{3,}$').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        /* onChanged: (value){
                      final email = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{3,}$');
                      if(email.hasMatch(value) == false){
                        setState(() {
                        //  emailColor = Colors.red;
                          emailValid = false;
                        });
                      }else if(email.hasMatch(value) == true){
                        setState(() {
                         // emailColor = Color(0xFF1F41BB);
                          emailValid = true;
                        });
                      }else{
                        setState(() {
                         // emailColor = Color(0xFF1F41BB);
                          emailValid = true;
                        });
                      }

                    },*/
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: _password,
                        keyboardType: TextInputType.visiblePassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        autocorrect: true,
                        enableSuggestions: true,
                        //  enableIMEPersonalizedLearning: true,
                        //  scribbleEnabled: true,
                        //  showCursor: true,
                        canRequestFocus: true,
                        cursorColor: Colors.greenAccent,
                        cursorOpacityAnimates: true,
                        autofocus: true,
                        maxLength: 10,
                        decoration: InputDecoration(
                          errorText: passValid ? null : "Please Enter Password",
                          label: Text(
                            "Password",
                            style: TextStyle(color: Color(0xFF626262)),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: passColor, width: 3),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: passColor, width: 3),
                          ),
                          /* enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: passColor, width: 3),
                          ),*/
                          filled: true,
                          fillColor: Color(0xFFF1F4FF),
                        ),
                        onChanged: (value){
                          setState(() {
                            passValid = true;
                            spasswod = value;
                          });
                        },
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return 'Please enter an password';
                          } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        /* onChanged: (value){
                       final pass = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]');
                       if(pass.hasMatch(value) == false){
                         setState(() {
                           passValid = false;
                           passColor = Colors.red;
                         });
                       }else if(pass.hasMatch(value) == true){
                         setState(() {
                           passColor = Color(0xFF1F41BB);
                           passValid = true;
                         });
                       }else{
                         setState(() {
                           passColor = Color(0xFF1F41BB);
                           passValid = true;
                         });
                       }
                     },*/
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                          controller: _createpassword,
                          keyboardType: TextInputType.visiblePassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          autocorrect: true,
                          enableSuggestions: true,
                          //  enableIMEPersonalizedLearning: true,
                          //  scribbleEnabled: true,
                          //  showCursor: true,
                          canRequestFocus: true,
                          cursorColor: Colors.greenAccent,
                          cursorOpacityAnimates: true,
                          autofocus: true,
                          maxLength: 10,
                          decoration: InputDecoration(
                            errorText: cpassValid ? null : "Please Enter Same Password",
                            label: Text(
                              "Confirm Password",
                              style: TextStyle(color: Color(0xFF626262)),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: passColor, width: 3),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: passColor, width: 3),
                            ),
                            /* enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: passColor, width: 3),
                          ),*/
                            filled: true,
                            fillColor: Color(0xFFF1F4FF),
                          ),
                        onChanged: (value){

                            setState(() {
                              cpassValid = false;
                            });
                        },
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return 'Please enter an password';
                          } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }else if(spasswod == _createpassword){
                            setState(() {
                              cpassValid = true;
                            });
                            return null;
                          }
                          return null;
                        },
                        /* onChanged: (value){
                       final pass = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]');
                       if(pass.hasMatch(value) == false){
                         setState(() {
                           passValid = false;
                           passColor = Colors.red;
                         });
                       }else if(pass.hasMatch(value) == true){
                         setState(() {
                           passColor = Color(0xFF1F41BB);
                           passValid = true;
                         });
                       }else{
                         setState(() {
                           passColor = Color(0xFF1F41BB);
                           passValid = true;
                         });
                       }
                     },*/
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: FilledButton(
                            onPressed: () {
                              final email = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                              final pass = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]');
                              if (_email.text.isEmpty) {
                                setState(() {
                                  emailValid = false;
                                  // emailColor = Colors.red;
                                });
                                print('Logcat: Please Enter the email');
                                Fluttertoast.showToast(
                                  msg: 'Logcat: Please Enter the Email',
                                  gravity: ToastGravity.BOTTOM,
                                  toastLength: Toast.LENGTH_LONG,
                                );
                              } else if (_password.text.isEmpty) {
                                setState(() {
                                  passValid = false;
                                  // emailColor = Colors.red;
                                });
                                print('Logcat: Please Enter the password');
                                Fluttertoast.showToast(
                                  msg: 'Please Enter the password',
                                  gravity: ToastGravity.BOTTOM,
                                  toastLength: Toast.LENGTH_LONG,
                                );
                              } else if (_createpassword.text.isEmpty) {
                                setState(() {
                                  cpassValid = false;
                                });
                                print('Logcat: Please Re-enter the password');
                                Fluttertoast.showToast(
                                  msg: 'Please Re-enter the password',
                                  gravity: ToastGravity.BOTTOM,
                                  toastLength: Toast.LENGTH_LONG,
                                );
                              }
                              if (_email.text.isNotEmpty &&
                                  _password.text.isNotEmpty &&
                                  _createpassword.text.isNotEmpty) {
                                setState(() {
                                  emailValid = true;
                                  passValid =true;
                                  cpassValid =true;
                                  // emailColor = Color(0xFF1F41BB);
                                  //  passColor = Color(0xFF1F41BB);
                                });
                                if (email.hasMatch(_email.text) &&
                                    pass.hasMatch(_password.text) &&
                                    pass.hasMatch(_createpassword.text)) {
                                  setState(() {
                                    emailValid = true;
                                    passValid =true;
                                    cpassValid =true;
                                    // emailColor = Color(0xFF1F41BB);
                                    //  passColor = Color(0xFF1F41BB);
                                  });
                                  if (_password.text == _createpassword.text) {
                                    setState(() {
                                      emailValid = true;
                                      passValid =true;
                                      cpassValid =true;
                                      // emailColor = Color(0xFF1F41BB);
                                      //  passColor = Color(0xFF1F41BB);
                                    });
                                    print('ok ' + _email.text.toLowerCase());
                                    Fluttertoast.showToast(
                                        msg: 'ok',
                                        gravity: ToastGravity.BOTTOM,
                                        toastLength: Toast.LENGTH_SHORT);
                                  } else  if (_password.text != _createpassword.text){
                                    setState(() {
                                      cpassValid =false;
                                    });
                                    print('Plaese Enter Same Password');
                                    Fluttertoast.showToast(
                                        msg: 'Plaese Enter Same Password',
                                        gravity: ToastGravity.BOTTOM,
                                        toastLength: Toast.LENGTH_SHORT);
                                  }
                                } else if (email.hasMatch(_email.text) == false) {
                                  setState(() {
                                    emailValid = false;
                                  });
                                  print('invalid email formate');
                                  Fluttertoast.showToast(
                                      msg: 'invalid email formate',
                                      gravity: ToastGravity.BOTTOM,
                                      toastLength: Toast.LENGTH_SHORT);
                                } else if (pass.hasMatch(_password.text) ==
                                        false ) {
                                  setState(() {

                                    passValid =false;
                                    cpassValid =false;

                                  });
                                  print('invalid password formate');
                                  Fluttertoast.showToast(
                                      msg: 'invalid password formate',
                                      gravity: ToastGravity.BOTTOM,
                                      toastLength: Toast.LENGTH_SHORT);
                                } else if (pass.hasMatch(_password.text) ==
                                    false &&
                                    pass.hasMatch(_createpassword.text) ==
                                        false) {
                                  setState(() {

                                    passValid =false;
                                    cpassValid =false;

                                  });
                                  print('invalid password formate');
                                  Fluttertoast.showToast(
                                      msg: 'invalid password formate',
                                      gravity: ToastGravity.BOTTOM,
                                      toastLength: Toast.LENGTH_SHORT);
                                }
                              }
                            },
                            child: Text("Sign up"),
                            style: FilledButton.styleFrom(
                                backgroundColor: Color(0xFF1F41BB),
                                foregroundColor: Color(0xFFFFFFFF),
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ),
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Already have an account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(
                              0xFF494949,
                            ),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
