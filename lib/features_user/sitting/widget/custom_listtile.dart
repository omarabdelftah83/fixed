import 'package:flutter/material.dart';

class CustomListtile extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isLogout;
  final Function onTap;

  const CustomListtile({
    super.key,
    required this.text,
    required this.icon,
    this.isLogout = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.white,
      shadowColor: Colors.black,
      child: Container(
        height: 63,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListTile(
          title: Text(text, textAlign: TextAlign.right,style: TextStyle(color: Colors.grey),),
          trailing: Icon(
            icon,
            color: isLogout ? Colors.red : Colors.blue,
          ),
          onTap: () => onTap(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
