import 'package:flutter/material.dart';
// Импортируем Supabase
import 'package:supabase_flutter/supabase_flutter.dart';

// Это главная функция, с нее начинается программа
Future<void> main() async {
  // Обязательно для Supabase
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://zwlbyevxixxiwpjzjury.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp3bGJ5ZXZ4aXh4aXdwanpqdXJ5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjE5Mjg5NjEsImV4cCI6MjA3NzUwNDk2MX0.hQlO6j6I9lM_cEsK14ex7sOjHkW1JVufMZbxV4DU6_k',
  );

  // Запускаем приложение
  runApp(MyApp());
}

// Это корень нашего приложения
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'task_3',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Контроллер для ввода имени
  TextEditingController _usernameController = TextEditingController();
  // Контроллер для ввода текста
  TextEditingController _textController = TextEditingController();

  // Это наш клиент Supabase, через него мы делаем запросы
  final _supabase = Supabase.instance.client;

  // Здесь будем хранить список данных из базы
  List<Map<String, dynamic>> _data = [];
  // Переменная для отслеживания загрузки
  bool _isLoading = false;

  // Эта функция вызывается при загрузке экрана
  @override
  void initState() {
    super.initState();
    // Сразу загружаем данные при открытии
    _loadData();
  }

  // Функция для ЗАГРУЗКИ данных
  Future<void> _loadData() async {
    // Показываем индикатор загрузки
    setState(() {
      _isLoading = true;
    });

    // Делаем запрос в базу (select) из таблицы 'profiles'
    // Это метод из задания
    final response = await _supabase.from('profiles').select();

    // Прячем индикатор и обновляем список данных на экране
    setState(() {
      // Преобразуем ответ в нужный нам формат
      _data = List<Map<String, dynamic>>.from(response);
      _isLoading = false;
    });
  }

  // Функция для ДОБАВЛЕНИЯ данных
  Future<void> _addData() async {
    String username = _usernameController.text;
    String text = _textController.text;

    // Проверяем, что поля не пустые
    if (username.isEmpty || text.isEmpty) {
      print('Поля не должны быть пустыми');
      return;
    }

    // Вставляем данные (insert) в таблицу 'profiles'
    // Это метод из задания
    await _supabase.from('profiles').insert({
      'username': username,
      'text': text,
    });

    // Очищаем поля ввода
    _usernameController.clear();
    _textController.clear();

    // Перезагружаем список, чтобы увидеть новые данные
    _loadData();
  }

  // Это наш экран
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Таблица supabase'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        // Column располагает все вертикально
        child: Column(
          children: [
            // Поле для ввода 'username'
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            // Отступ
            SizedBox(height: 12.0),
            // Поле для ввода 'text'
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Text',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Кнопка 'Добавить'
                ElevatedButton(
                  onPressed: _addData, // Вызываем функцию добавления
                  child: Text('Добавить'),
                ),
                // Кнопка 'Загрузить'
                ElevatedButton(
                  onPressed: _loadData, // Вызываем функцию загрузки
                  child: Text('Загрузить'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            // Отображение списка пользователей
            // Проверяем, идет ли загрузка
            _isLoading
                ? CircularProgressIndicator() // Показываем крутилку
                : Expanded(
                    // ListView.builder строит список
                    child: ListView.builder(
                      itemCount: _data.length,
                      itemBuilder: (context, index) {
                        // Берем один элемент из списка
                        var item = _data[index];
                        // Показываем его
                        return Card(
                          child: ListTile(
                            title: Text(item['username']),
                            subtitle: Text(item['text']),
                            trailing: Text(
                              // Показываем ID для наглядности
                              item['id'].toString().substring(0, 4) + '...',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}