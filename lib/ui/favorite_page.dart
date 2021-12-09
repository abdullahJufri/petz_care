import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Favorite Page'),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
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
