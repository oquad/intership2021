import 'package:flutter/material.dart';

class MaterialWidgetScreen extends StatefulWidget {
  const MaterialWidgetScreen({Key? key}) : super(key: key);

  @override
  State<MaterialWidgetScreen> createState() => _MaterialWidgetScreenState();
}

enum PopupButtonOptions { yes, yesSure, no, noSure }

extension PoputToString on PopupButtonOptions {
  String toText() {
    switch (this) {
      case PopupButtonOptions.yes:
        return 'Я конь';
      case PopupButtonOptions.yesSure:
        return 'Я точно конь';
      case PopupButtonOptions.no:
        return 'Я не конь';
      case PopupButtonOptions.noSure:
        return 'Я точно не конь';
    }
  }
}

enum RadioOptions {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday,
}

class _MaterialWidgetScreenState extends State<MaterialWidgetScreen> {
  final List<String> entryList = <String>[
    'Разговоры о конях',
    'Contacts',
    'Calls',
    'People Nearby',
    'Saved Messages',
    'Settings',
    'Unused',
    'Радио',
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
    "drawerHeader": Color(0xFF233040),
    "drawerBackground": Color(0xFF1C242F),
    "entryTitle": Color(0xFFECF0F1),
    "entryLeading": Color(0xFF727E8A),
    "nickname": Color(0xFFFEFEFE),
    "phone": Color(0xFF717D8B),
    "themeSwitcher": Color(0xFFFFFFFF),
  };

  final Map<String, Color> colorMapLight = {
    "drawerHeader": Color(0xFF5A8FBB),
    "drawerBackground": Color(0xFFFFFFFF),
    "entryTitle": Color(0xFF454545),
    "entryLeading": Color(0xFFAAB0B3),
    "nickname": Color(0xFFF4FCFD),
    "phone": Color(0xFFABD2EF),
    "themeSwitcher": Color(0xFFFAFEFD),
  };

  /// TODO use [Theme] to change appearance
  var _darkThemeUsing = true;

  int _selectedIndex = 6;

  // TODO move to another widget
  var _answer = "А конь ли ты?";

