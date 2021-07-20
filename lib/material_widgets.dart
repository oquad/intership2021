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
          ]),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(color: Color(0xFF233040)),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Photo',
                          style: TextStyle(color: Color(0xFFECF0F1)),
                        ),
                        Expanded(
                          child: Text(''),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.light_mode,
                            color: Color(0xFFECF0F1),
                            ),
                          onPressed: () {},
                          )
                      ],
                    ),
                    Expanded(
                      child: Text(''),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                             'Alexey Bukin',
                             style: TextStyle(color: Color(0xFFECF0F1)),
                            ),
                            Text(
                              '+7 (920) 008-12-76',
                              style: TextStyle(color: Color(0xFF727E8A)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    
                  ],
                ),
            ),  
            ),
            for (var i = 0; i < entryList.length; i++)
              if (i != 6)
                Container(
                  decoration: BoxDecoration(color: Color(0xFF1C242F)),
                  child: ListTile(
                    leading: Icon(
                      iconList[i],
                      color: Color(0xFF727E8A),
                      ),
                    title: Text(
                      entryList[i],
                      style: TextStyle(color: Color(0xFFECF0F1)),
                      ),
                  )
                )
              else
                Container(
                  decoration: BoxDecoration(color: Color(0xFF1C242F)),
                  child: Divider(),
                )
          ]
        )
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
        child: Text('There must be prekol'),
      ),
    );
  }
}

BoxDecoration drawerListTileDecoration() {
  return BoxDecoration(color: Color(0xFF1C242F));
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
