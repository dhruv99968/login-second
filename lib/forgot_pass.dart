import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_second/create_n_a.dart';
import 'package:login_second/main.dart';
class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  TextEditingController _email = TextEditingController();
  bool emailValid = true;
  //bool passValid = true;
  Color emailColor = Color(0xFF1F41BB);
  //Color passColor = Color(0xFF1F41BB);
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
                        "Forgot Password Here",
                        style: TextStyle(
                            color: Color(0xFF1F41BB),
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Welcome back you’ve been missed!",
                        style: TextStyle(
                          color: Color(
                            0xFF000000,
                          ),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
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

                      Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Sign in ?",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1F41BB)),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: FilledButton(
                              onPressed: () {
                                final email = RegExp(
                                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                if (_email.text.isEmpty) {
                                  setState(() {
                                   emailValid = false;
                                  });
                                  print('Logcat: Please Enter the email');
                                  Fluttertoast.showToast(
                                    msg: 'Logcat: Please Enter the Email',
                                    gravity: ToastGravity.BOTTOM,
                                    toastLength: Toast.LENGTH_LONG,
                                  );
                                }
                                if (_email.text.isNotEmpty ) {
                                  if (email.hasMatch(_email.text) ) {
                                    print('ok ' + _email.text.toLowerCase());
                                    setState(() {
                                      emailValid = true;
                                    });
                                    Fluttertoast.showToast(
                                        msg: 'ok',
                                        gravity: ToastGravity.BOTTOM,
                                        toastLength: Toast.LENGTH_SHORT);
                                  } else if (email.hasMatch(_email.text) == false) {
                                    setState(() {
                                      emailValid = false;
                                    });
                                    print('enter valid email');
                                    Fluttertoast.showToast(
                                        msg: 'Invalid email formate',
                                        gravity: ToastGravity.BOTTOM,
                                        toastLength: Toast.LENGTH_SHORT);
                                  }
                                  else{
                                    setState(() {
                                      emailValid = false;
                                    });
                                  }
                                }
                              },
                              child: Text("Send"),
                              style: FilledButton.styleFrom(
                                  backgroundColor: Color(0xFF1F41BB),
                                  foregroundColor: Color(0xFFFFFFFF),
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15)),
                            ),
                          )),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CreateNA()));
                        },
                        child: Text(
                          "Create new account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(
                                0xFF494949,
                              ),
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
              ))),);
  }
}
