import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/bottom_navigation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),


      ),
      body:Container(color: Colors.black,)
            
            
            


    );
  }
}