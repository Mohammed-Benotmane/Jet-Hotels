import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HotelDetail extends StatefulWidget {
  Map hotel;

  HotelDetail({this.hotel});

  @override
  _HotelDetailState createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> with SingleTickerProviderStateMixin {
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
                       widget.hotel["photo"]["images"]["original"]["url"],
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
                            initialRating:double.parse(widget.hotel["rating"]),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            itemCount: double.parse(widget.hotel["rating"]).round(),
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.hotel["name"],
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              widget.hotel["ranking"],
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
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
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
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
                    body: TabBarView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.alarm, color: Colors.pink),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "8 hours",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.language, color: Colors.pink),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Offered in: English",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                "I've put on a simple example, have a look and see if it can help you: First define a Statefull widget and add some definition regarding your tab",
                                style: TextStyle(color: Colors.grey.shade600),
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        widget.hotel["price"],
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "per person",
                                        style: TextStyle(color: Colors.grey.shade600),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.pink,),

                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 13),
                                          child: Text(
                                            "Book now",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text("text"),
                        Text("text"),
                      ],
                      controller: tabController,
                    ),
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
