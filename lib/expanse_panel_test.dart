import 'package:flutter/material.dart';

class ExpansePanelTest extends StatefulWidget {
  _ExpansePanelTestState createState() => _ExpansePanelTestState();
}

class _ExpansePanelTestState extends State<ExpansePanelTest> {
  List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpansionPanelList"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _buildPanel(),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return ListTile(title: Text(item.headerValue));
            },
            body: ListBody(
              children: [
                ListTile(
                  title: Text(item.expandedValue),
                  subtitle:
                      Text('To delete this panel, tap the trash can icon'),
                  trailing: Icon(Icons.delete),
                  onTap: () {
                    setState(() {
                      _data.removeWhere((currentItem) => item == currentItem);
                    });
                  },
                ),
                ListTile(
                  title: Text(item.expandedValue),
                  subtitle:
                      Text('To delete this panel, tap the trash can icon'),
                  trailing: Icon(Icons.delete),
                  onTap: () {
                    setState(() {
                      _data.removeWhere((currentItem) => item == currentItem);
                    });
                  },
                ),
              ],
            ),
            isExpanded: item.isExpanded);
      }).toList(),
    );
  }
}

class Item {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item({
    @required this.expandedValue,
    @required this.headerValue,
    this.isExpanded = false,
  });
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}
