import 'package:flutter/material.dart';
import 'package:petz_care/model/clinic.dart';

import '../theme.dart';

class SpaceCard extends StatelessWidget {
  final Clinic clinic;

  SpaceCard(this.clinic);

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailPage(clinic),
        //   ),
        // );
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
                      clinic.pictureId,
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
                              '${clinic.rating}/5.0',
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
                  clinic.name,
                  style: blackTextStyle.copyWith(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text.rich(
                  TextSpan(
                    text: '${clinic.address}',
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
                      '${clinic.city}',
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
  }
}
