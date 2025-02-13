import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firstpage.dart';
import 'modelClass/User.dart';

class profileUpdate extends StatefulWidget {
  final String images;
  final dynamic name;
  final dynamic phone;
  final dynamic age;
  final dynamic profession;

  const profileUpdate({Key? key ,required this.images,required this.name, required this.phone, required this.age, required this.profession,  }): super(key: key);

  @override
  State<profileUpdate> createState() => _profileUpdateState();
}

class _profileUpdateState extends State<profileUpdate> {
  TextEditingController _name = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _profession = TextEditingController();
  String? textValue;
  bool penColor = true;
  String? n,p,a,pro;
 // String path="";
  String? path;
  String? imageName;
  XFile? image;
  final ImagePicker picker = ImagePicker();
  void getimage() async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {

      path =  sharedPreferences.getString("image").toString();
      print(path);
      penColor = true;
    });
  }

  Future<void> upload() async {
    // User user = User(name: _name.text.toString(), path: image!.name.toString());


    try {
      /* Response response = await http.put(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $token',
           // 'Content-Type': 'application/json',
            //Content-Type': 'application/form-data',
            //'Content-Type': 'multipart/form-data'
          },
          body: {
            'firstName': _name.text.toString(),
           // 'profile_picture': File(path!),
           // 'profile_picture':  File(image!.path).readAsBytesSync(),
            'phone_number': _number.text.toString()
          }

      );
      // response.request!.headers['Authorization'] ='Bearer $token';
      // response.request!.headers['Content-Type'] ='application/json';
      // response.request!.headers['Content-Type'] ='multipart/form-data';
      // response.request!.send();
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print("Response of Data model : ${jsonResponse}");
        print(response.body.toString());
      } else if (response.statusCode == 400) {
        print(response.body.toString());
      }
      else {
        print(response.body);
        print("error");
      }*/
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String token = sharedPreferences.getString("Token").toString();
      String api_url = 'https://bga-api.3dlif.com/api';
      String url = '${api_url}/profile/update';
      print('token ::::' + token);
   //   print(image!.name.toString());
      http.MultipartRequest request = await http.MultipartRequest('PUT', Uri.parse(url));
      request.headers['Authorization'] = 'Bearer $token';

      if(image?.path != null && path != null){
        request.files.add(http.MultipartFile.fromBytes("profile_picture",File(image!.path).readAsBytesSync(), filename: path));
      }

      request.fields['firstName'] = _name.text.toString();
      request.fields['phone_number'] = _number.text.toString();
      request.fields['age'] = _age.text.toString();
      request.fields['profession'] = _profession.text.toString();

      //request.finalized;
      var respond = await request.send();
      var response = await http.Response.fromStream(respond);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print("200 scode " + data["message"]);
        print("new response :" + response.body.toString());
        print("new response :" + response.body.length.toString());
        //Navigator.pop(context, true);
      //  Navigator.of(context);
       // Navigator.removeRoute(context, MaterialPageRoute(builder: (context)=>firstPage(index: 1)));

         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> firstPage(index: 2,)));


       // Navigator.pop(context);
       // Navigator.of(context).pop();
       // Navigator.popUntil(context, MaterialPageRoute(builder: (context)=>firstPage(index: 1)) as RoutePredicate);
      } else if (response.statusCode == 400) {

        var data = jsonDecode(response.body.toString());
        Fluttertoast.showToast(
            msg: data["message"],
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG);
        print("400 error : " + data["message"]);
        // print("fill required field...");
      } else if (response.statusCode == 401) {

        var data = jsonDecode(response.body.toString());
        print("401 error : " + data["message"]);
        //   print("Token Expired");
      } else {
        print("error");
      }

      /* if(respond.statusCode == 200){
         // var data = jsonDecode(respond.toString());
        //  print(data.toString());

          var data = respond.contentLength.toString();
          print(data);
         print('respond : '+respond.stream.bytesToString().toString() );
        }else if(respond.statusCode == 400){
          print("fill required field");
        }*/
    } catch (e) {
      print("catch error: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     getimage();
    widget.name == null ? _name : _name.text = widget.name.toString();
    widget.phone == null ? _number : _number.text = widget.phone.toString();
    widget.age == null ? _age :_age.text = widget.age.toString();
    widget.profession == null ? _profession : _profession.text = widget.profession.toString();
     print("'${widget.images}'");
  }

//  late String image ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Update"),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Stack(children: [
                Container(
                    // color: Colors.blue[100],
                    child: InkWell(
                  onTap: () async {
                    image = await picker.pickImage(source: ImageSource.gallery);
                    File f = File(image!.path);
                    print(image!.name);
                    final byt = f.readAsBytesSync().lengthInBytes;
                    print("byt :::$byt");
                    final kb = byt / 1024;
                    if(byt < 2048000 ){
                      final mb = kb / 1024;
                      print("ma::: $mb");

                      print(image!.name);


                      SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                      setState(() {
                        sharedPreferences.setString("image", image!.path);
                        path = image!.path;
                        imageName = image!.name;
                        getimage();
                      });

                    }else{
                      Fluttertoast.showToast(
                          msg: " picture must not be greater than 2048 kilobytes.",
                          gravity: ToastGravity.BOTTOM,
                          toastLength: Toast.LENGTH_LONG);
                    }


                    // FilePickerResult? result = await FilePicker.platform.pickFiles();
                    // result.files.single.path!
                    //  print(image!.path);

                    /* FilePicker.platform.pickFiles(
                          allowMultiple: true,
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'pdf', 'doc'],
                        );
                        FilePickerResult? image = () as FilePickerResult? ;*/
                    // print("image usrl :::::$image");
                  },
                  child: CircleAvatar(
                    //backgroundColor: ,
                    // backgroundImage: 
                    radius: 60,
                    //backgroundColor: ,
                  //   backgroundImage: path.toString() != 'null' ? FileImage(File(path!)) : AssetImage("assets/images/download.jpeg"),
                    backgroundImage: image?.path == null  ?  NetworkImage( "${widget.images}") ?? AssetImage("${widget.images}")  : FileImage(File(path!)) ,
                 //   child: path.toString() == 'null' ? Image.asset("assets/images/download.jpeg"):null,
                  ),
                )),
                Positioned(
                    top: 90,
                    left: 90,
                    child: Icon(
                      Icons.edit,
                      size: 35,
                      color: penColor == true ? Colors.black : Colors.red,
                    ))
              ]),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30, top: 30, bottom: 5),
                child:
                    Container(width: double.infinity, child: Text("Full Name")),
              ),
              //name
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: TextFormField(
                  controller: _name,
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autocorrect: true,
                  enableSuggestions: true,
                  autofocus: true,
                  showCursor: true,
                  cursorColor: Colors.greenAccent,
                  decoration: InputDecoration(
                      errorText:
                          _name.text == null ? "Please Enter Full Name" : null,
                      border: OutlineInputBorder(),
                      hintText: "Name"),
                  onChanged: (value) {
                    setState(() {
                      _name.text = value;
                    });
                  },
                  validator: (value) {
                    if (value == null && value!.isEmpty) {
                      return "Please Enter Name";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30, top: 30, bottom: 5),
                child: Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text("Phone Number"),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.call,
                          size: 15,
                        )
                      ],
                    )),
              ),
              //number
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: TextFormField(
                  controller: _number,
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autocorrect: true,
                  enableSuggestions: true,
                  autofocus: true,
                  showCursor: true,
                  cursorColor: Colors.greenAccent,
                  decoration: InputDecoration(
                      errorText: _number.text == null
                          ? "Please Enter Phone Number"
                          : null,
                      border: OutlineInputBorder(),
                      hintText: "Number"),
                  onChanged: (value) {
                    setState(() {
                      _number.text = value;
                    });
                  },
                  validator: (value) {
                    if (value == null && value!.isEmpty) {
                      return "Please Enter Phone Number";
                    } else if (value.length > 10) {
                      return "Phone number should be 10 digit";
                    } else if (value.length < 10) {
                      return "Phone number should be 10 digit";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30, top: 30, bottom: 5),
                child: Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text("Age"),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.cake_outlined,
                          size: 15,
                        )
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: TextFormField(
                  controller: _age,
                  enableSuggestions: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autocorrect: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Age"),

                  onChanged: (value) {
                    setState(() {
                      _age.text = value;
                    });
                  },
                  validator: (value) {
                    if (value == null && value!.isEmpty) {
                      return "Please Enter Age";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30, top: 30, bottom: 5),
                child: Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text("Profession"),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.work_outline,
                          size: 15,
                        )
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: TextFormField(
                  controller: _profession,
                  autocorrect: true,
                  enableSuggestions: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Profession"),
                  onChanged: (value) {
                    setState(() {
                      _profession.text = value;
                    });
                  },
                  validator: (value) {
                    if (value == null && value!.isEmpty) {
                      return "Please Enter Your Profession";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                    onPressed: () {
                      //  print("name :${_name.text.toString()}");
                      // print("path :$path");

                      if (_name.text.isNotEmpty &&
                          _number.text.isNotEmpty &&
                          _number.text.length == 10 ) {
                        setState(() {
                          penColor = true;
                        });
                        print("path $path");
                        print("all ok");
                        upload();
                      } else {
                        setState(() {
                          penColor = false;
                        });
                        print("fill required field");
                      }
                    },
                    child: Text("Upload")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
