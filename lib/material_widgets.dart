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

  int selectedIndex = 6;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pageOptions = <Widget>[
      SmallTalkAboutHorses(),
      DataTableWidget(),
      CardsWidget(),
      TapBarWidget(),
      CheckboxWidget(),
      DateTimeWidget(),
      DefaultWidget(),
      RadioWidget(),
      SliderSwitch(),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Material widgets demo'),
        actions: [AppBarActions()],
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
                          onPressed: () => setState(() =>
                              _darkThemeUsing = _darkThemeUsing ? false : true),
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
            DrawerList(),
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
        child: pageOptions.elementAt(selectedIndex),
      ),
    );
  }
}

class DrawerList extends StatefulWidget {
  DrawerList({Key? key}) : super(key: key);

  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
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

  final Map<String, IconData> entryAndIconList = {
    'Разговоры о конях': Icons.group_outlined,
    'Contacts': Icons.person_outline,
    'Calls': Icons.call_outlined,
    'People Nearby': Icons.person_outline,
    'Saved Messages': Icons.bookmark_outline,
    'Settings': Icons.settings_outlined,
    'Unused': Icons.help,
    'Радио': Icons.person_add_outlined,
    'Telegram Features': Icons.help_outline,
  };

  /// TODO define [TextStyle] correctly (including Boldness)
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      for (var i = 0; i < entryAndIconList.keys.length; i++)
        if (entryAndIconList.keys.elementAt(i) != 'Unused')
          ListTile(
              leading: Icon(entryAndIconList.values.elementAt(i)),
              title: Text(entryAndIconList.keys.elementAt(i)),
              onTap: () => setState(() => selectedIndex = i))
        else
          Divider(),
    ]);
  }
}

class AppBarActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.airline_seat_flat),
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Ты конь')));
          },
        ),
        PopupMenuButton<PopupButtonOptions>(
            tooltip: "А конь ли ты?",
            onSelected: (_) {},
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<PopupButtonOptions>>[
                  for (final enumValue in PopupButtonOptions.values)
                    PopupMenuItem<PopupButtonOptions>(
                        value: enumValue, child: Text(enumValue.toText())),
                ]),
        IconButton(
          icon: const Icon(Icons.toc),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
    );
  }
}

class SmallTalkAboutHorses extends StatefulWidget {
  SmallTalkAboutHorses({Key? key}) : super(key: key);

  @override
  _SmallTalkAboutHorsesState createState() => _SmallTalkAboutHorsesState();
}

class _SmallTalkAboutHorsesState extends State<SmallTalkAboutHorses> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Text(''),
          ),
          HorseButton1(),
          Container(
            height: 40,
            child: Text(''),
          ),
          HorseButton2(),
          Expanded(
            child: Text(''),
          ),
        ],
      ),
    );
  }
}

class HorseButton1 extends StatefulWidget {
  HorseButton1({Key? key}) : super(key: key);

  @override
  _HorseButton1State createState() => _HorseButton1State();
}

class _HorseButton1State extends State<HorseButton1> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
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
    );
  }
}

class HorseButton2 extends StatefulWidget {
  HorseButton2({Key? key}) : super(key: key);

  @override
  _HorseButton2State createState() => _HorseButton2State();
}

class _HorseButton2State extends State<HorseButton2> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
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
    );
  }
}

class DataTableWidget extends StatefulWidget {
  DataTableWidget({Key? key}) : super(key: key);

  @override
  _DataTableWidgetState createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  @override
  Widget build(BuildContext context) {
    return Text('Здесь будет таблица');
  }
}

class CardsWidget extends StatefulWidget {
  CardsWidget({Key? key}) : super(key: key);

  @override
  _CardsWidgetState createState() => _CardsWidgetState();
}

class _CardsWidgetState extends State<CardsWidget> {
  @override
  Widget build(BuildContext context) {
    return Text('Здесь будут карточки');
  }
}

class TapBarWidget extends StatefulWidget {
  TapBarWidget({Key? key}) : super(key: key);

  @override
  _TapBarWidgetState createState() => _TapBarWidgetState();
}

class _TapBarWidgetState extends State<TapBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Text('Здесь будет тапбар');
  }
}

class CheckboxWidget extends StatefulWidget {
  CheckboxWidget({Key? key}) : super(key: key);

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return Text('Здесь будут чекбоксы');
  }
}

class DateTimeWidget extends StatefulWidget {
  DateTimeWidget({Key? key}) : super(key: key);

  @override
  _DateTimeWidgetState createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  @override
  Widget build(BuildContext context) {
    return Text('Здесь будет выбор даты и времени');
  }
}

class DefaultWidget extends StatefulWidget {
  DefaultWidget({Key? key}) : super(key: key);

  @override
  _DefaultWidgetState createState() => _DefaultWidgetState();
}

class _DefaultWidgetState extends State<DefaultWidget> {
  @override
  Widget build(BuildContext context) {
    return Text('Потяни от правого края или ткни на кнопку чтоб было по кайфу');
  }
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
                  onChanged: (RadioOptions? value) =>
                      setState(() => _day = value),
                ),
              ),
          ],
        ));
  }
}

class SliderSwitch extends StatefulWidget {
  SliderSwitch({Key? key}) : super(key: key);

  @override
  _SliderSwitchState createState() => _SliderSwitchState();
}

class _SliderSwitchState extends State<SliderSwitch> {
  @override
  Widget build(BuildContext context) {
    return Text('Здесь будут слайдеры и свичи');
  }
}
