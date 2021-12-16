import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 300),
          Center(
              child: Text(
            'Favorite Empty',
            style: TextStyle(fontSize: 18),
          ))
        ],
      ),
    );
  }
}
