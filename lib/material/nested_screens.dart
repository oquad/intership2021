import 'package:flutter/material.dart';

class SmallTalkAboutHorses extends StatelessWidget {
  final ButtonStyle _horseButtonsStyle =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Spacer(flex: 4),
          horseButton1(context),
          Spacer(),
          horseButton2(context),
          Spacer(flex: 4),
        ],
      ),
    );
  }

  Widget horseButton1(context) {
    return ElevatedButton(
        style: _horseButtonsStyle,
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
            ).then((result) => ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(result ?? ':(')))));
  }

  Widget horseButton2(context) {
    return ElevatedButton(
      style: _horseButtonsStyle,
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
