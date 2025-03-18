import "package:ex3/note.dart";
import "package:ex3/note_widget.dart";
import 'package:ex3/note_form.dart';
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final notes = <Note>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: NoteWidget(
                notes: notes,
                deleteNote: (note) => setState(() => notes.remove(note)),
              ),
            ),
            Flexible(child: NoteForm((p0) => setState(() => notes.add(p0)))),
          ],
        ),
      ),
    );
  }
}
