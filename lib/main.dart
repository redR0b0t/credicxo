import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:credicxotask/bloc_services/check_connectivity_bloc.dart';
import 'package:credicxotask/bloc_services/bloc_observer.dart';
import 'package:credicxotask/bloc_services/loading_bloc.dart';
import 'package:credicxotask/pages/music_list.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:credicxotask/models/music_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  initHive();

  runApp(MyApp());
}
void initHive() async{
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(MusicModelAdapter());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credicxo Task',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:MultiBlocProvider(
        providers: [
          BlocProvider(
          create: (_) => ConnectivityBloc(),
          ),
          BlocProvider(
          create: (_) => LoadingBloc(),),


        ],
        child: MusicList(),

      )


    );
  }
}

