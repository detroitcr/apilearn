import 'package:api_learn/widegets/custom_appbar.dart';
import 'package:api_learn/widegets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//service
String? stringResponse;
// I want only data part so we use Map
Map? mapResponse;

Map? dataResponse;

// for List
List? listResponse;

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // String url = 'https://reqres.in/api/users?page=2';
// body of api call
  Future apicall() async {
    // declare response variable
    http.Response response;
    // single user api
    // response = await http.get(Uri.parse('https://reqres.in/api/users/4'));
    // list of users api
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
        print(mapResponse);

        // dataResponse = json.decode(response.body);
        // we fetch the data from mapResponse throuh api and support is the part where which data accesed
        // dataResponse = mapResponse!['data'][0];
        //  dataResponse = mapResponse!['data']; // this line show null ?
        listResponse = mapResponse!['data'];
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
      // Length of a data
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(listResponse![index]['avatar']),
                ),
                CrText(
                  text: listResponse![index]['id'].toString(),
                  style: TextStyle(color: Colors.black),
                ),
                CrText(
                  text: listResponse![index]['email'].toString(),
                  style: TextStyle(color: Colors.black),
                ),
                CrText(
                  text: listResponse![index]['first_name'].toString(),
                  style: TextStyle(color: Colors.black),
                ),
                CrText(
                  text: listResponse![index]['last_name'].toString(),
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        },
        itemCount: listResponse!.length == null ? 0 : listResponse!.length,
      ),
    );
  }
}
