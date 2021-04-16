import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  _AnimatedContainerExampleState createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child:  Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Center(
                child: AnimatedContainer(
                  width: selected ? 200.0 : 100.0,
                  height: selected ? 100.0 : 200.0,
                  color: selected ? Colors.red : Colors.blue,
                  alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
                  duration: Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  child: FlutterLogo(size: 75),
                ),
              ),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.delta.dx > details.primaryDelta)
                  setState(() {
                    selected = true;
                  });
                else
                  setState(() {
                    selected = false;
                  });
              },
              child: Center(
                child: Text("Drag"),
              ),
            )
          ],
        ),
      )
    );
  }
}