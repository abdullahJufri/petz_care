import 'package:flutter/material.dart';
import 'package:petz_care/firestore/database.dart';
import 'package:petz_care/firestore/query_controller.dart';
import 'package:petz_care/theme.dart';

class DetailPage extends StatefulWidget {
  // final String clinic;
  DetailPage({Key? key, this.ClinicAll, this.db, this.db1}) : super(key: key);
  Map? ClinicAll;

  Database? db;
  QueryController? db1;

  // final Clinic clinic;
  // const DetailPage({Key? key, required this.clinic,}) : super(key: key);
  // static const String id = 'detail_page';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController nameController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.ClinicAll);
    nameController.text = widget.ClinicAll!['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.ClinicAll!['pictureId'],
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // TextFormField(
                            //   style: TextStyle(color: Colors.black),
                            //   controller: nameController,
                            // ),
                            Center(
                              child: Text(
                                '${widget.ClinicAll!['name']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.room,
                                  color: Colors.red,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Text(
                                  '${widget.ClinicAll!['city'].toString()}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.grey,
                                      size: 18,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                        '${widget.ClinicAll!['rating'].toString()}'),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Location : ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${widget.ClinicAll!['fullAddress']}',
                              textAlign: TextAlign.justify,
                              style: TextStyle(),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Service : ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Price : ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('${widget.ClinicAll!['service']}'),
                                SizedBox(width: 10),
                                Text(
                                    '${widget.ClinicAll!['price'].toString()}'),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Opening Hours : ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.ClinicAll!['workingHours']}'),
                            SizedBox(height: 20),
                            Text(
                              'Number Phone : ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('${widget.ClinicAll!['telp']}'),
                            SizedBox(height: 20),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 27,
                              ),
                              height: 50,
                              width:
                                  MediaQuery.of(context).size.width - (2 * 5),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text('Book Now')),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
