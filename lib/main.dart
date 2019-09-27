import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<String> welcomeImages = [
    "assets/welcome0.jpg",
    "assets/welcome1.jpg",
    "assets/welcome3.jpg",
    "assets/welcome2.jpg",
    "assets/welcome4.jpg",
    "assets/welcome1.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    CardController controller;
    return Scaffold(
        backgroundColor: Color(0xFFf0f0f0),
        body: Column(
          children: <Widget>[
            new GradientAppBar("Chuzi App"),
            Container(
                height: MediaQuery.of(context).size.height * 0.67,
                child: TinderSwapCard(
                    orientation: AmassOrientation.BOTTOM,
                    totalNum: welcomeImages.length,
                    stackNum: 3,
                    swipeEdge: 4.0,
                    maxWidth: MediaQuery.of(context).size.width * 1.0,
                    maxHeight: MediaQuery.of(context).size.width * 1.0,
                    minWidth: MediaQuery.of(context).size.width * 0.9,
                    minHeight: MediaQuery.of(context).size.width * .9,
                    cardBuilder: (context, index) => Card(
                          borderOnForeground: true,
                          elevation: 8.0,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            '${welcomeImages[index]}'),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                        ),
                    cardController: controller = CardController(),
                    swipeUpdateCallback:
                        (DragUpdateDetails details, Alignment align) {
                      /// Get swiping card's alignment
                      if (align.x < 0) {
                        //Card is LEFT swiping
                      } else if (align.x > 0) {
                        //Card is RIGHT swiping
                      }
                    },
                    swipeCompleteCallback:
                        (CardSwipeOrientation orientation, int index) {
                      /// Get orientation & index of swiped card!
                    })),
          ],
        ),
        bottomNavigationBar: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 80.0,
                  color: Colors.pinkAccent,
                ),
                Container(
                  
                  height: 40.0,
                  width: 40.0,
                  color: Colors.blue,
                ),
              ],
            ),

            //     Container(
            //   height: 70.0,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: <Widget>[

            //     ],
            //   ),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border(top: BorderSide(color: Colors.black12,width: 1.0))

            //   ),
            // ),
          ],
        ));
  }
}

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 70.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    child: Stack(children: <Widget>[
                      Center(
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        top: 7.0,
                        left: 8.0,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 6.0),
                            child: Text(
                              "2",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(50),
                              color: Colors.red),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                RotatedBox(
                    quarterTurns: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 14,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 19.0),
                  child: Container(
                      height: 35.0,
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Image.asset('assets/coin.png'),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "0",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)),
        gradient: LinearGradient(
          colors: [Color(0xffA061BA), Color(0xff6499CE)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