  @override
  Widget build(BuildContext context) {

    final List<Widget> pageOptions = <Widget>[
      smallTalkAboutHorses(context),
      dataTableExample(context),
      cardsExample(context),
      tapBarExample(context),
      checkboxExample(context),
      dateTimePickerExapmle(context),
      defaultBody(context),
      RadioWidget(),
      sliderSwitchExample(context),
    ];

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
                  .showSnackBar(const SnackBar(content: Text('Ты конь')));
            },
          ),
          PopupMenuButton<PopupButtonOptions>(
              tooltip: "А конь ли ты?",
              onSelected: (PopupButtonOptions result) {
                setState(() {
                  _answer = result.toText();
                });
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<PopupButtonOptions>>[
                    for (final enumValue in PopupButtonOptions.values)
                      PopupMenuItem<PopupButtonOptions>(
                          value: enumValue, child: Text(enumValue.toText())),
                  ]),
          DrawerButtonWidget(),
        ],
      ),
      endDrawer: Drawer(
        child: Container(
          color: _darkThemeUsing
              ? colorMap["drawerBackground"]
              : colorMapLight["drawerBackground"],
          child: ListView(children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  color: _darkThemeUsing
                      ? colorMap["drawerHeader"]
                      : colorMapLight["drawerHeader"]),
              duration: Duration(milliseconds: 0),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: _darkThemeUsing
                              ? colorMap["drawerBackground"]
                              : colorMapLight["drawerBackground"],
                          radius: 35,
                          child: Text(
                            "AB",
                            style: TextStyle(
                              color: _darkThemeUsing
                                  ? colorMap["nickname"]
                                  : colorMapLight["nickname"],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(''),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.light_mode,
                            color: _darkThemeUsing
                                ? colorMap["themeSwitcher"]
                                : colorMapLight["themeSwitcher"],
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
                                color: _darkThemeUsing
                                    ? colorMap["nickname"]
                                    : colorMapLight["nickname"],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '+7 (920) 008-12-76',
                              style: TextStyle(
                                  color: _darkThemeUsing
                                      ? colorMap["phone"]
                                      : colorMapLight["phone"]),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Text(''),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: _darkThemeUsing
                                ? colorMap["themeSwitcher"]
                                : colorMapLight["themeSwitcher"],
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
                    color: _darkThemeUsing
                        ? colorMap["entryLeading"]
                        : colorMapLight["entryLeading"],
                  ),
                  title: Text(
                    entryList[i],
                    style: TextStyle(
                        color: _darkThemeUsing
                            ? colorMap["entryTitle"]
                            : colorMapLight["entryTitle"],
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = i;
                    });
                    Navigator.pop(context);
                  },
                )
              else
                Divider(),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.help,
          size: 55,
        ),
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Да не эту блять')));
        },
        tooltip: 'Саня',
      ),
      body: Center(
        child: pageOptions.elementAt(_selectedIndex),
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

Widget smallTalkAboutHorses(context) {
  return Center(
    child: Column(
      children: <Widget>[
        Expanded(
          child: Text(''),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20)),
          child: const Text('Нажми меня'),
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Вопрос к тебе есть'),
              content: Text('Ты конь?'),
              actions: <Widget>[
                TextButton(
                  child: Text('Да'),
                  onPressed: () => Navigator.pop(context, 'Да'),
                ),
                TextButton(
                  child: Text('Осуждаю'),
                  onPressed: () => Navigator.pop(context, 'Осуждаю'),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 40,
          child: Text(''),
        ),
        Text(_answer),
        Container(
          height: 40,
          child: Text(''),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20)),
          child: const Text('И меня тоже'),
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => SimpleDialog(
              title: const Text('Ты всё ещё конь?'),
              children: <Widget>[
                TextButton(
                  child: Text('Всё ещё конь'),
                  onPressed: () => Navigator.pop(context, 'Всё ещё конь'),
                ),
                TextButton(
                  child: Text('Всё ещё осуждаю'),
                  onPressed: () => Navigator.pop(context, 'Всё ещё осуждаю'),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Text(''),
        ),
      ],
    ),
  );
}

Widget dataTableExample(context) {
  return Text('Здесь будет таблица');
}

Widget cardsExample(context) {
  return Text('Здесь будут карточки (возможно с грид вью (или нет))');
}

Widget tapBarExample(context) {
  return Text('Здесь будет тапбар');
}

Widget checkboxExample(context) {
  return Text('Здесь будут чекбоксы');
}

Widget dateTimePickerExapmle(context) {
  return Text('Здесь будет выбор даты и времени');
}

Widget defaultBody(context) {
  return Text('Потяни от правого края или ткни на кнопку чтоб было по кайфу');
}

class RadioWidget extends StatefulWidget {
  RadioWidget({Key? key}) : super(key: key);

  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  RadioOptions? _day = RadioOptions.Monday;

  final List<String> dayTranslation = [
    "Понедельник",
    "Вторник",
    "Среда",
    "Четверг",
    "Пятница",
    "Суббота",
    "Воскресение",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 500,
        child: Column(
          children: <Widget>[
            for (var i = 0; i < dayTranslation.length; i++)
              ListTile(
                title: Text(dayTranslation[i]),
                visualDensity: VisualDensity.compact,
                leading: Radio<RadioOptions>(
                  value: RadioOptions.values[i],
                  groupValue: _day,
                  onChanged: (RadioOptions? value) {
                    setState(() {
                      _day = value;
                    });
                  },
                ),
              ),
          ],
        ));
  }
}

Widget radioExample(context) {
  return RadioWidget();
}

Widget sliderSwitchExample(context) {
  return Text('Здесь будут слайдеры и свичи');
}
