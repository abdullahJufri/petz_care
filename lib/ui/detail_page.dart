import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:petz_care/firestore/database.dart';
import 'package:petz_care/firestore/query_controller.dart';
import 'package:petz_care/model/user.dart';
import 'package:petz_care/theme.dart';
import 'package:petz_care/widget/flushbar.dart';
import 'package:petz_care/widget/text_fied.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, this.ClinicAll, this.db, this.db1}) : super(key: key);
  Map? ClinicAll;

  Database? db;
  QueryController? db1;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController nameController = new TextEditingController();
  final _date = TextEditingController();
  final _time = TextEditingController();
  final _service = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    print(widget.ClinicAll);
    nameController.text = widget.ClinicAll!['name'];
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
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        throw (url);
      }
    }

    List<String> recipents = ["${widget.ClinicAll!['telp']}"];
    String whatsapp = widget.ClinicAll!['telp'];

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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${widget.ClinicAll!['fullAddress']}',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: IconButton(
                                      onPressed: () {
                                        launchUrl(
                                            '${widget.ClinicAll!['maps']}');
                                      },
                                      icon: const Icon(Icons.room),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Service : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    for (int i = 0;
                                        i < widget.ClinicAll!['service'].length;
                                        i++)
                                      Text(
                                          '${widget.ClinicAll!['service'][i]}'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Price : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    for (int i = 0;
                                        i < widget.ClinicAll!['price'].length;
                                        i++)
                                      Text('${widget.ClinicAll!['price'][i]}'),
                                  ],
                                )
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
                            Center(
                                child: Text(
                              'Booking :',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  height: 50,
                                  width: 100,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.sms,
                                          size: 17,
                                        ),
                                        // SizedBox(width: 5),
                                        Text('by sms'),
                                      ],
                                    ),
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        elevation: 1,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20),
                                          ),
                                        ),
                                        builder: (context) => Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 8, 0, 8),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.1,
                                                  height: 4,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade700,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                ),
                                                child: FieldDateTime(
                                                  ctrlText: _date,
                                                  hint: "Select Date",
                                                  disableBackDate: true,
                                                  borderOutline: false,
                                                  onSaved: (val) {},
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                ),
                                                child: FieldDateTime(
                                                  ctrlText: _time,
                                                  hint: "Select Time",
                                                  timeInput: true,
                                                  borderOutline: false,
                                                  onSaved: (val) {},
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                ),
                                                child: Container(),
                                              ),
                                              const SizedBox(height: 10),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom,
                                                ),
                                                child: FieldInput(
                                                  controller: _service,
                                                  hint:
                                                      "Enter the desired service",
                                                  maxLength: 50,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  if (_date.text.isEmpty) {
                                                    return Alert.error(
                                                      context: context,
                                                      message:
                                                          "Please choose a date",
                                                    );
                                                  }

                                                  if (_time.text.isEmpty) {
                                                    return Alert.error(
                                                      context: context,
                                                      message:
                                                          "Please choose a time",
                                                    );
                                                  }

                                                  if (_service.text.isEmpty) {
                                                    return Alert.error(
                                                      context: context,
                                                      message:
                                                          "Please input service",
                                                    );
                                                  } else {
                                                    _sendSMS(
                                                        "Saya ${loggedInUser.firstName} ${loggedInUser.secondName} akan melakukan booking klinik ${widget.ClinicAll!['name']}, pada \nTanggal: ${_date.text} \nJam: ${_time.text} \nService: ${_service.text}",
                                                        recipents);
                                                  }
                                                  log(_date.text +
                                                      " , " +
                                                      _time.text);
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 40,
                                                    vertical: 25,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                    color: Colors.blueGrey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "Make Appointment",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 27,
                                  ),
                                  height: 50,
                                  width: 100,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/whatsapp.png',
                                          width: 20,
                                          height: 20,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 5),
                                        Text('by wa'),
                                      ],
                                    ),
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        elevation: 1,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20),
                                          ),
                                        ),
                                        builder: (context) => Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 8, 0, 8),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.1,
                                              height: 4,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade700,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 20,
                                              ),
                                              child: FieldDateTime(
                                                ctrlText: _date,
                                                hint: "Select Date",
                                                disableBackDate: true,
                                                borderOutline: false,
                                                onSaved: (val) {},
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 20,
                                              ),
                                              child: FieldDateTime(
                                                ctrlText: _time,
                                                hint: "Select Time",
                                                timeInput: true,
                                                borderOutline: false,
                                                onSaved: (val) {},
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 20,
                                              ),
                                              child: Container(),
                                            ),
                                            const SizedBox(height: 10),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom,
                                              ),
                                              child: FieldInput(
                                                controller: _service,
                                                hint:
                                                    "Enter the desired service",
                                                maxLength: 50,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                if (_date.text.isEmpty) {
                                                  return Alert.error(
                                                    context: context,
                                                    message:
                                                        "Please choose a date",
                                                  );
                                                }

                                                if (_time.text.isEmpty) {
                                                  return Alert.error(
                                                    context: context,
                                                    message:
                                                        "Please choose a time",
                                                  );
                                                }

                                                if (_service.text.isEmpty) {
                                                  return Alert.error(
                                                    context: context,
                                                    message:
                                                        "Please input service",
                                                  );
                                                } else {
                                                  openWhatsapp(
                                                      whatsappUrl:
                                                          "https://api.whatsapp.com/send?phone=" +
                                                              whatsapp +
                                                              "&text=" +
                                                              "Saya%20${loggedInUser.firstName}%20${loggedInUser.secondName}%20akan%20melakukan%20booking%20klinik%20${widget.ClinicAll!['name']}%2C%20pada%20%3A%20%0D%0ATanggal%20%3A%20${_date.text}%0D%0AJam%20%3A%20${_time.text}%0D%0AService%3A%20${_service.text}");
                                                }

                                                log(_date.text +
                                                    " , " +
                                                    _time.text);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 40,
                                                  vertical: 25,
                                                ),
                                                padding:
                                                    const EdgeInsets.all(15),
                                                decoration: BoxDecoration(
                                                  color: Colors.blueGrey,
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Make Appointment wa",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
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
                        Icons.share,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Share.share(
                          "${widget.ClinicAll!['name']} \n address : \n${widget.ClinicAll!['fullAddress']} \n rating : \n${widget.ClinicAll!['rating'].toString()}",
                        );
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

openWhatsapp({required String whatsappUrl}) async {
  if (await canLaunch(whatsappUrl)) {
    await launch(whatsappUrl);
  }
}

void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}
