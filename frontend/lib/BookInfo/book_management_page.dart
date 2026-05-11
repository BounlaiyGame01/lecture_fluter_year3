// ======================================================
// FILE: book_management_page.dart
// RENAMED FROM: BookPage.dart
// PURPOSE: Displays a searchable list of books with
//          title, price, and page count. Supports
//          delete (UI only) and add (UI only) actions.
// ======================================================

import 'package:flutter/material.dart';

class Bookpage extends StatefulWidget {
  const Bookpage({super.key});

  @override
  State<Bookpage> createState() => _BookpageState();
}

class _BookpageState extends State<Bookpage> {
  // ── Sample book data (replace with real API/DB data later) ──
  final List<Map<String, dynamic>> books = [
    {'number': 11, 'title': 'MySQL Basics',      'subtitle': '150,000 ກີບ | 200 ໜ້າ'},
    {'number': 12, 'title': 'Node.js Basic',     'subtitle': '200,000 ກີບ | 350 ໜ້າ'},
    {'number': 15, 'title': 'C# Advance',        'subtitle': '100,000 ກີບ | 200 ໜ້າ'},
    {'number': 16, 'title': 'Python Basic',      'subtitle': '250,000 ກີບ | 350 ໜ້າ'},
    {'number': 17, 'title': 'Flutter',           'subtitle': '300,000 ກີບ | 200 ໜ້າ'},
    {'number': 18, 'title': 'Network & Server',  'subtitle': '250,000 ກີບ | 350 ໜ້າ'},
  ];

  // Holds the current text in the search field
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    // Filter books whose title OR subtitle contains the search text
    final filteredBooks = books.where((book) {
      final query = searchText.toLowerCase();
      return book['title'].toLowerCase().contains(query) ||
             book['subtitle'].toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      // ── AppBar with search field ───────────────────────
      appBar: AppBar(
        title: const Text('ຈັດການຂໍ້ມູນປື້ມ'), // "Book Data Management"
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
                // Rebuild the list every time the user types
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'ຄົ້ນຫາປື້ມ...', // "Search books..."
                prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 28),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
        ),
      ),

      // ── Scrollable book list ───────────────────────────
      body: ListView.separated(
        padding: const EdgeInsets.only(bottom: 80), // space above FAB
        itemCount: filteredBooks.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final book = filteredBooks[index];
          return ListTile(
            // Circle with the book's number on the left
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 27, 50, 252),
              child: Text(
                book['number'].toString(),
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              book['title'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(book['subtitle']), // price | page count
            // Delete button on the right
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // TODO: remove book from list / database
              },
            ),
          );
        },
      ),

      // ── Floating action button to add a new book ───────
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: open a dialog or form to add a new book
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}
