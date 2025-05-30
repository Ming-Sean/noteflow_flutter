
import '../model/note.dart';

class NoteService {
  final List<Note> _notes =[
    Note(title: '📌 Regularization Techniques in Deep Learning', description: 'Brief overview of L1, L2, and dropout to prevent overfitting.'),
    Note(title: '🧠 Difference Between Memory and Registers', description: 'Registers are faster and smaller; memory stores larger data.'),
    Note(title: '🔍 Common Git Errors and Fixes', description: 'Covers merge conflicts, detached HEAD, and push issues.'),
    Note(title: '🎯 Implementing Animations in Flutter', description: 'Simple guide to use AnimatedContainer and Tween.'),
    Note(title: '🛠️ Writing a Simple Web Scraper with Python', description: 'Uses requests and BeautifulSoup to extract web data.')
  ];

  void removeNote({required int index}) {
    _notes.removeAt(index);
  }

  List<Note> get notes => _notes;
}