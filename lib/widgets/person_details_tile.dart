import 'package:flutter/material.dart';

class PersonDetailsTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String trailing;
  const PersonDetailsTile({
    super.key,
    required this.title,
    required this.imagePath,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Image.asset(imagePath),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontFamily: 'SofiaPro',
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
          ],
        ),
        trailing: Text(trailing,
            style: const TextStyle(
                fontFamily: 'SofiaPro',
                fontWeight: FontWeight.w700,
                fontSize: 20)),
      ),
    );
  }
}
