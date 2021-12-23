import 'package:flutter/material.dart';
import 'package:petz_care/firestore/database.dart';
import 'package:petz_care/ui/detail_page.dart';

import '../theme.dart';

class SpaceCard extends StatefulWidget {
  @override
  State<SpaceCard> createState() => _SpaceCardState();
}

class _SpaceCardState extends State<SpaceCard> {
  Database? db;
  List docs = [];
  bool _isLoading = false;

  initdb() {
    print('ola');
    db = Database();
    db!.init();
    db!.readClinic().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  _fetchProducts() async {
    setState(() {
      _isLoading = true;
    });
    await initdb();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
          itemCount: docs.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                              ClinicAll: docs[index],
                              db: db,
                            ))).then((value) => {
                      if (value != null) {_fetchProducts()}
                    });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        width: 110,
                        height: 105,
                        child: Stack(
                          children: [
                            Image.network(
                              docs[index]['pictureId'],
                              width: 130,
                              height: 110,
                              fit: BoxFit.cover,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 70,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: purpleColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(36),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/icon_star.png',
                                      width: 22,
                                      height: 22,
                                    ),
                                    Text(
                                      '${docs[index]['rating']}',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              '${docs[index]['name']}',
                              overflow: TextOverflow.ellipsis,
                              style: blackTextStyle.copyWith(
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              '${docs[index]['address']}',
                              overflow: TextOverflow.ellipsis,
                              style: greyTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.room,
                                color: Colors.red,
                                size: 18,
                              ),
                              Text(
                                '${docs[index]['city']}',
                                style: greyTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
  }
}
