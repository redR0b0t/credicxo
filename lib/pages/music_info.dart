//import 'dart:ui';
//
//import 'package:cached_network_image/cached_network_image.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:credicxotask/data/data.dart';
//import 'package:credicxotask/utils/date_time_helper.dart';
//import 'package:credicxotask/utils/fetch_dev.dart';
//import 'package:credicxotask/utils/style_guide.dart';
//import 'package:credicxotask/widgets/background.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'package:credicxotask/models/purchased_token_model.dart';
//import 'package:credicxotask/pages/screens/contact_support.dart';
//
//class SongDetails extends StatefulWidget {
//  MusicModel song;
//
//  Gradient gradient;
//
//  //CallbackAction call;
//
//  SongDetails({this.song, });
//
//  @override
//  _SongDetailsState createState() => _SongDetailsState();
//}
//
//class _SongDetailsState extends State<SongDetails> {
//  DateTime deadline;
//
//
//  initState(){
//    super.initState();
//    deadline=(widget.song.buyTime as Timestamp).toDate().add(new Duration(days: 3));
//  }
//  //int days=DateTime.now().difference((widget.song['event_date'] as Timestamp).toDate()).inDays;
//  String time_rem() {
//
//    int days = -1 *
//        DateTime.now()
//            .difference((deadline as Timestamp).toDate())
//            .inDays
//            .toInt();
//    int hrs = -1 *
//        DateTime.now()
//            .difference((deadline as Timestamp).toDate())
//            .inHours
//            .toInt();
//    int min = -1 *
//        DateTime.now()
//            .difference((deadline as Timestamp).toDate())
//            .inMinutes
//            .toInt();
//    int sec = -1 *
//        DateTime.now()
//            .difference((deadline as Timestamp).toDate())
//            .inSeconds
//            .toInt();
//    // int cDays=DateTime.now().add;
//    //return "$days Days:$hrs Hours:$min Minutes:$sec Seconds remaining";
//    // return days>=1?"$days Days ":hrs>1?"$hrs Hours" :min>1?"$min Minutes":sec>60?"$sec Seconds ":"Starting soon";
//    // return "$days days";
//    if (days > 1)
//      return "$days Days";
//    else if (hrs > 1)
//      return "$hrs Hours";
//    else if (min > 1)
//      return "$min Minutes";
//    else if (sec > 1)
//      return "$sec Seconds";
//    else
//      return "0";
//  }
//  void _contactSupport(){
//    //whatsapp api call
//  }
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: NestedScrollView(
//        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//          return <Widget>[
//            SliverAppBar(
//              expandedHeight: 200.0,
//              floating: false,
//              pinned: true,
//              flexibleSpace: FlexibleSpaceBar(
//                  centerTitle: true,
//                  title: Container(
//                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//                    decoration: BoxDecoration(
//                      color: Colors.transparent.withOpacity(0.45),
//                      borderRadius: BorderRadius.circular(10.0),
//                      boxShadow: [
//                        BoxShadow(
//                          color: Colors.black12,
//                          offset: Offset(0.0, 15.0),
//                          blurRadius: 15.0,
//                        ),
//                        BoxShadow(
//                          color: Colors.black12,
//                          offset: Offset(0.0, -10.0),
//                          blurRadius: 10.0,
//                        ),
//                      ],
//                    ),
//                    child: Text("song ${widget.song.songPrice}(QxCredit)",
//                        style: TextStyle(
//                            color: Colors.white,
//                            fontSize: 16.4,
//                            shadows: [
//                              Shadow(
//                                blurRadius: 10.0,
//                                color: Colors.black,
//                                offset: Offset(5.0, 5.0),
//                              ),
//                            ],
//                            fontFamily: "RobotoRegular")),
//                  ),
//                  background:Image.asset("assets/song.png")
//              ),
//            ),
//          ];
//        },
//        body: Stack(
//          children: <Widget>[
//            Background(),
//            Container(
//              height: MediaQuery.of(context).size.height,
//              //color: Colors.red,
//              child: ListView(
//                children: <Widget>[
//                  decriptionCard('Description', '${widget.song.songPrice}'),
//                  rewardCard(),
//                  timingCard(),
//                  contactCard(),
//                  SizedBox(
//                    height: 15,
//                  ),
//                  Container(
//                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//                    //width: MediaQuery.of(context).size.width * 0.5,
//                    child:  RaisedButton(
//                      padding: EdgeInsets.symmetric(
//                          horizontal: 10, vertical: 15),
//                      color: Colors.blue.shade800,
//                      onPressed: () {
//                        Navigator.push(context,MaterialPageRoute(builder: (context)=>ContactSupport(replace:false)));
//                        // _launchWhatsApp();
//
//                      },
//                      shape: RoundedRectangleBorder(
//                          borderRadius:
//                          BorderRadius.all(Radius.circular(30))),
//                      child: Center(
//                        child: Text(
//                          'Contact support ',
//                          style: TextStyle(
//                              fontSize: 20.0,
//                              // fontWeight: FontWeight.bold,
//                              color: Colors.white,
//                              fontFamily: 'RobotoMedium'),
//                        ),
//                      ),
//                    ),
//                  )
//                ],
//              ),
//            )
//          ],
//        ),
//      ),
//    );
//  }
//
//  Widget decriptionCard(String title, String desc) {
//    return Card(
//      color: Colors.white.withOpacity(0.9),
//      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
//      elevation: 15,
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//      child: Padding(
//        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//        child: Column(
//          children: <Widget>[
//            Align(
//              alignment: Alignment.topLeft,
//              child: Text(
//                '${title} :',
//                style: subtitle,
//              ),
//            ),
//            new Text(
//              desc.replaceAll('\\n', '\n').trim(),
//              style: description,
//            )
//          ],
//        ),
//      ),
//    );
//  }
//
//  Widget rewardCard() {
//    return Card(
//        color: Colors.white.withOpacity(0.9),
//        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
//        elevation: 15,
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//        child: Padding(
//          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//          child: Column(
//            children: <Widget>[
//              Align(
//                alignment: Alignment.topLeft,
//                child: Text(
//                  ' Conversion Details :',
//                  style: subtitle,
//                ),
//              ),
//              SizedBox(
//                height: 10,
//              ),
//              Container(
//                padding: EdgeInsets.only(left: 20),
//                decoration: BoxDecoration(
//                  //color: Colors.white,
//
//                ),
//                child: Text(
//                  'song Price: ${widget.song.songPrice}',
//                  style: description,
//                ),
//              ),
//              SizedBox(
//                height: 10,
//              ),
//              Container(
//                padding: EdgeInsets.only(left: 20),
//                decoration: BoxDecoration(
//                  //color: Colors.white,
//
//                ),
//                child: Text(
//                  'You will get 60% : ${get60(widget.song.songPrice)}',
//                  style: description,
//                ),
//              ),
//            ],
//          ),
//        ));
//  }
//
//  Widget timingCard() {
//    return Card(
//        color: Colors.white.withOpacity(0.9),
//        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
//        elevation: 15,
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//        child: Padding(
//          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//          child: Column(
//            children: <Widget>[
//              Align(
//                alignment: Alignment.topLeft,
//                child: Text(
//                  ' Processing Time :',
//                  style: subtitle,
//                ),
//              ),
//              Text('The money will be transferred via ${widget.song.paytmWallet=='0'?"UPI":widget.song.paytmWallet=='1'?"Paytm Wallet":"PayPal"} (${widget.song.upiNum}) by Date: ${DatetimeHelper(timestamp:(widget.song.buyTime.toDate()).add(new Duration(days: 3)).toLocal().millisecondsSinceEpoch).getDate()}',
//                style: description,
//                textAlign: TextAlign.center,
//              ),
//
//            ],
//          ),
//        ));
//  }
//
//
//
//  }
//
//  Widget background() {
//    return Center(
//      child: Image.asset('assets/song.png'),
//    );
//  }
//
//
//}
