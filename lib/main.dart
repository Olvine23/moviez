import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviez/screens/home_screen.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.grey,
      ),
     home:  const HomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   late Future<Show> futureShow;

  @override
  void initState(){
    super.initState();
    futureShow = fetchShow();
  }
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
         
        title: Text(widget.title),
      ),
      body:  Center(
        child: FutureBuilder<Show>(future: futureShow , builder: (context, snapshot){

          if(snapshot.hasData){
            return Center(
              child: Column(
                children: [
                  Text(snapshot.data!.name),
                  Text(snapshot.data!.id.toString()),
                  Text(snapshot.data!.runtime.toString())
                ],
              ),
            );
          }
          else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }

          return CircularProgressIndicator();

          

        },),
      )

    );
  }
}

//model class

class Album{

  final int userId;
  final int id;
  final String title;

  const Album(

    {
      required this.id,
      required this.title,
      required this.userId
    }
  );

  factory Album.fromJson(Map<String ,dynamic> json){
    return Album(id: json['id'], title: json['title'], userId: json['userId']);
  }

}

//fetchdata

Future<Album> fetchAlbum() async{

  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/4'));

  if(response.statusCode == 200){
    return Album.fromJson(jsonDecode(response.body));
  }
      

  else{
    throw Exception('failed');
  }
}

class Show{
  final String name;
  final int id;
  final int runtime;

  const  Show(
    {
      required this.id,
      required this.name,
      required this.runtime
    }
  );

  factory Show.fromJson(Map<String , dynamic> json){
    return Show(id: json['id'], name: json['name'], runtime: json['runtime']);
  }
}

Future<Show> fetchShow() async{
  final res = await http.get(Uri.parse('https://api.tvmaze.com/shows/1'));

  if(res.statusCode == 200 ){
    return Show.fromJson(jsonDecode(res.body));
  }

  else {
    throw Exception('Sorry bro');
  }
}