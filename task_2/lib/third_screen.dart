import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Связь'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Блок Контакты
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.email, color: Colors.blue),
                      title: Text('vladelymanov@gmail.com'),
                    ),
                    const Divider(height: 1),
                    const ListTile(
                      leading: Icon(Icons.web, color: Colors.blue),
                      title: Text('https://github.com/Vlad256E'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),

              // Кнопки Подписаться/Сообщение
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Подписаться',
                          style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: Colors.blue[800]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Сообщение',
                          style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),

              // Нижние кнопки навигации
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Кнопка Назад
                  OutlinedButton(
                    onPressed: () => context.pop(),
                    child: const Text('Назад'),
                  ),
                  const SizedBox(width: 20),
                  // Кнопка На главную
                  ElevatedButton(
                    onPressed: () => context.go('/'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800], 
                    ),
                    child: const Text(
                      'На главную',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}