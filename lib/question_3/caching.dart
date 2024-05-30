// ignore_for_file: avoid_print

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:ptc_sessions/question_3/variables.dart';

class Caching {
  Map<int, Map<String, dynamic>> users = {};

  getUserById(int? id) {
    if (id == null || id < 0) return null;

    if (users.containsKey(id)) {
      print("\n\n");
      print("ALREADY THERE, LENGTH:");
      print(users.length);
      print("Description:");
      print(userDescription(users[id]!));
      return null;
    }
    Map<String, dynamic> user = {};
    user = {
      "id": id,
      "first_name": faker.person.firstName(),
      "last_name": faker.person.lastName(),
      "about": faker.lorem.words(3).join(' '),
      "image": faker.image.image(),
    };

    final newEntry = <int, Map<String, dynamic>>{id: user};
    users.addAll(newEntry);

    print("\n\n");
    print("ADDED, LENGTH:");
    print(users.length);
    print("Description:");
    print(userDescription(user));
  }

  String userDescription(Map<String, dynamic> userMap) {
    return """
    User with the id of: ${userMap['id']} his name is: ${userMap['first_name']} ${userMap['first_name']}. 
    his about is ${userMap['about']}.
    and this is his image link ${userMap['image']}
    """;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Caching caching = Caching();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: usersIds.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      caching.getUserById(usersIds[index]['id']);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(usersIds[index]['id'].toString()),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
