import 'package:flutter/material.dart';
import 'package:loginnotebad/screens/login_screen.dart';
import 'package:loginnotebad/screens/edit_screen.dart';
import 'package:loginnotebad/shared_preference_helper.dart';
import '../database/notes_database.dart';
import '../models/note_model.dart';
import '../widgets/custom_notecard.dart';

class NotesHome extends StatefulWidget {
  const NotesHome({super.key});

  @override
  State<NotesHome> createState() => _NotesHomeState();
}

class _NotesHomeState extends State<NotesHome> {
  List<NoteModel> notes = [];
  String username = '';

  @override
  void initState() {
    super.initState();
    loadUsername();
    loadNotes();
  }

  Future loadUsername() async {
    final name = await SharedPrefHelper.getUsername();
    setState(() {
      username = name ?? '';
    });
  }

  Future loadNotes() async {
    notes = await NotesDatabase.instance.readAllNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ListTile(
                title: Text('Hello $username',
                    style: const TextStyle(fontSize: 18)),
                subtitle: const Text('Your Notes -',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              // Search + Add Button
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Notes',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const EditScreen()),
                      );
                      if (result == true) {
                        await loadNotes();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Icon(Icons.add, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // Notes Grid
              Expanded(
                child: GridView.builder(
                  itemCount: notes.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    return InkWell(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => EditScreen(note: note)),
                        );
                        if (result == true) {
                          await loadNotes();
                        }
                      },
                      child: NoteCard(
                        date: note.date,
                        title: note.title,
                        items: note.items.split(','),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
