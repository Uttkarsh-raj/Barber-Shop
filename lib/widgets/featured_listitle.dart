import 'package:flutter/material.dart';

class FeaturedListTile extends StatefulWidget {
  const FeaturedListTile({super.key});

  @override
  State<FeaturedListTile> createState() => _FeaturedListTileState();
}

class _FeaturedListTileState extends State<FeaturedListTile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.21,
      width: size.width * 0.39,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(211, 181, 177, 177),
              offset: Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 0.001,
            )
          ]),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Image.asset(
                'assets/images/beard trimming.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              // height: size.height * 0.08,
              width: size.width * 0.39,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.all(13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Featured Services',
                      style: TextStyle(
                        // color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 0.02,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Rs 200',
                          style: TextStyle(
                            // color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Rs 300',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontSize: 14,
                            letterSpacing: 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
