import 'package:flutter/material.dart';

class BannersListTile extends StatelessWidget {
  final String imageUrl;
  const BannersListTile({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.26,
      width: size.width * 0.92,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          SizedBox(
            height: size.height * 0.26,
            width: size.width * 0.92,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.14,
            left: size.width * 0.03,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(255, 103, 79, 70),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0).copyWith(
                  left: 9,
                  right: 9,
                ),
                child: const Text(
                  '30% OFF',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.1,
            left: size.width * 0.03,
            child: const Text(
              'Today\'s Special',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.04,
            left: size.width * 0.03,
            child: const Text(
              'Get a discount for every service order!\nOnly valid for today!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
