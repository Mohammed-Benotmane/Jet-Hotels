import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HotelDetail extends StatefulWidget {
  List hotel;

  HotelDetail({this.hotel});

  @override
  _HotelDetailState createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> with SingleTickerProviderStateMixin{
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 250),
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://thumbnails.trvl-media.com/T13T6Xjd9VcTdlOIevad6mqpj7I=/773x530/smart/filters:quality(60)/images.trvl-media.com/hotels/33000000/32670000/32661200/32661112/f0212e0c_z.jpg",
                      ),
                      fit: BoxFit.fitHeight),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(
                              Icons.keyboard_arrow_left,
                              color: Colors.white,
                              size: 30,
                            ),
                            Icon(
                              Icons.bookmark_border,
                              color: Colors.white,
                              size: 26,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          RatingBar(
                            itemSize: 24,
                            itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                            onRatingUpdate: null,
                            initialRating: 4,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            itemCount: 4,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Cité 870 kfdjlfkhdl fdlsmk",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              "Cité 870 kfdjlfkhdl fdlsmk Cité 870 kfddl fdlsmk Cité 870 kfdjlfkhdl fdlsmk",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                  child: Scaffold(
                    appBar: TabBar(
                      labelColor: Colors.black,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
                        indicatorColor: Colors.white,
                        unselectedLabelColor: Colors.grey.shade500,
                        controller: tabController,
                        tabs: <Widget>[
                      Tab(text: "OverView"),
                      Tab(text: "Photo"),
                      Tab(text: "Reviews"),
                    ]),
                    body: TabBarView(children: <Widget>[
                      Column(children: <Widget>[

                      ],),
                      Text("text"),
                      Text("text"),
                    ],controller: tabController,),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}


/*

 */