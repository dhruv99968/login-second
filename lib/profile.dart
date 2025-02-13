import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_second/modelClass/profileModel.dart';
import 'package:login_second/profileUpdate.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

//  late String Name,Age,Profession,Phone,Email ;
  String? Image,Name,Age,Profession,Phone,Email;
  Future<ProfileModel> getProfile()async{

    try{
      String api ="https://bga-api.3dlif.com/";
      String url = "${api}api/profile";
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String token = sharedPreferences.getString("Token").toString();

      final response = await http.get(Uri.parse(url),
      headers: {
        'Authorization':'Bearer $token',
        'Content-Type': 'application/json',
      }
      );
      if(response.statusCode ==200){
        print("status code 200");
        var data = jsonDecode(response.body) ;
        print(response.body);

        return ProfileModel.fromJson(data);
      }
      else{
        return ProfileModel();
      }
    }catch(e){

      print(e);
     return ProfileModel();

    }}
  Future<void> getdata()async {

    ProfileModel model = await getProfile() ;
    setState(() {
      Name = model.data?.firstName ;
      Age = model.data?.age ;
      Email = model.data?.email;
      Phone = model.data?.phoneNumber ;
      Image = model.data?.profilePicture  ;
      Profession = model.data?.profession ;
    });
    print("getdata.....");
    print(model.error);
    print(model.message);
    print(model.data?.email);
    print(model.data?.firstName);
      }


  Future<void> getdta()async {
    await getProfile();
    await getdata();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
    getdata();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getdta();
    });
    print("heelo back");

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(title: Text("Profile"),) ,
      body: Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: Image == null ? AssetImage("assets/images/download.jpeg") : NetworkImage(Image.toString()),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: ElevatedButton(onPressed: (){
                      setState(() {

                      });
                      String im = Image!= null ? Image.toString() : "assets/images/download.jpeg";
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>profileUpdate(images: im,name:  Name,phone :Phone,age:Age,profession:Profession )));
                    }, child: Text("Update Profile")),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Name == null ? "Full Name : null": Name.toString().toUpperCase() ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text(Email == null ?"Email : null": Email.toString().toUpperCase(),style: TextStyle(fontSize: 15),),
                    SizedBox(height: 5,),
                    Text(Phone == null ?"Phone Number : null": "+91 "+Phone.toString(),style: TextStyle(fontSize: 15),),
                    SizedBox(height: 5,),
                    Text(Age == null ? "Age : null" : "Age $Age",style: TextStyle(fontSize: 15),),
                    SizedBox(height: 5,),
                    Text(Profession == null ? "Profession : null" : Profession.toString(),style: TextStyle(fontSize: 15),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
