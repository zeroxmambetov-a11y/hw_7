import 'package:flutter/material.dart';
import 'result_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    loginController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // Диалог подтверждения
  void showConfirmDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Подтверждение'),
          content: Text(
            'Имя: ${nameController.text}\n'
            'Фамилия: ${surnameController.text}\n'
            'Телефон: ${phoneController.text}\n'
            'Email: ${emailController.text}\n'
            'Логин: ${loginController.text}',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResultPage(
                      name: nameController.text,
                      surname: surnameController.text,
                      phone: phoneController.text,
                      email: emailController.text,
                      login: loginController.text,
                    ),
                  ),
                );
              },
              child: Text('ОК'),
            ),
          ],
        );
      },
    );
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      showConfirmDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация'),
        backgroundColor: Color(0xFFF5EDF7),
        foregroundColor: Colors.black,
        elevation: 1,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildTextField(
                controller: nameController,
                label: 'Имя',
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Введите имя';
                  if (!RegExp(r'^[a-zA-Zа-яА-Я]+$').hasMatch(value)) {
                    return 'Только буквы';
                  }
                  return null;
                },
              ),
              buildTextField(
                controller: surnameController,
                label: 'Фамилия',
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Введите фамилию';
                  if (!RegExp(r'^[a-zA-Zа-яА-Я]+$').hasMatch(value)) {
                    return 'Только буквы';
                  }
                  return null;
                },
              ),
              buildTextField(
                controller: phoneController,
                label: 'Телефон',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите номер телефона';
                  }
                  if (value.length < 10) return 'Слишком короткий номер';
                  return null;
                },
              ),
              buildTextField(
                controller: emailController,
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Введите email';
                  if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(value)) {
                    return 'Неверный email';
                  }
                  return null;
                },
              ),
              buildTextField(
                controller: loginController,
                label: 'Логин',
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Введите логин';
                  if (value.length < 4) return 'Минимум 4 символа';
                  return null;
                },
              ),
              buildTextField(
                controller: passwordController,
                label: 'Пароль',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Введите пароль';
                  if (value.length < 6) return 'Минимум 6 символов';
                  return null;
                },
              ),
              buildTextField(
                controller: confirmPasswordController,
                label: 'Повтор пароля',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Повторите пароль';
                  }
                  if (value != passwordController.text) {
                    return 'Пароли не совпадают';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE8DEF8),
                    foregroundColor: Colors.purple.shade700,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Зарегистрироваться',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.white,
        ),
        validator: validator,
      ),
    );
  }
}
