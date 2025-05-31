import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'component/note_card.dart';
import 'package:noteflow/model/note.dart';
import 'package:noteflow/controller/note_service.dart';
import 'package:noteflow/view/input_page.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  NoteService noteService = NoteService();


  // 新增控制器來處理輸入
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void addNote(String title, String content)
  {
      setState(()
      {
        noteService.notes.add(Note(
          title: title.isEmpty ? '無標題' : title,
          description: content.isEmpty ? '無內容' : content,
        ));
      });
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
            onPressed: () async
            {
              final result = await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const InputPage()));

              setState(()
              {
                if(result != null )
                {
                  addNote(result[0], result[1]);
                }
              });
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