import 'package:flutter/material.dart';
import 'package:payment_app/clipper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // is not restarted.

          primarySwatch: Colors.purple),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<BottomNavigationItem> bottomNavigationItem = [
    BottomNavigationItem(
        color: Colors.white,
        icons: Icons.home,
        text: Text("Home"),
        selectedItem: true),
    BottomNavigationItem(
        color: Colors.black26,
        icons: Icons.search,
        text: Text("Search"),
        selectedItem: false),
    BottomNavigationItem(
        color: Colors.black26,
        icons: Icons.favorite,
        text: Text("Favorite"),
        selectedItem: false),
    BottomNavigationItem(
        color: Colors.black26,
        icons: Icons.supervised_user_circle,
        text: Text("Profile"),
        selectedItem: false)
  ];
  var selectedItem = 0;

  Widget _bannerBuilder(BuildContext context) {
    return Container(
      color: Color(0xFF2931a5),
      height: MediaQuery.of(context).size.height / 2.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Hey James",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "What would you like to do Today ? ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: 70.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Color(0xFF3845c9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                        size: 14.0,
                      ),
                      Text(
                        "Send",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.graphic_eq,
                      color: Color(0xFF3845c9),
                      size: 30.0,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                        size: 14.0,
                      ),
                      Text(
                        "Recevie",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomList(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: bottomNavigationItem.map((item) {
        return GestureDetector(
          onTap: () {
            var selectedindex = bottomNavigationItem.indexOf(item);
            bottomNavigationItem.map((item) {
              setState(() {
                if (bottomNavigationItem.indexOf(item) == selectedindex) {
                  item.selectedItem = true;
                  item.color = Colors.white;
                } else {
                  if (item.selectedItem == true) {
                    item.selectedItem = false;
                    item.color = Colors.black26;
                  }
                }
              });
            }).toList();
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: item.selectedItem ? 120.0 :50,
              alignment: Alignment.center,
              decoration: item.selectedItem
                  ? BoxDecoration(
                      color: Color(0xFF2931a5),
                      borderRadius: BorderRadius.circular(55.0))
                  : null,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Center(
                        child: Icon(
                      item.icons,
                      color: item.selectedItem ? item.color : Colors.black54,
                    )),
                    item.selectedItem
                        ? Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Center(
                                child: DefaultTextStyle(
                              child: item.text,
                              style: TextStyle(color: item.color),
                              textAlign: TextAlign.center,
                            )))
                        : Container()
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _optionBuilder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 70.0,
                width: 60.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFdadbe5),
                        offset: Offset(0.0, 9.0),
                        blurRadius: 19.0,
                        spreadRadius: 3.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(13.0)),
                child: Icon(
                  Icons.bookmark_border,
                  color: Colors.deepOrange,
                  size: 30.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("Bills"),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                height: 70.0,
                width: 60.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFdadbe5),
                        offset: Offset(0.0, 9.0),
                        blurRadius: 19.0,
                        spreadRadius: 3.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(13.0)),
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.deepOrange,
                  size: 30.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("Donation"),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                height: 70.0,
                width: 60.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFdadbe5),
                        offset: Offset(0.0, 9.0),
                        blurRadius: 19.0,
                        spreadRadius: 3.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(13.0)),
                child: Icon(
                  Icons.people_outline,
                  color: Colors.deepOrange,
                  size: 30.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("Recepients"),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                height: 70.0,
                width: 60.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFdadbe5),
                        offset: Offset(0.0, 9.0),
                        blurRadius: 19.0,
                        spreadRadius: 3.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(13.0)),
                child: Icon(
                  Icons.label_outline,
                  color: Colors.deepOrange,
                  size: 30.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Offers",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _transactionListBuilder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("RECENT TRANSACTIONS"),
            Padding(
              padding: const EdgeInsets.only(top:14.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.black26),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text("Alexender Young",style: TextStyle(fontSize: 18.0),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,top: 8.0),
                        child: Text("Food Store | 23 October 2019",style: TextStyle(fontSize: 12.0,color: Colors.black54),),
                      )
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text("\$500.00",style: TextStyle(fontWeight: FontWeight.w800),),
                       Text("Sent",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 11.0,color: Colors.red),),
                    ],
                  )
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top:14.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.black26),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text("Alexender Young",style: TextStyle(fontSize: 18.0),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,top: 8.0),
                        child: Text("Food Store | 23 October 2019",style: TextStyle(fontSize: 12.0,color: Colors.black54),),
                      )
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text("\$500.00",style: TextStyle(fontWeight: FontWeight.w800),),
                       Text("Recevie",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 11.0,color: Colors.green),),
                    ],
                  )
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top:14.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.black26),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text("Alexender Young",style: TextStyle(fontSize: 18.0),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,top: 8.0),
                        child: Text("Food Store | 23 October 2019",style: TextStyle(fontSize: 12.0,color: Colors.black54),),
                      )
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text("\$500.00",style: TextStyle(fontWeight: FontWeight.w800),),
                       Text("Sent",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 11.0,color: Colors.green),),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _bannerBuilder(context),
          _optionBuilder(context),
          _transactionListBuilder(context)
        ],
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                blurRadius: 10, color: Colors.black26, offset: Offset(0.0, 1.0))
          ]),
          height: MediaQuery.of(context).size.height / 10,
          child: _buildBottomList(context)),
    );
  }
}

class BottomNavigationItem {
  IconData icons;
  Text text;
  Color color;
  bool selectedItem;
  BottomNavigationItem({this.color, this.icons, this.text, this.selectedItem});
}
