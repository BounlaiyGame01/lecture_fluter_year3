import 'package:flutter/material.dart';

class Bookpage extends StatefulWidget {
  const Bookpage({super.key});

  @override
  State<Bookpage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Bookpage> {
  // Sample data for demonstration
  final List<Map<String, dynamic>> books = [
    {'number': 11, 'title': 'MySQL Basics', 'subtitle': '150,000 ກີບ | 200 ໜ້າ'},
    {'number': 12, 'title': 'Node.js Basic', 'subtitle': '200,000 ກີບ | 350 ໜ້າ'},
    {'number': 15, 'title': 'C# Advance', 'subtitle': '100,000 ກີບ | 200 ໜ້າ'},
    {'number': 16, 'title': 'Python Basic', 'subtitle': '250,000 ກີບ | 350 ໜ້າ'},
    {'number': 17, 'title': 'Flutter', 'subtitle': '300,000 ກີບ | 200 ໜ້າ'},
    {'number': 18, 'title': 'Network & Server', 'subtitle': '250,000 ກີບ | 350 ໜ້າ'},
  ];

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ຈັດການຂໍ້ມູນປື້ມ'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'ຄົ້ນຫາປື້ມ...',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 28,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(bottom: 80),
        itemCount: books
            .where(
              (book) =>
                  book['title'].toLowerCase().contains(
                    searchText.toLowerCase(),
                  ) ||
                  book['subtitle'].toLowerCase().contains(
                    searchText.toLowerCase(),
                  ),
            )
            .length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final filteredBooks = books
              .where(
                (book) =>
                    book['title'].toLowerCase().contains(
                      searchText.toLowerCase(),
                    ) ||
                    book['subtitle'].toLowerCase().contains(
                      searchText.toLowerCase(),
                    ),
              )
              .toList();
          final book = filteredBooks[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 27, 50, 252),
              child: Text(
                book['number'].toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              book['title'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(book['subtitle']),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Implement delete logic here
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement add logic here
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}
