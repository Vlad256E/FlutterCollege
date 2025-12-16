import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Профиль пользователя',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Немного светлее фон, чтобы карточки выделялись
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль пользователя'),
        centerTitle: true, // Отцентровал заголовок
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [

              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity, // Растянуть на всю ширину
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),

                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/en/8/82/Lightning_McQueen.png'),
                      backgroundColor: Colors.grey[200],
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Елыманов Влад',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Студент',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue[700],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on, size: 16, color: Colors.grey),
                        Text(
                          'Санкт-Петербург, Россия',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),

              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatItem('Посты', '0'),
                    _buildVerticalDivider(),
                    _buildStatItem('Подписчики', '1'),
                    _buildVerticalDivider(),
                    _buildStatItem('Рейтинг', '4.999998'),
                  ],
                ),
              ),
              SizedBox(height: 20.0),

              Container(
                padding: EdgeInsets.all(20.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'О себе',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Привет! Я начинающий разработчик мобильных приложений.',
                      style: TextStyle(fontSize: 15.0, height: 1.5, color: Colors.grey[800]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),

              
              Container(
                padding: EdgeInsets.all(20.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Навыки и Интересы',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Wrap(
                      spacing: 8.0, // Отступ по горизонтали
                      runSpacing: 8.0, // Отступ по вертикали
                      children: [
                        _buildChip('Ничего'),
                        _buildChip('Не'),
                        _buildChip('Умею'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.email, color: Colors.blue),
                      title: Text('vladelymanov@gmail.com'),
                    ),
                    Divider(height: 1), // Линия разделитель
                    ListTile(
                      leading: Icon(Icons.web, color: Colors.blue),
                      title: Text('https://github.com/Vlad256E'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Подписаться', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: Colors.blue[800]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Сообщение', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0), // Отступ в самом низу
            ],
          ),
        ),
      ),
    );
  }

  // Вспомогательный метод для создания элемента статистики
  Widget _buildStatItem(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  // Вспомогательный метод для разделителя
  Widget _buildVerticalDivider() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.grey[300],
    );
  }

  // Вспомогательный метод для создания "Чипса" (тэга)
  Widget _buildChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blue[50],
      labelStyle: TextStyle(color: Colors.blue[800]),
      side: BorderSide.none, // Убрал обводку
    );
  }
}