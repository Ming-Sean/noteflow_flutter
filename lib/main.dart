import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'component/note_card.dart';
import 'package:noteflow/model/note.dart';
import 'package:noteflow/controller/note_service.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget{
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  NoteService noteService = NoteService();


  // 新增控制器來處理輸入
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void addNote() {
    if (titleController.text.isNotEmpty || contentController.text.isNotEmpty) {
      setState(() {
        noteService.notes.add(Note(
          title: titleController.text.isEmpty ? '無標題' : titleController.text,
          description: contentController.text.isEmpty ? '無內容' : contentController.text,
        ));
      });
      // 清空輸入框
      titleController.clear();
      contentController.clear();
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  backgroundColor: Colors.white,
                  title: TextField(
                    controller: titleController, // 新增控制器
                    decoration: InputDecoration(
                      hintText: '輸入標題',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  content: TextField(
                    controller: contentController, // 新增控制器
                    decoration: InputDecoration(
                      hintText: '輸入內容',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.black),
                    maxLines: 3, // 允許多行輸入
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('關閉', style: TextStyle(color: Colors.grey)),
                    ),
                    TextButton( // 新增儲存按鈕
                      onPressed: () {
                        addNote();
                        Navigator.pop(context);
                      },
                      child: Text('儲存', style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
              );
            },
            child: Icon(Icons.add),
          ),

        appBar: AppBar(
          title: Text(
              'Note Flow',
              style: GoogleFonts.rubik(
                fontSize: 30,
              )
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: noteService.notes.length,
            itemBuilder: (context, index) {
              return NoteCard(
                note: noteService.notes[index],
                removeNote: (){
                  setState(() {
                    noteService.notes.removeAt(index);
                  });
                }
              );
            }
        )
      );
  }
}