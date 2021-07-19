import 'package:flutter/material.dart';
//
//class ListViewScreen extends StatelessWidget {
//  final List<String> titleList = <String>[' Title 1', 'Title 2', 'Title 3'];
//  // List of titles for entries which will be used in ListView widgets
//  final List<int> colorCodes = <int>[600, 400, 200];
//  // List of bla-bla-bla
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text('ListView Demo'),
//      ),
//      body: Center(
//        child: Text('123'),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//      bottomNavigationBar: BottomNavigationBar(
//        items: const <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            label: '1',
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            label: '2',
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            label: '3',
//          ),
//        ],
//        currentIndex: 0,
//        onTap: (index) {},
//      ),
//    );
//  }
//}

/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].


/// This is the stateful widget that the main application instantiates.
class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ListViewScreenState extends State<ListViewScreen> {
  static Widget text() {
    return Text(
      'Index 0: Home',
      style: optionStyle,
    );
  }
  static Widget text2() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, __) => const Text('Foo'),
      );
  }
  static Widget text3() {
    return Text(
      'Index 2: Home',
      style: optionStyle,
    );
  }
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Function> _widgetOptions = <Function>[
    text,
    text2,
    text3,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex).call(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
