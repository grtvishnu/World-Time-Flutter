import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Loading';
void setupWorldTime() async{
  WorldTime instance = WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata');
  await instance.getTime();
  print(instance.time);
  setState(() {
    time = instance.time;
  });
}

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Text(time),
      ),
    );
  }
}
