import 'package:flutter/material.dart';

import 'nested_screens.dart';
import 'widgets.dart';

class MaterialWidgetScreen extends StatefulWidget {
  const MaterialWidgetScreen({Key? key}) : super(key: key);

  @override
  State<MaterialWidgetScreen> createState() => _MaterialWidgetScreenState();
}

enum PopupButtonOptions {
  yes,
  yesSure,
  no,
  noSure,
}

extension PopupToString on PopupButtonOptions {
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

extension RadioToString on RadioOptions {
  String toText() {
    switch (this) {
      case RadioOptions.Monday:
        return 'Понедельник';
      case RadioOptions.Tuesday:
        return 'Вторник';
      case RadioOptions.Wednesday:
        return 'Среда';
      case RadioOptions.Thursday:
        return 'Щитверг';
      case RadioOptions.Friday:
        return 'Пятницца';
      case RadioOptions.Saturday:
        return 'Суббота';
      case RadioOptions.Sunday:
        return 'Христос воскресе';
    }
  }
}

class _MaterialWidgetScreenState extends State<MaterialWidgetScreen> {
  /// TODO use [Theme] to change appearance
  Widget _currentScreen = SmallTalkAboutHorses();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Material widgets demo'),
        actions: [AppBarActions()],
      ),
      endDrawer: drawerWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.help, size: 55),
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Да не эту блять')));
        },
        tooltip: 'Саня',
      ),
      body: Center(child: _currentScreen),
    );
  }

  /// TODO colors
  Widget drawerWidget() {
    return Drawer(
      child: ListView(children: <Widget>[
        DrawerHeader(
          padding: EdgeInsets.all(0),
          duration: Duration(milliseconds: 0),
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                drawerHeaderTopLine(),
                drawerHeaderBottomLine(),
              ],
            ),
          ),
        ),
        drawerList(),
      ]),
    );
  }

  /// TODO define styles correctly
  /// TODO define ThemeChangerFunction
  Widget drawerHeaderTopLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CircleAvatar(
          radius: 35,
          child: Text("AB"),
        ),
        IconButton(
          icon: Icon(Icons.light_mode),
          onPressed: () {},
        ),
      ],
    );
  }

  /// TODO define styles correctly
  Widget drawerHeaderBottomLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Alexey Bukin'),
            Text('+7 (920) 008-12-76'),
          ],
        ),
        IconButton(
          icon: Icon(Icons.keyboard_arrow_down_outlined),
          onPressed: () {},
        ),
      ],
    );
  }

  static final titledIcons = [
    TitledIcon(
      title: 'Разговоры о конях',
      icon: Icons.group_outlined,
      builder: () => SmallTalkAboutHorses(),
    ),
    TitledIcon(
      title: 'Таблица',
      icon: Icons.person_outline,
      builder: () => DataTableWidget(),
    ),
    TitledIcon(
      title: 'Карточки',
      icon: Icons.call_outlined,
      builder: () => CardsWidget(),
    ),
    TitledIcon(
      title: 'Тапбар',
      icon: Icons.person_outline,
      builder: () => TapBarWidget(),
    ),
    TitledIcon(
      title: 'Чекбоксы',
      icon: Icons.bookmark_outline,
      builder: () => CheckboxWidget(),
    ),
    TitledIcon(
      title: 'Дата и время',
      icon: Icons.settings_outlined,
      builder: () => DateTimeWidget(),
    ),
    TitledIcon(
      title: 'Радио',
      icon: Icons.person_add_outlined,
      builder: () => RadioWidget(),
    ),
    TitledIcon(
      title: 'Слайдеры и свичи',
      icon: Icons.help_outline,
      builder: () => SliderSwitch(),
    ),
  ];

  Widget drawerItem(item) => DrawerItem(
      item: item,
      callback: () => setState(() {
            _currentScreen = item.builder.call();
            Navigator.pop(context);
          }));

  Widget drawerList() {
    return Column(
      children: [
        for (final item in titledIcons.take(6)) drawerItem(item),
        Divider(),
        for (final item in titledIcons.skip(6)) drawerItem(item),
      ],
    );
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
                .showSnackBar(const SnackBar(content: Text('Ты пидор')));
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
  static const RadioOptions _default = RadioOptions.Monday;
  RadioOptions _day = _default;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 500,
        child: Column(
          children: <Widget>[
            for (var i = 0; i < RadioOptions.values.length; i++)
              ListTile(
                title: Text(RadioOptions.values[i].toText()),
                leading: Radio<RadioOptions>(
                  value: RadioOptions.values[i],
                  groupValue: _day,
                  onChanged: (RadioOptions? value) =>
                      setState(() => _day = value ?? _default),
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
