import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserProfile extends StatelessWidget {
  List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.favorite, 'Избранное'),
    MenuRowData(Icons.call, 'Звонки'),
    MenuRowData(Icons.computer, 'Устройства'),
    MenuRowData(Icons.folder, 'Папка с чатами'),
  ];
  List<MenuRowData> secondMenuRow = [
    MenuRowData(Icons.notifications, 'Уведомления и звуки'),
    MenuRowData(Icons.privacy_tip, 'Конфиденциальность'),
    MenuRowData(Icons.date_range, 'Данные и память'),
    MenuRowData(Icons.brush, 'Оформление'),
    MenuRowData(Icons.language, 'Язык'),
  ];
  List<MenuRowData> thirdMenuRow = [
    MenuRowData(Icons.lock_clock, 'Apple Watch'),
  ];
  List<MenuRowData> fourthMenuRow = [
    MenuRowData(Icons.help, 'Помощь'),
    MenuRowData(Icons.question_answer, 'Вопросы о Telegram'),
  ];

  UserProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Настройки'),
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _UserInfo(),
            SizedBox(height: 30),
            _MenuWidget(menuRow: firstMenuRow),
            SizedBox(height: 30),
            _MenuWidget(menuRow: secondMenuRow),
            SizedBox(height: 30),
            _MenuWidget(menuRow: thirdMenuRow),
            SizedBox(height: 30),
            _MenuWidget(menuRow: fourthMenuRow),
          ],
        ),
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 20),
              _AvatarWidget(),
              SizedBox(height: 20),
              _UserNameWidget(),
              SizedBox(height: 10),
              _UserPhoneWidget(),
              SizedBox(height: 10),
              _UserNickNameWidget(),
            ],
          ),
        ),
        Positioned(
          top: 25,
          right: 25,
          child: Text(
            'Изменить',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}

class _UserNickNameWidget extends StatelessWidget {
  const _UserNickNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('@dshunevich');
  }
}

class _UserPhoneWidget extends StatelessWidget {
  const _UserPhoneWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '+7(999)999 99 99',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15,
      ),
    );
  }
}

class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Dmitry Shunevich',
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Placeholder(),
    );
  }
}

class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;
  const _MenuWidget({
    Key? key,
    required this.menuRow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: menuRow.map((data) => _MenuWidgetRow(data: data)).toList(),
      ),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;

  MenuRowData(this.icon, this.text);
}

class _MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;

  const _MenuWidgetRow({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(data.icon),
          SizedBox(width: 15),
          Expanded(child: Text(data.text)),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
