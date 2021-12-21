import 'package:flutter/material.dart';
import 'package:petz_care/firestore/query_controller.dart';
import 'package:petz_care/model/city.dart';
import 'package:petz_care/theme.dart';
import 'package:petz_care/ui/detail_page.dart';
import 'package:petz_care/widget/city_card.dart';

class SelectedCity extends StatefulWidget {
  static const String id = 'cityy_page';
  // final CityCard cityCard;
  final City city;
  // SelectedCity({required this.city,});

  const SelectedCity({Key? key, required this.city}) : super(key: key);
  @override
  _SelectedCityState createState() => _SelectedCityState(city: city);
}

class _SelectedCityState extends State<SelectedCity> {
  final City city;
  _SelectedCityState({
    required this.city,
  });
  QueryController? db1;
  List docs = [];
  bool _isLoading = false;

  initdb() {
    print('ola');

    db1 = QueryController(city: city);
    db1!.init();
    db1!.filterCLinic().then((value) => {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Petz Care'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _isLoading
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
                            db1: db1,
                          ))).then((value) => {
                    if (value != null) {_fetchProducts()}
                  });
                  // Navigator.of(context)
                  //     .pushNamed(DetailPage.id, arguments: docs[index].id);
                  // print(docs[index].id);
                  // Navigator.pushNamed(context, DetailPage.id, arguments: clinic[index].id);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => DetailPage(value: value),
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
                            // Text.rich(
                            //   TextSpan(
                            //     text: '${docs[index]['address']}',
                            //
                            //     style: greyTextStyle.copyWith(
                            //       fontSize: 14,
                            //     ),
                            //   ),
                            // ),
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
          ),
        ),
      ),
    );
  }
}
