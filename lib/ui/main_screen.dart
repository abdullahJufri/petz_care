import 'package:flutter/material.dart';
import 'package:petz_care/widget/card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                                    image: AssetImage('images/boy_person.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hello,',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'Jake jksdjsd',
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
                      onTap: () {},
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
                      child: Card_menu(title: 'History', icon: Icons.history)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}