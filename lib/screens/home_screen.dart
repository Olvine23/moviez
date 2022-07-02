import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:moviez/screens/components/body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: const  Body(),
    

    );
    
    
  }

  AppBar buildAppBar() {
    return AppBar(

      
      backgroundColor: Colors.white,
      elevation: 0,

      title: Text("Moviez"),
      
      leading: IconButton(padding: EdgeInsets.only(left: 20), onPressed: (){}, icon: Icon(Icons.menu)),
      actions:
      <Widget> [
        
       IconButton(padding: EdgeInsets.symmetric(horizontal: 20), onPressed: (){}, icon: Icon(Icons.search, size: 30,))
      ],
    );
    
  }
}