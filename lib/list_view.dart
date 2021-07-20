import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

/// Private State class that goes with [ListViewScreen]
class _ListViewScreenState extends State<ListViewScreen> {
  /// List of titles for entries which will be used in [ListView] widgets
  static final List<String> titleList = <String>[
    'Title 1',
    'Title 2',
    'Title 3'
  ];

  /// List of color codes for Container Colors in [ListView] builders
  static final List<int> colorCodes = <int>[600, 400, 200];

  /// List of functions what changes widgets on clicking buttons in [BottomNavigationBar]
  static final List<Function> _widgetOptions = <Function>[
    listViewBuilder,
    listViewBuilderBuilder,
    listViewSeparatedBuilder,
  ];

  /// Value of currently showing element from [_widgetOptions] for body of [Scaffold]
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Demo'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex).call(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ListView',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ListView.builder',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ListView.separated',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
      ),
    );
  }

  /// Variant of widget that uses [ListView] constructor
  static Widget listViewBuilder() {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        for (var i = 0; i < titleList.length; i++)
          Container(
              width: 600,
              color: Colors.blue[colorCodes[i]],
              child: Center(child: Text('${titleList[i]}'))),
      ],
      scrollDirection: Axis.horizontal,
    );
  }

  /// Variant of widget that uses [ListView.builder] constructor
  static Widget listViewBuilderBuilder() {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: titleList.length,
      itemBuilder: (_, int index) {
        return Container(
            height: 300,
            color: Colors.blue[colorCodes[index]],
            child: Center(child: Text('${titleList[index]}')));
      },
    );
  }

  /// Variant of widget that uses [ListView.separated] constructor
  static Widget listViewSeparatedBuilder() {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: titleList.length,
      itemBuilder: (_, int index) {
        return Container(
            height: 300,
            color: Colors.blue[colorCodes[index]],
            child: Center(child: Text('${titleList[index]}')));
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
