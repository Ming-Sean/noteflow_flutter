import 'package:flutter/material.dart';
import 'package:noteflow/view/constant.dart';
import 'package:noteflow/model/note.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class NoteCard extends StatelessWidget {
  NoteCard({
    super.key,
    required this.note,
    required this.removeNote,
  });

  final Note note;
  final DateTime date = DateTime.now();
  final VoidCallback removeNote;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  note.title,
                  style: kTitleStyle,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
              IconButton(
                onPressed: removeNote,
                icon: FaIcon(
                  FontAwesomeIcons.trash,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
          Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 16,   // 左邊空格
              endIndent: 16 // 右邊空格
          ),
          Text(
            note.description,
            style: kDescriptionStyle,
          )
        ],
      ),
    );
  }
}