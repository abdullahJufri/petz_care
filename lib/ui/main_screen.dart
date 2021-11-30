import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petz_care/tes_provider.dart';
import 'package:petz_care/ui/model_test.dart';
import 'package:petz_care/ui/profile_page.dart';
import 'package:petz_care/widget/card.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'Main_Screen';
  // final TextEditingController emailPegawaiCont = new TextEditingController();
  // String? emailPegawai,
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _messageTextController = TextEditingController();

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

  // late User _activeUser;
  // final EmailPegawaiField = TextFormField(
  //   autofocus: false,
  //   controller: emailPegawaiCont,
  //   keyboardType: TextInputType.name,
  //   validator: (value) {
  //     if (value!.isEmpty) {
  //       return ("Please Enter Your Email");
  //     }
  //
  //     //req expression for email  validation
  //     if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
  //       return ("Please Enter a valid email");
  //     }
  //     return null;
  //   },
  //   onChanged: (String email) {
  //     getEmployeeEmail(email);
  //   },
  //   textInputAction: TextInputAction.next,
  //   decoration: InputDecoration(
  //     contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
  //     hintText: " Email Pegawai",
  //     border: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //   ),
  // );

  //
  // @override
  // void initState() {
  //   getCurrentUser();
  //   super.initState();
  //
  // }


  // void getCurrentUser() async {
  //   try {
  //     var currentUser = await _auth.currentUser;
  //
  //     if (currentUser != null) {
  //       _activeUser = currentUser;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    // final tes = _activeUser.email.toString();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 66,
                decoration: BoxDecoration(color: Color(0xff00ADEF)),
                padding: const EdgeInsets.only(left: 2, right: 2, top: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 48.0,
                                  width: 48.0,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'images/boy_person.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 14),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        'Hello,',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      // StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                                      //   //   stream: _firestore
                                      //   // future: TestProvider.getTestSpaces(),
                                      //   builder: (context, tes) {
                                      //     if(tes.hasData){
                                      //       return  Text(
                                      //         tes,
                                      //         style: TextStyle(
                                      //           color: Colors.white,
                                      //           fontSize: 18,
                                      //         ),
                                      //       );
                                      //     } else {
                                      //       return CircularProgressIndicator();
                                      //     }
                                      //
                                      //   },
                                      //
                                      // )
                                      Text(
                                        '${loggedInUser.email}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 152,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/bg_petcare.jpg'),
                      fit: BoxFit.fitWidth),
                ),
              ),
              Container(
                height: 450,
                width: 500,
                padding: EdgeInsets.all(8),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  padding: EdgeInsets.all(15),
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, MyProfile.id);
                        },
                        child:
                        Card_menu(title: 'My Profile', icon: Icons.person)),
                    InkWell(
                        onTap: () {},
                        child: Card_menu(
                            title: 'Booking', icon: Icons.calendar_today)),
                    InkWell(
                        onTap: () {},
                        child:
                        Card_menu(title: 'Cart', icon: Icons.shopping_cart)),
                    InkWell(
                        onTap: () {},
                        child: Card_menu(
                            title: 'History', icon: Icons.history)),
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
