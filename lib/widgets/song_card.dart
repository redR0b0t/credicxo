
import 'package:flutter/material.dart';
import 'package:credicxotask/models/music_model.dart';

//import 'package:credicxotask/pages/song_details.dart';
import 'package:credicxotask/widgets/transparent_chip.dart';

class SongCard extends StatelessWidget {
  MusicModel song;


  SongCard({this.song,});




  @override
  Widget build(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.height * .3,
      margin: const EdgeInsets.only(right: 10.0, left: 10.0, top: 15),
      // width: 150.0,
      decoration: new BoxDecoration(
        //color: color,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
              spreadRadius: 1.0,
              offset: new Offset(0.0, 1.0)),
        ],
      ),
      child: InkWell(
        onTap: () {
//          Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) => SongDetails(song: song,)));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10)),
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
              ),
              background(),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      // Colors.black87,
                      Colors.black54,
                      Colors.transparent
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: TransparentChip(
                  label: song.name.trim(),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TransparentChip(
                  label: song.trackId,

                  size: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget background() {
    return Center(
      child:Image.asset('assets/song.png'),
    );
  }
}
