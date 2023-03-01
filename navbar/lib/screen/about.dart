import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:navbar/NavBar.dart';
import 'package:navbar/screen/yourdata.dart';

class About extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController content = TextEditingController();

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('info');
  GlobalKey formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Material(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "introduce urself",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.2))
                ]),
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                    border: OutlineInputBorder(),
                    hintText: 'name',
                  ),
                  
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.2))
                ]),
                child: TextFormField(
                  controller: content,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 90.0),
                    border: OutlineInputBorder(),
                    hintText: 'content',
                  ),
                 
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  collectionReference.add({
                    'name': name.text,
                    'content': content.text
                  }).whenComplete(() => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => yourdata())));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Container(
                          height: 20,
                          child: Text('your message has been received.')),
                      behavior: SnackBarBehavior.floating,
                     
                    ),
                  );
                },
                child: const Text("submit"),
              ),
              ElevatedButton(
                onPressed: () {
                  name.clear();
                  content.clear();
                },
                child: const Text("Reset"),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
