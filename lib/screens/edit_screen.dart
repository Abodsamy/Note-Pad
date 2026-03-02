import 'package:flutter/material.dart';
import '../database/notes_database.dart';
import '../models/note_model.dart';

class EditScreen extends StatefulWidget {
  final NoteModel? note;
  const EditScreen({super.key, this.note});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final titleController = TextEditingController();
  final itemsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      itemsController.text = widget.note!.items;
    }
  }

  Future saveNote() async {
    final newNote = NoteModel(
      id: widget.note?.id,
      title: titleController.text.isEmpty ? "Title" : titleController.text,
      date: DateTime.now().toString().substring(0, 10),
      items: itemsController.text.isEmpty ? "Item1,Item2" : itemsController.text,
    );

    if (widget.note == null) {
      await NotesDatabase.instance.create(newNote);
    } else {
      await NotesDatabase.instance.update(newNote);
    }

    Navigator.pop(context, true);
  }

  Future deleteNote() async {
    if (widget.note != null) {
      await NotesDatabase.instance.delete(widget.note!.id!);
    }
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? "Add Note" : "Edit Note"),
        actions: [
          if (widget.note != null)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: deleteNote,
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: itemsController,
              decoration: const InputDecoration(
                  labelText: "Items (comma separated: apple,banana)"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: saveNote,
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}