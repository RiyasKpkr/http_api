import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  var img = '';
  var id;
  var email = '';
  var firstName = '';
  var lastName = '';

  Future httpfunction() async {
    String url = 'https://reqres.in/api/users/2';
    var responce = await get(Uri.parse(url));
    print(responce.body);
    setState(() {
      img = jsonDecode(responce.body)['data']['avatar'];
      id = jsonDecode(responce.body)['data']['id'];
      email = jsonDecode(responce.body)['data']['email'];
      firstName = jsonDecode(responce.body)['data']['first_name'];
      lastName = jsonDecode(responce.body)['data']['last_name'];
    });
  }
  @override
  void initState() {
    httpfunction();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'API HTTP',
          style: TextStyle(
            color: Colors.red,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 5,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellowAccent,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.indigo,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  img,
                ),
                backgroundColor: Colors.red,
                radius: 100,
              ),
            ),
            Text(
              'ID :$id',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Email :$email',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'FirstName :$firstName ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'LastName :$lastName',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            // FloatingActionButton(
            //   onPressed: httpfunction,
            //   child: Icon(Icons.add),
            // ),
          ],
        ),
      ),
    );
  }
}
