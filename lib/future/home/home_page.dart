import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> projectNames = [
    'Ollaaaaaaaa',
    'Pasholeeee',
    'Qondayeeeee',
    'Makkami',
    'Ollaaaaaaaa',
    'Pasholeeee',
    'Qondayeeeee',
    'Makkami',
    'Ollaaaaaaaa',
    'Pasholeeee',
    'Qondayeeeee',
    'Makkami',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recent projects',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 64),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: List.generate(projectNames.length, (index) {
                    return index == 0
                        ? Container(
                            padding: const EdgeInsets.symmetric(vertical: 50),
                            width: 200,
                            height: 200,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              color: Color(0xFF071337),
                            ),
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Create a project',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          )
                        : Container(
                            width: 200,
                            height: 200,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              color: Color(0xFF071337),
                            ),
                            child: Center(
                              child: Text(
                                projectNames[index - 1],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
