import 'package:flutter/material.dart';
import 'package:navbar/screen/yourdata.dart';
import 'screen/home.dart';
import 'screen/about.dart';
import 'screen/yourdata.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
              title: Text('HOME'),
              onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  )),
          ListTile(
              title: Text('About'),
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => About()))),
          ListTile(
              title: Text('Your Data'),
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => yourdata()))),
          ListTile(
            title: Text('contact'),
            onTap: () => AssetImage('images/1.jpg'),
          )
        ],
      ),
    );
  }
}
