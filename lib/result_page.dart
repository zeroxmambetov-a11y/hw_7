import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String name;
  final String surname;
  final String phone;
  final String email;
  final String login;

  ResultPage({
    required this.name,
    required this.surname,
    required this.phone,
    required this.email,
    required this.login,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EDF7),
      appBar: AppBar(
        title: Text('Данные пользователя'),
        backgroundColor: Color(0xFFF5EDF7),
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(height: 10),
            // Аватар с буквой
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Text(
                name.isNotEmpty ? name[0].toUpperCase() : '?',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),

            // Строки с данными
            infoRow(Icons.person, 'Имя', name),
            SizedBox(height: 16),
            infoRow(Icons.badge, 'Фамилия', surname),
            SizedBox(height: 16),
            infoRow(Icons.call, 'Телефон', phone),
            SizedBox(height: 16),
            infoRow(Icons.email, 'Email', email),
            SizedBox(height: 16),
            infoRow(Icons.account_circle, 'Логин', login),
          ],
        ),
      ),
    );
  }

  Widget infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue, size: 26),
        SizedBox(width: 16),
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
