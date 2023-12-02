import 'package:flutter/material.dart';

class FeaturedListTile extends StatefulWidget {
  const FeaturedListTile(
      {super.key,
      required this.name,
      required this.oPrice,
      required this.nPrice,
      required this.image});
  final String name, oPrice, nPrice, image;

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
              child: Image.network(
                widget.image,
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
              child: Padding(
                padding: EdgeInsets.all(size.height * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        // color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 0.02,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Rs ${widget.nPrice}',
                          style: const TextStyle(
                            // color: Colors.white,
                            fontSize: 15,
                            letterSpacing: 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Rs ${widget.nPrice}',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontSize: 13,
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
