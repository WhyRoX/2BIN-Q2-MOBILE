import 'package:ex3/note.dart';
import 'package:flutter/material.dart';

class NoteForm extends StatefulWidget {
  final void Function(Note) addNote;

  const NoteForm(this.addNote, {super.key});

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final controllerTitle = TextEditingController();
  final controllerCont = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    controllerCont.dispose();
    controllerTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormField(
            controller: controllerTitle,
            decoration: const InputDecoration(labelText: "Note title"),
            validator:
                (value) =>
                    (value == null || value.isEmpty)
                        ? "Title can't be empty"
                        : null,
          ),
          TextFormField(
            maxLines: 4,
            minLines: 1,
            controller: controllerCont,
            decoration: const InputDecoration(labelText: "Note content"),
            validator:
                (value) =>
                    (value == null || value.isEmpty)
                        ? "Content can't be empty"
                        : null,
          ),
          const SizedBox(width: 20.0),
          ElevatedButton(
            child: const Text("add note"),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                widget.addNote(
                  Note(
                    title: controllerTitle.text,
                    content: controllerCont.text,
                  ),
                );
                controllerTitle.text = "";
                controllerCont.text = "";
              }
            },
          ),
        ],
      ),
    );
  }
}
