import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
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
        padding: EdgeInsets.only(
          top: 10,
          right: 16,
          left: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
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
              SizedBox(height: 30),
              ColorListView(),
              SizedBox(height: 30),
              BlocBuilder<AddNoteCubit, AddNotesState>(
                builder: (context, state) {
                  return CustomBottom(
                    isloading: state is AddNoteloading ? true : false,

                    ontap: () {
                      if (formkey.currentState!.validate()) {
                        // for turn play check manual
                        formkey.currentState!.save();

                        var notemodel = NoteModel(
                          title: title!,
                          subtitle: subtitle!,
                          color: Colors.blue.toARGB32(),
                          date: DateTime.now().toString().substring(0, 9),
                        );

                        BlocProvider.of<AddNoteCubit>(
                          context,
                        ).addNote(notemodel);
                        BlocProvider.of<NotesCubit>(context).featshAllNotes();
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorCircl extends StatelessWidget {
  const ColorCircl({super.key, required this.isselect, required this.color});
  final bool isselect;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isselect
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 38,
            child: CircleAvatar(backgroundColor: color, radius: 35),
          )
        : CircleAvatar(backgroundColor: color, radius: 38);
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int cindex = 0;
  List<Color> colors = [
    Color(0xFF16A085),
    Color(0xFFEF476F),
    Color(0xFFB48EAD),
    Color(0xFF88C0D0),
    Color(0xFFA3BE8C),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                cindex = index;
                setState(() {});
              },
              child: ColorCircl(
                isselect: cindex == index,
                color: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
