import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.5,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  "https://image.resabooking.com/images/image_panoramique/Steigenberger_Marhaba_Thalasso_2.jpg"),
                  fit: BoxFit.fill
            )),
          ),
        ],
      ),
    );
  }
}
