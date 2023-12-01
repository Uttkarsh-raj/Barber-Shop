import 'package:flutter/material.dart';

class MostPopListTile extends StatefulWidget {
  final String name, loc, dist, stars, reviews, image;
  const MostPopListTile(
      {super.key,
      required this.name,
      required this.loc,
      required this.dist,
      required this.stars,
      required this.reviews,
      required this.image});

  @override
  State<MostPopListTile> createState() => _MostPopListTileState();
}

class _MostPopListTileState extends State<MostPopListTile> {
  bool marked = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[100],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SizedBox(
              height: size.height * 0.16,
              width: size.width * 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            SizedBox(
              height: size.height * 0.14,
              width: size.width * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 16,
                          letterSpacing: 0.02,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.loc,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          letterSpacing: 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Color.fromARGB(255, 10, 53, 87),
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            widget.dist,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              letterSpacing: 0.02,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${widget.stars}  |  ${widget.reviews} Reviews',
                            style: const TextStyle(
                              color: Color.fromRGBO(110, 110, 110, 1),
                              fontSize: 14,
                              letterSpacing: 0.02,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          marked = !marked;
                        });
                      },
                      child: (!marked)
                          ? const Icon(
                              Icons.bookmark_outline,
                              size: 30,
                            )
                          : Icon(
                              Icons.bookmark,
                              size: 30,
                              color: Colors.red[600],
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
