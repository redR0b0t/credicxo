import 'dart:async';
import 'dart:convert';
import 'package:credicxotask/models/music_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:credicxotask/bloc_network_service/check_connectivity_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:credicxotask/widgets/song_card.dart';
import 'package:credicxotask/widgets/loading.dart';

class MusicList extends StatefulWidget {
  @override
  _MusicListState createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  List<MusicModel> songs;

  void initState() {
    super.initState();
    fetchMusic();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterBloc(),
        child: Scaffold(
            appBar: AppBar(
              title: Text("Music List"),
              centerTitle: true,
            ),
            body: _streamSongs()));
  }

  Widget _streamSongs() {
    return songs == null
        ? Loading()
        : ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              print(songs[index].name);
              return SongCard(
                song: songs[index],
              );
            });
  }

  void fetchMusic() async {
    http.Response response = await http.get(
        'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7');
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var message = json['message'];
      var header = message['header'];
      var tracksJSON = message['body']['track_list'];
      print(json);
      print("message=\n");
      print(message);
      print("header=\n");
      print(header);
      print("tracks=\n");
      print(tracksJSON[3]);
      print(tracksJSON.length);
      setState(() {
        songs =
            (tracksJSON as List).map((i) => MusicModel.fromJson(i)).toList();
      });

      print(songs.length);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
