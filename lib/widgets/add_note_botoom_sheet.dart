import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_bottom.dart';
import 'package:notes_app/widgets/custom_textfield.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(child: FormAddNoteBottomShet()),
      ),
    );
  }
}

class FormAddNoteBottomShet extends StatefulWidget {
 const FormAddNoteBottomShet({super.key});

  @override
  State<FormAddNoteBottomShet> createState() => _FormAddNoteBottomShetState();
}

class _FormAddNoteBottomShetState extends State<FormAddNoteBottomShet> {
  GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
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

          CustomBottom(
            ontap: () {
              if (formkey.currentState!.validate()) {
                // for turn play check manual
                formkey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {
                  
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
