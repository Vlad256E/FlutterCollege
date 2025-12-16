import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Инфо'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Блок О себе
              Container(
                padding: const EdgeInsets.all(20.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'О себе',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Привет! Я начинающий разработчик мобильных приложений.',
                      style: TextStyle(
                          fontSize: 15.0, height: 1.5, color: Colors.grey[800]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),

              // Блок Навыки
              Container(
                padding: const EdgeInsets.all(20.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Навыки и Интересы',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12.0),
                    // Список навыков
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        Chip(
                          label: const Text('Ничего'),
                          backgroundColor: Colors.blue[50],
                          labelStyle: TextStyle(color: Colors.blue[800]),
                          side: BorderSide.none,
                        ),
                        Chip(
                          label: const Text('Не'),
                          backgroundColor: Colors.blue[50],
                          labelStyle: TextStyle(color: Colors.blue[800]),
                          side: BorderSide.none,
                        ),
                        Chip(
                          label: const Text('Умею'),
                          backgroundColor: Colors.blue[50],
                          labelStyle: TextStyle(color: Colors.blue[800]),
                          side: BorderSide.none,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),

              // Кнопки навигации
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () => context.pop(),
                    child: const Text('Назад'),
                  ),
                  ElevatedButton(
                    onPressed: () => context.push('/third'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                    ),
                    child: const Text(
                      'Контакты',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}