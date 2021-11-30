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
      backgroundColor: Colors.blue,
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
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.segment_sharp,
                      color: Colors.white,
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
                  image: DecorationImage(
                    image: AssetImage('images/boy_person.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  border: Border.all(
                    color: Colors.white,
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
                    'Joy wkdwddwfk',
                  ),
                  Text(
                    'email',
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Divider(
                    color: Colors.white,
                    thickness: 4,
                    indent: 5,
                    endIndent: 5,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Column(
                  children: [
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
                          color: Colors.white,
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
                    SizedBox(
                      height: 8,
                    ),
                    ProfileWidget(
                      text: 'Log Out',
                      icon: Icons.logout_outlined,
                    ),
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
        Icon(icon, color: Colors.white),
        Text(text),
        Icon(Icons.keyboard_arrow_right, color: Colors.white),
      ],
    );
  }
}
