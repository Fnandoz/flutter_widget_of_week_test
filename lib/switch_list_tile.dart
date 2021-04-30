import 'package:flutter/material.dart';

class SwitchListTileExample extends StatefulWidget {
  _SwitchListTileExampleState createState() => _SwitchListTileExampleState();
}

class _SwitchListTileExampleState extends State<SwitchListTileExample> {
  var _toggled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch List Tile Example"),
      ),
      body: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            ListTile(
              title: Text("ListTile"),
              subtitle: Text("Hot and cold?"),
              leading: Icon(Icons.ac_unit),
              trailing: Icon(Icons.local_fire_department),
            ),
            SwitchListTile(
              title: Text("SwitchListTile"),
              value: _toggled,
              onChanged: (bool value){
                setState(() {
                  _toggled = value;
                });
              },
              subtitle: Text("Airplane mode?"),
              secondary: Icon(Icons.airplanemode_active),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            SwitchListTile(
                title: Text("Select all"),
                activeThumbImage: _toggled ?
                NetworkImage("https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png") : null,
                value: _toggled,
                onChanged: (bool value){
              setState() => _toggled = value;
            })
          ],
        ),
      )
    );
  }
}