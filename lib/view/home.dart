import 'package:flutter/material.dart';
import 'package:hair_salon/view/categories.dart';
import 'package:hair_salon/widgets/category_listtile.dart';
import 'package:hair_salon/widgets/featured_listitle.dart';
import 'package:hair_salon/widgets/most_pop_listtile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> icons = [
    'assets/icons/scissors.png',
    'assets/icons/makeup_icon.png',
    'assets/icons/hair_str_icon.png',
    'assets/icons/mani_icon.png',
    'assets/icons/spa_icon.png',
    'assets/icons/b_trim_icon.png',
  ];
  final List<String> title = [
    'Hair Cut',
    'Makeup',
    'Straightening',
    'Mani-Pedi',
    'Spa/Massage',
    'Beard Trimming',
  ];
  final List<String> services = [
    'All',
    'Hair Cut',
    'Makeup',
    'Straightening',
    'Mani-Pedi',
    'Spa/Massage',
    'Beard Trimming',
  ];
  final List<bool> values = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  final List<String> name = [
    "Tanishx Unisex Salon",
    "Royal Touch Salon",
    "Hair Direction Salon"
  ];
  final List<String> loc = [
    "Jankpuri, New Delhi",
    "Tilak Nagar, New Delhi",
    "Tilak Nagar, New Delhi",
  ];
  final List<String> image = [
    "assets/images/barber1.jpeg",
    "assets/images/barber4.jpeg",
    "assets/images/barber3.jpg"
  ];
  final List<String> dist = ["1.2km", "800m", "900m"];
  final List<String> reviews = ["256", "154", "156"];
  final List<String> stars = ["4.8", "4.5", "4.6"];
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Category',
                      style: TextStyle(
                        // color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 0.02,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CategoriesPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          color: Color.fromARGB(255, 44, 127, 195),
                          fontSize: 16,
                          letterSpacing: 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) => CategoryListTile(
                    icon: icons[index],
                    title: title[index],
                  ),
                  itemCount: 6,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                ),
                SizedBox(height: size.height * 0.02),
                const Text(
                  'Most Popular Services',
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 0.02,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                SizedBox(
                  height: size.height * 0.062,
                  width: size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                for (var i = 0; i < values.length; i++) {
                                  if (i == index) {
                                    values[i] = true;
                                  } else {
                                    values[i] = false;
                                  }
                                }
                              },
                            );
                          },
                          child: Container(
                            // width: size.width * 0.25,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: values[index]
                                  ? const Color.fromARGB(255, 10, 53, 87)
                                  : const Color.fromARGB(255, 198, 229, 255),
                              borderRadius: BorderRadius.circular(27),
                            ),
                            child: Center(
                              child: Text(
                                services[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: values[index]
                                      ? Colors.white
                                      : Colors.blueGrey[900],
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => MostPopListTile(
                    image: image[index],
                    name: name[index],
                    loc: loc[index],
                    dist: dist[index],
                    stars: stars[index],
                    reviews: reviews[index],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  itemCount: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
