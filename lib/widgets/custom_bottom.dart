import 'package:flutter/material.dart';
import 'package:notes_app/widgets/consts.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, this.ontap});
 final void Function()? ontap;
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: keycolorapp,
        ),
        height: 55,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            'Add',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
