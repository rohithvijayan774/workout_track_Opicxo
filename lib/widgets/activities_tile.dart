import 'package:flutter/material.dart';

class ActivitiesTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String trailing;
  const ActivitiesTile({
    super.key,
    required this.title,
    required this.imagePath,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
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
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ],
        ),
        trailing: Text(trailing,
            style: const TextStyle(
                fontFamily: 'SofiaPro',
                fontWeight: FontWeight.w500,
                fontSize: 20)),
      ),
    );
  }
}
