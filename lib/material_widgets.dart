import 'package:flutter/material.dart';

class MaterialWidgetScreen extends StatefulWidget {
  const MaterialWidgetScreen({Key? key}) : super(key: key);

  @override
  State<MaterialWidgetScreen> createState() => _MaterialWidgetScreenState();
}

class _MaterialWidgetScreenState extends State<MaterialWidgetScreen> {
  final List<String> entryList = <String>[
    'New Group',
    'Contacts',
    'Calls',
    'People Nearby',
    'Saved Messages',
    'Settings',
    'Unused',
    'Invite Friends',
    'Telegram Features',
  ];
  
  final List<IconData> iconList = <IconData>[
    Icons.group_outlined,
    Icons.person_outline,
    Icons.call_outlined,
    Icons.person_outline,
    Icons.bookmark_outline,
    Icons.settings_outlined,
    Icons.help,
    Icons.person_add_outlined,
    Icons.help_outline,
  ];

  final Map<String, Color> colorMap = {
    "drawerHeader" : Color(0xFF233040),
    "drawerBackground" : Color(0xFF1C242F),
    "entryTitle" : Color(0xFFECF0F1),
    "entryLeading" : Color(0xFF727E8A),
    "nickname" : Color(0xFFFEFEFE),
    "phone" : Color(0xFF717D8B),
    "themeSwitcher" : Color(0xFFFFFFFF),
  };

  final Map<String, Color> colorMapLight = {
    "drawerHeader" : Color(0xFF5A8FBB),
    "drawerBackground" : Color(0xFFFFFFFF),
    "entryTitle" : Color(0xFF454545),
    "entryLeading" : Color(0xFFAAB0B3),
    "nickname" : Color(0xFFF4FCFD),
    "phone" : Color(0xFFABD2EF),
    "themeSwitcher" : Color(0xFFFAFEFD),
  };

  var _darkThemeUsing = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Material widgets demo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.airline_seat_flat),
            onPressed: () {
              ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Ты пидор')));
            },
          ),
          DrawerButtonWidget(),
        ],
      ),
      endDrawer: Drawer(
        child: Container(
          color: _darkThemeUsing ? colorMap["drawerBackground"] : colorMapLight["drawerBackground"],
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(color: _darkThemeUsing ? colorMap["drawerHeader"] : colorMapLight["drawerHeader"]),
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Photo',
                            style: TextStyle(color: _darkThemeUsing ? colorMap["nickname"] : colorMapLight["nickname"]),
                          ),
                          Expanded(
                            child: Text(''),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.light_mode,
                              color: _darkThemeUsing ? colorMap["themeSwitcher"] : colorMapLight["themeSwitcher"],
                            ),
                            onPressed: () {
                              setState(() {
                                _darkThemeUsing = _darkThemeUsing ? false : true;
                              });
                              },
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(''),
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Alexey Bukin',
                                style: TextStyle(
                                  color: _darkThemeUsing ? colorMap["nickname"] : colorMapLight["nickname"],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '+7 (920) 008-12-76',
                                style: TextStyle(color: _darkThemeUsing ? colorMap["phone"] : colorMapLight["phone"]),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Text(''),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: _darkThemeUsing ? colorMap["themeSwitcher"] : colorMapLight["themeSwitcher"],
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),  
              ),
              for (var i = 0; i < entryList.length; i++)
                if (i != 6)
                  ListTile(
                    leading: Icon(
                      iconList[i],
                      color: _darkThemeUsing ? colorMap["entryLeading"] : colorMapLight["entryLeading"],
                    ),
                    title: Text(
                      entryList[i],
                      style: TextStyle(
                        color: _darkThemeUsing ? colorMap["entryTitle"] : colorMapLight["entryTitle"],
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                else
                  Divider(),
            ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.help,
          size: 55,
        ),
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Хуй саси')));
        },
        tooltip: 'Саня',
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
          child: const Text('Нажми меня'),
          onPressed: () {},
        ),
      ),
    );
  }
}

class DrawerButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.toc),
      onPressed: () {
        Scaffold.of(context).openEndDrawer();
      },
    );
  }
}
