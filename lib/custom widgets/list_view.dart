import 'package:flutter/material.dart';

class ListViews extends StatelessWidget {
  const ListViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: const Icon(
          Icons.check_box,
          color: Color.fromARGB(255, 50, 26, 205),
        ),
        title: const Text(
          "Check Mail",
          style: TextStyle(
              color: Color(0xFF3a3a3a), decoration: TextDecoration.lineThrough),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          margin: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 190, 44, 33),
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            icon: Icon(Icons.delete),
            color: Colors.white,
            iconSize: 18,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
