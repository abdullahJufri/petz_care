import 'package:flutter/material.dart';
import 'package:petz_care/firestore/clinic_all_ref.dart';
import 'package:petz_care/model/clinic.dart';
import 'package:petz_care/model/clinic_model.dart';
import 'package:petz_care/ui/detail_page.dart';

import '../theme.dart';

class SpaceCard extends StatefulWidget {
  // final Clinic clinic;
  //
  // const SpaceCard({Key? key, required this.clinic}) : super(key: key);




  @override
  State<SpaceCard> createState() => _SpaceCardState();
}

class _SpaceCardState extends State<SpaceCard> {
  String value = '';

  @override
  Widget build(
    BuildContext context,
  ) {
    return FutureBuilder(
        future: getClinics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var clinic = snapshot.data as List<ClinicModel>;
            if (clinic == null || clinic.length == 0)
              return Center(
                child: Text('Cannot load Clinic'),
              );
            else {
              return ListView.builder(
                itemCount: clinic.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, DetailPage.id, arguments: clinic[index].name);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(value: value),
                        ),
                      );
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
                                    clinic[index].pictureId,
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
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/icon_star.png',
                                            width: 22,
                                            height: 22,
                                          ),
                                          Text(
                                            '${clinic[index].rating}/5.0',
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                value = clinic[index].name,
                                style: blackTextStyle.copyWith(
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: '${clinic[index].address}',
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
                                    '${clinic[index].city}',
                                    style: greyTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
        });
  }
}
