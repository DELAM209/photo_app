import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final bool selected;
  final VoidCallback tapListener;

  const CategoryItem(
      {super.key,
      required this.name,
      required this.selected,
      required this.tapListener});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: (selected)
              ? MaterialStateProperty.all(Color.fromARGB(255, 80, 80, 120))
              : null,
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          ),
        ),
        onPressed: tapListener,
        child: Text(
          name,
          style: (selected)
              ? TextStyle(color: Colors.white)
              : TextStyle(color: Color.fromARGB(255, 80, 80, 120)),
        ),
      ),
    );
  }
}
