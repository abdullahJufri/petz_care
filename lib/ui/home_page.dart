import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petz_care/model/clinic.dart';
import 'package:petz_care/theme.dart';
import 'package:petz_care/ui/model_test.dart';
import 'package:petz_care/widget/space_card.dart';

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
    // var spaceProvider = Provider.of<SpaceProvider>(context);

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
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
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
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 125,
              // child: ListView(
              //   scrollDirection: Axis.horizontal,
              //   children: [
              //     SizedBox(
              //       width: 24,
              //     ),
              //     CityCard(
              //       City(
              //         id: 1,
              //         name: 'Jakarta',
              //         imageUrl: 'assets/city1.png',
              //       ),
              //     ),
              //     SizedBox(
              //       width: 20,
              //     ),
              //     CityCard(
              //       City(
              //         id: 2,
              //         name: 'Bandung',
              //         imageUrl: 'assets/city2.png',
              //         isPopular: true,
              //       ),
              //     ),
              //     SizedBox(
              //       width: 20,
              //     ),
              //     CityCard(
              //       City(
              //         id: 3,
              //         name: 'Surabaya',
              //         imageUrl: 'assets/city3.png',
              //       ),
              //     ),
              //     SizedBox(
              //       width: 20,
              //     ),
              //     CityCard(
              //       City(
              //         id: 4,
              //         name: 'Palembang',
              //         imageUrl: 'assets/city4.png',
              //       ),
              //     ),
              //     SizedBox(
              //       width: 20,
              //     ),
              //     CityCard(
              //       City(
              //         id: 5,
              //         name: 'Aceh',
              //         imageUrl: 'assets/city5.png',
              //         isPopular: true,
              //       ),
              //     ),
              //     SizedBox(
              //       width: 20,
              //     ),
              //     CityCard(
              //       City(
              //         id: 6,
              //         name: 'Bogor',
              //         imageUrl: 'assets/city6.png',
              //       ),
              //     ),
              //     SizedBox(
              //       width: 24,
              //     ),
              //   ],
              // ),
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
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              // height: 300,
              height: MediaQuery.of(context).size.height / 3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: edge,
                ),
                child: FutureBuilder<String>(
                    future: DefaultAssetBundle.of(context)
                        .loadString('assets/clinic.json'),
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        final List<Clinic> clinics =
                            clinicsFromJson(snapshot.data!).clinics;
                        return ListView.builder(
                          itemCount: clinics.length,
                          itemBuilder: (context, index) {
                            return SpaceCard(clinics[index]);
                          },
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
            ),

            SizedBox(
              height: 15,
            ),
            // NOTE: TIPS & GUIDANCE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              // child: Column(
              //   children: [
              //     TipsCard(
              //       Tips(
              //         id: 1,
              //         title: 'City Guidelines',
              //         imageUrl: 'assets/tips1.png',
              //         updatedAt: '20 Apr',
              //       ),
              //     ),
              //     SizedBox(
              //       height: 20,
              //     ),
              //     TipsCard(
              //       Tips(
              //         id: 2,
              //         title: 'Jakarta Fairship',
              //         imageUrl: 'assets/tips2.png',
              //         updatedAt: '11 Dec',
              //       ),
              //     ),
              //   ],
              // ),
            ),
            SizedBox(
              height: 100 + edge,
            ),
          ],
        ),
      ),
      // floatingActionButton: Container(
      //   height: 65,
      //   width: MediaQuery.of(context).size.width - (2 * edge),
      //   margin: EdgeInsets.symmetric(
      //     horizontal: edge,
      //   ),
      //   decoration: BoxDecoration(
      //     color: Color(0xffF6F7F8),
      //     borderRadius: BorderRadius.circular(23),
      //   ),
      //   // child: Row(
      //   //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   //   children: [
      //   //     BottomNavbarItem(
      //   //       imageUrl: 'assets/icon_home.png',
      //   //       isActive: true,
      //   //     ),
      //   //     BottomNavbarItem(
      //   //       imageUrl: 'assets/icon_email.png',
      //   //       isActive: false,
      //   //     ),
      //   //     BottomNavbarItem(
      //   //       imageUrl: 'assets/icon_card.png',
      //   //       isActive: false,
      //   //     ),
      //   //     BottomNavbarItem(
      //   //       imageUrl: 'assets/icon_love.png',
      //   //       isActive: false,
      //   //     ),
      //   //   ],
      //   // ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
