import 'package:flutter/material.dart';

class Teachers extends StatelessWidget {
  const Teachers({super.key});

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
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Преподавательский состав",
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20), child: Botton()),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Block(
                        text: "Иванов Иван",
                        text_1: "Информационные технологии",
                        text_2: "Ученая степень: Доцент",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Block(
                        text: "Сергеев Сергей",
                        text_1: "Информационные технологии",
                        text_2: "Ученая степень: Доктор наук",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Block(
                        text: "Валуева Валерия",
                        text_1: "Информационные технологии",
                        text_2: "Ученая степень: Кандидат наук",
                      ),
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

class Block extends StatelessWidget {
  final String text;
  final String text_1;
  final String text_2;
  const Block({
    super.key,
    required this.text,
    required this.text_1,
    required this.text_2,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.85,
      padding: const EdgeInsets.all(17),
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
              Text(text, style: TextStyle(fontSize: 14)),
              Text(text_1, style: TextStyle(fontSize: 14)),
              Text(text_2, style: TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}

class Botton extends StatelessWidget {
  const Botton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
        width: screenWidth * 0.85,
        decoration: BoxDecoration(
          color: Color.fromRGBO(94, 71, 61, 1),
          borderRadius: BorderRadius.circular(11),
        ),
        child: const Center(
          child: Text(
            "Нажмите, для настройки поиска",
            style: TextStyle(fontSize: 13, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
