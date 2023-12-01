import 'package:flutter/material.dart';
import 'package:hair_salon/widgets/category_listtile.dart';
import 'package:hair_salon/widgets/featured_listitle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0).copyWith(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/profile.jpg'),
                          radius: 25,
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good Morning',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Sushman Shukla',
                              style: TextStyle(
                                // color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.notifications_outlined,
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.bookmark_outline,
                          size: 30,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  height: size.height * 0.06,
                  width: size.width * 0.93,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[100],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/getting_haircut.jpg',
                          fit: BoxFit.contain,
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
                ),
                SizedBox(height: size.height * 0.02),
                const Text(
                  'Featured Services',
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 0.02,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),
                // FeaturedListTile(),
                SizedBox(
                  height: size.height * 0.23,
                  child: ListView.separated(
                    itemBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: FeaturedListTile(),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                        // color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 0.02,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Color.fromARGB(255, 44, 127, 195),
                        fontSize: 16,
                        letterSpacing: 0.02,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                CategoryListTile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
