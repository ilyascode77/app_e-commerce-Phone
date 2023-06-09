import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

Future<void> searchInFirestore(String query, BuildContext context) async {
  try {
    // Assuming you have a "products" collection in Firestore
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: query)
        .get();

    // Process the search results
    List<DocumentSnapshot> documents = snapshot.docs;

    if (documents.isNotEmpty) {
      // Display the search results or navigate to a search results page
      // Example: Update the UI with the search results using a ListView
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Search Results'),
            content: ListView.builder(
              itemCount: documents.length,
              itemBuilder: (BuildContext context, int index) {
                // Customize the UI for each search result item
                return ListTile(
                  title: Text(documents[index]['name']),
                  subtitle: Text(documents[index]['description']),
                  // Add more UI elements as needed
                );
              },
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    } else {
      // Show a message indicating no search results found

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('No Results'),
            content: Text('No search results found.'),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }
  } catch (e) {
    print('Error searching in Firestore: $e');
  }
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();

  void _showSearchDialog() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Search'),
            content: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter your search query',
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Search'),
                onPressed: () {
                  String query = _searchController.text;
                  searchInFirestore(query, context);
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open Search Dialog'),
          onPressed: _showSearchDialog,
        ),
      ),
    );
  }
}
