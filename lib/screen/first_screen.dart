import 'package:api_learn/widegets/custom_appbar.dart';
import 'package:api_learn/widegets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String? stringResponse;
// I want only data part so we use Map
Map? mapResponse;

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // String url = 'https://reqres.in/api/users?page=2';
// body of api call
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    //   var url = Uri.parse('https://reqres.in/api/users?page=2');
    //   // http.Response response;
    //   // put api
    //   //stringResponse = http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    //  http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      //  ok response
      setState(() {
        // stringResponse = response.body;
        //we use json decode
        mapResponse = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    // call the function api call
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CrBar(
        title: CrText(text: 'AppBar'),
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.access_alarm),
          onPressed: () {},
        ),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue,
          ),
          child: Center(
            child: mapResponse == null
                ? Icon(Icons.arrow_back)
                : CrText(text: mapResponse!['support'].toString()),
          ),
        ),
      ),
    );
  }
}
