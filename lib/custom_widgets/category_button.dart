import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  final String title;
  final bool isSelected;

  CategoryButton({
    Key? key,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<CategoryButton> createState() => _CategoryButtonState(); 
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
                 setState(() {
         });
      },
      child: Text(
        widget.title,
        style: TextStyle(
          color: ((widget.isSelected) ? Colors.white : Colors.black),
        ),
      ),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(
            ((widget.isSelected) ? Colors.blue : Colors.grey[300])),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
