import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petz_care/model/user.dart';
import 'package:petz_care/ui/login_page.dart';

class MyProfile extends StatefulWidget {
  static const String id = 'My_profile';
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var nameController = TextEditingController();
  var addressController = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("user")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Icon(
                      Icons.segment_sharp,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/boy_person.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  border: Border.all(
                    color: Colors.black,
                    width: 4.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 4,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Text(
                    '${loggedInUser.firstName} ${loggedInUser.secondName}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text('${loggedInUser.email}', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        child: Divider(
                          color: Colors.black,
                          thickness: 4,
                          indent: 5,
                          endIndent: 5,
                        ),
                      ),
                    ),
                    ProfileWidget(
                      text: 'Edit Profile',
                      icon: Icons.settings,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ProfileWidget(
                      text: 'Help',
                      icon: Icons.help,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ProfileWidget(
                      text: 'Privacy & Policy',
                      icon: Icons.privacy_tip,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ProfileWidget(
                      text: 'Term of Service',
                      icon: Icons.report,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        child: Divider(
                          color: Colors.black,
                          thickness: 4,
                          indent: 5,
                          endIndent: 5,
                        ),
                      ),
                    ),
                    ProfileWidget(
                      text: 'Rate App',
                      icon: Icons.star,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          await _auth.signOut();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) {
                                return LoginPage();
                              },
                            ),
                          );
                        },
                        child: Text('Log Out'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileActivity extends StatelessWidget {
  const ProfileActivity({
    Key? key,
    required this.number,
    required this.text,
  }) : super(key: key);

  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
        ),
        Text(
          text,
        ),
      ],
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key, required this.icon, required this.text})
      : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon, color: Colors.black),
        Text(text),
        Icon(Icons.keyboard_arrow_right, color: Colors.black),
      ],
    );
  }
}
