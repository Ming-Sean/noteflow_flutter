import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text("Add Note"),
      ),
      body: Padding
      (
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children:
              [
                TextField
                (
                  controller: titleController,
                  style: const TextStyle
                  (
                    color: Colors.black,
                    fontSize: 35,
                  ),
                  maxLines: 1,
                  decoration: const InputDecoration
                  (
                    hintText: 'Title...',
                    hintStyle: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                TextField(
                  controller: contentController,
                  style: const TextStyle
                  (
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                    maxLines: 30,
                    decoration: const InputDecoration(
                    hintText: 'Content...',
                    hintStyle: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton
      (
        onPressed: () {
          Navigator.pop(context,[titleController.text, contentController.text]);
        },
        icon: const Icon
        (
          Icons.save,
          size: 40,
        ),
      ),
    );
  }
}
