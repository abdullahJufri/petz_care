import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  static const String id = 'My_profile';
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  var nameController = TextEditingController();
  var addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: 'Name'
                ),
                controller: nameController,
              ),
              TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.home),
                    labelText: 'Addres'
                ),
                controller: addressController,
              ),
              ElevatedButton(
                  onPressed: () {
                    // userRef.doc(FirebaseAuth.instance.currentUser.email)
                    //     .set
                  },
                  child: Text('Save'))

            ],
          ),
        ),
      ),
    );
  }
}
