// это надо изменить, 
// это просто заглушка для демонстрации работы с несколькими участниками в проекте 
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Places'),
      ),
      body: const Center(
        child: Text('Search Screen - Participant 4'),
      ),
    );
  }
}