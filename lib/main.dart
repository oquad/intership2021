import 'package:flutter/material.dart';

import 'list_view.dart';
import 'material/material_demo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'OQUAD Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: [
            clickableListTile(
                name: 'ListView', screen: (_) => ListViewScreen()),
            clickableListTile(
                name: 'Material Widgets', screen: (_) => MaterialWidgetScreen()),
            clickableListTile(
                name: 'TO BE IMPLEMENTED', screen: (_) => ListViewScreen()),
            clickableListTile(
                name: 'TO BE IMPLEMENTED', screen: (_) => ListViewScreen()),
            clickableListTile(
                name: 'TO BE IMPLEMENTED', screen: (_) => ListViewScreen()),
            clickableListTile(
                name: 'TO BE IMPLEMENTED', screen: (_) => ListViewScreen()),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget clickableListTile({required name, required WidgetBuilder screen}) {
    return ListTile(
        title: Text(name),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: screen));
        });
  }
}
