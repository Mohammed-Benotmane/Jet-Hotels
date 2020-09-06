import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:jethotels/screens/hotel_detail.dart';

class Hotels_List extends StatefulWidget {
  @override
  _Hotels_ListState createState() => _Hotels_ListState();
}

class _Hotels_ListState extends State<Hotels_List> {
  List hotelsList = [];
  List popularList = [];
  List recommendList = [];

  Future<void> getHotels() async {
    Response response = await get(
        "https://tripadvisor1.p.rapidapi.com/hotels/list?location_id=293919&adults=1&checkin=2020-10-15&rooms=1&nights=2",
        headers: {
          "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
          "x-rapidapi-key": "ac4e5d787emsh6696682a7764cfep1000b9jsna60f5676c20f",
        });
    Map hotels = jsonDecode(response.body);
    hotelsList = hotels["data"];
    popularList = hotelsList.sublist(0, 10);
    recommendList = hotelsList.sublist(10, 20);

  }

  hotelApiCall() async {
    await getHotels();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    hotelApiCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: headerWidget(),
                ),
                Positioned(
                  bottom: 0,
                  right: 40,
                  left: 40,
                  child: Container(
                    child: Material(
                      borderRadius: BorderRadius.circular(25),
                      elevation: 7,
                      child: TextField(
                        onChanged: (text) {},
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search",
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * .8,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Popular", style: TextStyle(fontWeight: FontWeight.w900)),
                  Text("See all", style: TextStyle(color: Colors.pink, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 4.25,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 15),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: popularList.length,
                  itemBuilder: (context, index) {
                    return listViewItemPopular(index);
                  },
                ),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Categories", style: TextStyle(fontWeight: FontWeight.w900)),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 12,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 15),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return listViewItemCategories(index);
                  },
                ),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Recommend", style: TextStyle(fontWeight: FontWeight.w900)),
                  Text("See all", style: TextStyle(color: Colors.pink, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 6,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 15),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return listViewItemRecommend(index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  headerWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://thumbnails.trvl-media.com/T13T6Xjd9VcTdlOIevad6mqpj7I=/773x530/smart/filters:quality(60)/images.trvl-media.com/hotels/33000000/32670000/32661200/32661112/f0212e0c_z.jpg"),
              fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Your Location",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.white,
                size: 18,
              ),
              SizedBox(width: 5),
              Text(
                "Oran, Algeria",
                style: TextStyle(
                    letterSpacing: 2.0, fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  listViewItemPopular(int index) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return HotelDetail(hotel: popularList[index],);
        }));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.25,
        height: MediaQuery.of(context).size.height / 4.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(popularList[index]["photo"]["images"]["medium"]["url"].toString()),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    popularList[index]["price"].toString(),
                    style: TextStyle(
                        letterSpacing: 2.0, fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.6,
                    child: Text(
                      popularList[index]["name"].toString(),
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
  List<Color> colors = [Color(0xFF7FBC6E),Color(0xFFC1E7E8),Color(0xFFFD4867),Color(0xFF8E8CD8)];
  List<String> categories = ["Country Side","Beach","Romantic","Downtown"];
  List<Icon> icons = [Icon(Icons.home,color: Colors.white),Icon(Icons.beach_access,color: Colors.white),Icon(Icons.favorite,color: Colors.white),Icon(Icons.train,color: Colors.white)];

  listViewItemCategories(int index) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.25,
      height: MediaQuery.of(context).size.height / 12,
      decoration: BoxDecoration(
        color: colors[index],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icons[index],
          SizedBox(width: 7),
          Text(
            categories[index],
            style: TextStyle(letterSpacing: 1.5, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  listViewItemRecommend(int index) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return HotelDetail(hotel: recommendList[index],);
        }));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.65,
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(recommendList[index]["photo"]["images"]["medium"]["url"].toString()),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    recommendList[index]["price"],
                    style: TextStyle(
                        letterSpacing: 2.0, fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Text(
                      recommendList[index]["name"].toString(),
                      style: TextStyle(fontSize: 11,color: Colors.white, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
