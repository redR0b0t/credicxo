import 'package:credicxotask/bloc_services/bookmarks_bloc.dart';
import 'package:credicxotask/models/music_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:credicxotask/widgets/song_card.dart';
import 'package:credicxotask/widgets/loading.dart';
import 'package:credicxotask/widgets/background.dart';
import 'package:credicxotask/widgets/empty_card.dart';
import 'package:credicxotask/bloc_services/loading_bloc.dart';
import 'package:hive/hive.dart';

class SavedMusicList extends StatefulWidget {
  @override
  _SavedMusicListState createState() => _SavedMusicListState();
}

class _SavedMusicListState extends State<SavedMusicList> {
  List<MusicModel> songs;

  void initState() {
    super.initState();

    fetchMusic();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Tracks"),
        centerTitle: true,
      ),
      body: Stack(children: <Widget>[
        Background(),
        _streamSongs(),
      ]),
    );
  }

  Widget _streamSongs() {
    return BlocBuilder<LoadingBloc, bool>(builder: (_, loading) {
      if (loading == true) {
        return Loading();
      } else {
        return BlocBuilder<BookMarkBloc, BookMarkEvent>(builder: (_, event) {
          print(event);
          if (event != BookMarkEvent.neutral) {
            fetchMusic();
          }
          return songs.length == 0
              ? EmptyCard(type: "Tracks")
              : ListView.builder(
                  itemCount: songs.length,
                  itemBuilder: (context, index) {
                    print(songs[index].name);
                    return SongCard(
                      song: songs[index],
                    );
                  });
        });
      }
    });
  }

  void fetchMusic() async {
    songs = [];
    print("fetchMusic called");
    Box _trackBox = await Hive.openBox('trackBox');
    print(_trackBox.length);
    for (int i = 0; i < _trackBox.length; i++) {
      songs.add(_trackBox.getAt(i));
    }
    context.bloc<BookMarkBloc>().add(BookMarkEvent.neutral);
    context.bloc<LoadingBloc>().add(LoadingEvent.off);
  }
}
