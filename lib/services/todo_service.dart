import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../models/todo.dart';

class TodoService {
  static Future<List<Todo>> fetchTodos() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/'));

    if (response.statusCode == 200) {
      final List todosJson = jsonDecode(response.body);
      return todosJson.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
