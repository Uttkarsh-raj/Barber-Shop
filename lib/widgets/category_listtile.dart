import 'package:flutter/material.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.21,
      width: size.width * 0.39,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: size.height * 0.15,
              width: size.width * 0.29,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[100],
              ),
              child: Center(
                child: Image.asset('assets/icons/scissors.png'),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Hair Cut',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16,
                letterSpacing: 0.02,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
