import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resprofile/screens/data_classes.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    _controller = new TabController(length: restaurant.category.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ],
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Text(
          restaurant.name,
          style: TextStyle(color: Colors.blueAccent),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 200,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  height: 160,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: NetworkImage(restaurant.resImageWide),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 10),
                    image: DecorationImage(
                      image: NetworkImage(restaurant.resImageWide),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            restaurant.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            restaurant.description,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              starRating(4),
              Text(
                "(${restaurant.numberOfReviews} reviews)",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Street number,block number,area name",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Within ${restaurant.distanceInMinute} mins",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "(${restaurant.deliveryTpe})",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            height: 2.0,
            color: Colors.grey,
          ),
          TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.orange,
            controller: _controller,
            isScrollable: true,
            tabs: restaurant.category.map((Category category) {
              return Tab(
                text: category.categoryName,
              );
            }).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: restaurant.category.map((Category category) {
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: category.dishList.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: (Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          category.dishList[i]?.dishName ?? "Food Name",
                                          style: TextStyle(color: Colors.blueAccent, fontSize: 18, fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          category.dishList[i]?.dishDescription ?? "Food Name",
                                          style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              category.dishList[i]?.amount,
                                              style: TextStyle(color: Colors.orange, fontSize: 15, height: 2, fontWeight: FontWeight.w500),
                                            ),
                                            Container(
                                              child: Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Text(
                                                  "Add to cart",
                                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                              decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.all(Radius.circular(5))),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 60.0,
                                    height: 70.0,
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.transparent,
                                      image: DecorationImage(
                                        image: NetworkImage(category.dishList[i].dishImage),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                                  )
                                ],
                              ),
                            ],
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Divider(
                            height: 2,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget starRating(int number) {
    return (Row(
      children: <Widget>[
        Icon(
          (number >= 1) ? Icons.star : Icons.star_border,
          color: Colors.yellow,
        ),
        Icon(
          (number >= 2) ? Icons.star : Icons.star_border,
          color: Colors.yellow,
        ),
        Icon(
          (number >= 3) ? Icons.star : Icons.star_border,
          color: Colors.yellow,
        ),
        Icon(
          (number >= 4) ? Icons.star : Icons.star_border,
          color: Colors.yellow,
        ),
        Icon(
          (number >= 5) ? Icons.star : Icons.star_border,
          color: Colors.yellow,
        ),
      ],
    ));
  }
}
