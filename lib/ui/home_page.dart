import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petz_care/model/city.dart';
import 'package:petz_care/model/user.dart';
import 'package:petz_care/theme.dart';
import 'package:petz_care/ui/search/search_page.dart';
import 'package:petz_care/widget/city_card.dart';
import 'package:petz_care/widget/space_card.dart';

var nametes;

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            // NOTE: TITLE/HEADER
            Padding(
              padding: EdgeInsets.only(left: edge, right: edge),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore Now',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.blueGrey,
                    child: IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        showSearch(context: context, delegate: ClinicSearch());
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Hello ${loggedInUser.firstName} ${loggedInUser.secondName}',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: POPULAR CITIES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Cities',
                style: regularTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 125,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: CityCard(
                      City(
                        id: 1,
                        name: 'Jakarta',
                        imageUrl: 'assets/images/city1.jpg',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/images/city2.jpg',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'assets/images/city3.jpg',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 4,
                      name: 'Palembang',
                      imageUrl: 'assets/images/city4.jpg',
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            // NOTE: RECOMMENDED SPACE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recommended Clinic',
                style: regularTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              // height: 300,
              height: MediaQuery.of(context).size.height / 2,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: edge,
                  ),
                  child: SpaceCard()),
            ),
          ],
        ),
      ),
    );
  }
}
