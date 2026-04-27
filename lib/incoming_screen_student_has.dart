import 'package:flutter/material.dart';
import 'package:flutter_application_1/applications_student_screen.dart';
import 'package:flutter_application_1/alerts_student_screen.dart';

class Incoming extends StatefulWidget {
  const Incoming({super.key});

  @override
  State<Incoming> createState() => _IncomingState();
}

class _IncomingState extends State<Incoming> {
  int _selectedIndex = 0; // 0 - Чаты, 1 - Заявки, 2 - Оповещения

  // Список экранов
  final List<Widget> _screens = [
    Chats(), // Входящие
    Application(), // Преподаватели (ваш Teachers() виджет)
    Alert(), // Профиль (текущий экран)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image.asset('assets/Logo.png', width: 60, height: 60),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Филин", style: TextStyle(fontSize: 24)),
                                Text(
                                  "Проект по поиску помощи в проектах",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  softWrap: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            hasColor: _selectedIndex == 0,
                            text: "Чаты",
                            onTap: () {
                              setState(() {
                                _selectedIndex = 0; // Меняем экран
                              });
                            },
                          ),
                          CustomButton(
                            hasColor: _selectedIndex == 1,
                            text: "Заявки",
                            onTap: () {
                              setState(() {
                                _selectedIndex = 1; // Меняем экран
                              });
                            },
                          ),
                          CustomButton(
                            hasColor: _selectedIndex == 2,
                            text: "Оповещения",
                            onTap: () {
                              setState(() {
                                _selectedIndex = 2; // Меняем экран
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    IndexedStack(
                      index: _selectedIndex, // Какой экран показывать
                      children: _screens, // Список экранов
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.85,
      padding: const EdgeInsets.all(17),
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: const Color.fromRGBO(218, 218, 218, 1),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.account_circle,
            size: 42,
            color: Color.fromRGBO(224, 167, 87, 1),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Иванов Иван", style: TextStyle(fontSize: 14)),
              Text("Информационные технологии", style: TextStyle(fontSize: 14)),
              SizedBox(height: 10),
              Text("Здравствуйте!....", style: TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final bool hasColor;
  final String text;
  final VoidCallback? onTap;
  const CustomButton({
    super.key,
    required this.hasColor,
    required this.text,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
        width: screenWidth * 0.25,
        decoration: BoxDecoration(
          color: hasColor
              ? const Color.fromRGBO(94, 71, 61, 1)
              : Color.fromRGBO(218, 218, 218, 1),
          borderRadius: BorderRadius.circular(19),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 13, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
