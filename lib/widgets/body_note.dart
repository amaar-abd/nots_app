import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/list_view_note.dart';


class BodyNote extends StatelessWidget {
 const BodyNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppbar(text: 'Notes', icon: Icons.search),
          
          Expanded(child: ListViewNote()),
        ],
      ),
    );
  }
}
