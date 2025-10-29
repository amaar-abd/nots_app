import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(left: 12, top: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.brown[600],
      ),

      child: Column(
        children: [
          ListTile(
            title: Text(
              'Flutter Tips',
              style: TextStyle(fontSize: 26, color: Colors.black, height: 2.5),
            ),
            subtitle: Text(
              'Build your with amaar abd al rahman',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black.withValues(alpha: .4),
              ),
            ),
            trailing: Icon(
              Icons.delete_outline_outlined,
              color: Colors.black,
              size: 35,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: Text(
                  '10.28.2025',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withValues(alpha: .4),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
