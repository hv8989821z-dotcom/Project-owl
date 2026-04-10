import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                // Шапка с логотипом (как на всех экранах)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.asset('assets/Logo.png', width: 60, height: 60),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Филин", style: TextStyle(fontSize: 24)),
                            const Text(
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
                // Заголовок "Заполнение профиля"
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Заполнение профиля",
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                ),
                // Подзаголовок
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Укажите свои персональные данные и прикрепите документ для подтверждения",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Блок "Выберите роль"
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Выберите роль",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Переключатели ролей (студент / преподаватель)
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: _RoleButton(role: "студент", isSelected: true),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _RoleButton(role: "преподаватель", isSelected: false),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Поле ФИО
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "ФИО",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Иванов Иван Иванович",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(33, 173, 252, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Поле Группа
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Группа",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "111–222",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(33, 173, 252, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Поле Кафедра
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Кафедра",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Информационные технологии",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(33, 173, 252, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Блок загрузки документа
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Документы для подтверждения",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    "Документ, подтверждающий личность (зачетная книжка)",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.cloud_upload, size: 40, color: Colors.grey),
                        const SizedBox(height: 5),
                        Text(
                          "PDF, JPG, PNG до 30 МБ",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Кнопка "Отправить на проверку"
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: _SubmitButton(),
                ),
                const SizedBox(height: 20),

                // Подпись под кнопкой
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                  child: Text(
                    "Данные можно будет изменить позже в профиле",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Виджет кнопки выбора роли (студент / преподаватель)
class _RoleButton extends StatelessWidget {
  final String role;
  final bool isSelected;

  const _RoleButton({required this.role, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? const Color.fromRGBO(33, 173, 252, 1) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Text(
          role,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}

// Виджет кнопки отправки (стиль как в предыдущих экранах)
class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // Здесь будет логика отправки данных на сервер
        // Например: Navigator.push(...)
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        width: screenWidth * 0.85,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(33, 173, 252, 1),
          borderRadius: BorderRadius.circular(7),
        ),
        child: const Center(
          child: Text(
            "Отправить на проверку",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}