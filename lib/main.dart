import 'package:flutter/material.dart';
import 'package:flutter_widget_of_week/animated_container.dart';
import 'package:flutter_widget_of_week/expanse_panel_test.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Example")),
      body: SingleChildScrollView(
        child: ListBody(
          children: [
            ListTile(
              title: Text("ExpansionPanelList"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExpansePanelTest()),
                );
              },
            ),
            ListTile(
              title: Text("Animated Container"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimatedContainerExample()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}