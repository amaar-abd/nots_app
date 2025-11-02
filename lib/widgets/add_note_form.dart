import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_bottom.dart';
import 'package:notes_app/widgets/custom_textfield.dart';

class FormAddNote extends StatefulWidget {
  const FormAddNote({super.key});

  @override
  State<FormAddNote> createState() => _FormAddNoteState();
}

class _FormAddNoteState extends State<FormAddNote> {
  GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Form(
          key: formkey,
          autovalidateMode: autovalidateMode,

          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Title',
                onSaved: (value) {
                  title = value;
                },
              ),
              SizedBox(height: 30),
              CustomTextFormField(
                hintText: 'discreption',
                maxLines: 5,
                onSaved: (value) {
                  subtitle = value;
                },
              ),
              SizedBox(height: 50),

              BlocBuilder<AddNoteCubit, NotesState>(
                builder: (context, state) {
                  return CustomBottom(
                    isloading: state is Noteloading ? true:false,
                    ontap: () {
                      if (formkey.currentState!.validate()) {
                        // for turn play check manual

                        formkey.currentState!.save();
                        var notemodel = NoteModel(
                          title: title!,
                          subtitle: subtitle!,
                          color: Colors.blue.toARGB32(),
                          date: DateTime.now().toString(),
                        );
                        BlocProvider.of<AddNoteCubit>(
                          context,
                        ).addNote(notemodel);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
