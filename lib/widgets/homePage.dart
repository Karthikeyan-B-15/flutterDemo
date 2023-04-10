import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/defaultPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> lessons = [
    'API',
    'Images',
    'Movies',
    'Lesson 4',
    'Lesson 5',
    'Lesson 6',
    'Lesson 7',
    'Lesson 8',
    'Lesson 9',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Flutter Demo')),
        body: GridView.builder(
          itemCount: lessons.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DefaultPage(data: lessons[index])));
              },
              child: Center(
                child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFCBE3F7)),
                    child: Center(child: Text(lessons[index]))),
              ),
            );
          },
        ));
  }
}
