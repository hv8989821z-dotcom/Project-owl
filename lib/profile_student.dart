import 'package:flutter/material.dart';
import 'package:flutter_application_1/teachers_screen_student_has.dart';
import 'package:flutter_application_1/incoming_screen_student_has.dart';
import 'package:flutter_application_1/user_data.dart';

class ProfileStudent extends StatefulWidget {
  const ProfileStudent({super.key});
  @override
  State<ProfileStudent> createState() => _ProfileStudent();
}

class _ProfileStudent extends State<ProfileStudent> {
  int _selectedIndex = 2; // 0 - Входящие, 1 - Преподаватели, 2 - Профиль

  // Список экранов
  final List<Widget> _screens = [
    Incoming(), // Входящие
    Teachers(), // Преподаватели (ваш Teachers() виджет)
    ProfileScreen(), // Профиль (текущий экран)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Основное содержимое (меняется)
            Expanded(
              child: IndexedStack(
                index: _selectedIndex, // Какой экран показывать
                children: _screens, // Список экранов
              ),
            ),

            // Нижняя панель (остаётся всегда)
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(199, 199, 199, 1),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ButtonMain(
                      text: "Входящие",
                      icon: Icons.sms,
                      hasBack: _selectedIndex == 0, // Подсветка если активен
                      hasColor: true,
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0; // Меняем экран
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ButtonMain(
                      text: "Преподаватели",
                      icon: Icons.auto_stories,
                      hasBack: _selectedIndex == 1, // Подсветка если активен
                      hasColor: true,
                      onTap: () {
                        setState(() {
                          _selectedIndex = 1; // Меняем экран
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ButtonMain(
                      text: "Профиль",
                      icon: Icons.person,
                      hasBack: _selectedIndex == 2, // Подсветка если активен
                      hasColor: true,
                      onTap: () {
                        setState(() {
                          _selectedIndex = 2; // Меняем экран
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Экран "Профиль студента"
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Шапка с логотипом
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
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Мой профиль", style: TextStyle(fontSize: 32)),
            ),
          ),
          Container(
            width: screenWidth * 0.85,
            margin: const EdgeInsets.only(top: 25),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              border: Border.all(
                color: const Color.fromRGBO(199, 199, 199, 1),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 42,
                  color: Color.fromRGBO(224, 167, 87, 1),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(UserData.name, style: TextStyle(fontSize: 14)),
                        SizedBox(width: 10),
                        Text(UserData.group, style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    Text(UserData.department, style: TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 30, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Выбранное направление ВКР/Проекта:",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: BottonText(text: "Нажмите, чтобы начать ввод"),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 30, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Оставить отзыв на преподавателя:",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: BottonText(text: "Нажмите, чтобы выбрать из списка"),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 30, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Посмотреть мои отзывы:",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: BottonText(text: "Нажмите, чтобы выбрать из списка"),
          ),
        ],
      ),
    );
  }
}

class BottonText extends StatelessWidget {
  final String text;
  const BottonText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: screenWidth * 0.85,
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          border: Border.all(
            color: const Color.fromRGBO(199, 199, 199, 1),
            width: 1,
          ),
        ),
        child: Center(child: Text(text, style: const TextStyle(fontSize: 13))),
      ),
    );
  }
}

//Кнопки на нижней панели
class ButtonMain extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool hasBack;
  final bool hasColor;
  final VoidCallback? onTap;
  const ButtonMain({
    super.key,
    required this.text,
    required this.icon,
    required this.hasBack,
    required this.hasColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: hasBack ? Color.fromRGBO(94, 71, 61, 1) : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: hasColor
                  ? const Color.fromARGB(255, 255, 255, 255)
                  : const Color.fromARGB(255, 0, 0, 0),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(
                fontSize: 10,
                color: hasColor
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
