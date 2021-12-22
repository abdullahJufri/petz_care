import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:petz_care/theme.dart';
import 'package:petz_care/ui/search/detail_Search.dart';

class ClinicSearch extends SearchDelegate {
  CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection('ClinicAll');

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firebaseFirestore.snapshots().asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data!.docs
                .where((QueryDocumentSnapshot<Object?> element) =>
                    element['name']
                        .toString()
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                .isEmpty) {
              return Center(
                child: Lottie.asset('assets/not-found.json'),
              );
            }
            print(snapshot.data);
            return ListView(children: [
              ...snapshot.data!.docs
                  .where((QueryDocumentSnapshot<Object?> element) =>
                      element['name']
                          .toString()
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                  .map((QueryDocumentSnapshot<Object?> data) {
                final String name = data.get('name');
                final String pictureId = data.get('pictureId');
                final String city = data.get('city');
                final double rating = data.get('rating');
                final String address = data.get('address');

                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailSearch(data: data)));
                  },
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
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
                                    pictureId,
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
                                            '${rating.toString()}',
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
                                    '${name}',
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
                                    '${address}',
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
                                      '${city}',
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
                  ),
                );
              })
            ]);
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Center(child: Lottie.asset('assets/search.json'));
  }
}
