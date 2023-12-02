import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon/model/featured.dart';
import 'package:hair_salon/model/shop.dart';
import 'package:hair_salon/view/categories.dart';
import 'package:hair_salon/view/check_auth.dart';
import 'package:hair_salon/widgets/banners_listile.dart';
import 'package:hair_salon/widgets/category_listtile.dart';
import 'package:hair_salon/widgets/featured_listitle.dart';
import 'package:hair_salon/widgets/most_pop_listtile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> banners = [];
  List<Featured> featured = [];
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
  final List<Shop> shops = [];
  bool loading = true;
  bool floading = true;

  void getStorageData() async {
    setState(() {
      loading = true;
    });
    String folderPath = "banners";
    List<String> downloadURLs = await listFilesInFolder(folderPath);
    banners = downloadURLs;

    if (downloadURLs.isNotEmpty) {
      // for (String url in downloadURLs) {
      //   print("Download URL: $url");
      //   // Use the downloadURLs as needed (e.g., display images in Flutter)
      // }
    } else {
      print("No files found in the folder.");
      // Handle the case where no files are found
    }
    setState(() {
      loading = false;
    });
  }

  Future<List<String>> listFilesInFolder(String folderPath) async {
    Reference ref =
        FirebaseStorage.instanceFor(bucket: "gs://hair-salon-c9251.appspot.com")
            .ref()
            .child(folderPath);

    try {
      ListResult result = await ref.listAll();
      List<String> downloadURLs = [];

      for (Reference item in result.items) {
        String downloadURL = await item.getDownloadURL();
        downloadURLs.add(downloadURL);
      }

      return downloadURLs;
    } catch (e) {
      print("Error listing files: $e");
      return []; // Handle the error
    }
  }

  void getShopData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('shops');
    var res = await users.get();
    res.docs.forEach(
      (element) async {
        var shop = await users.doc(element.id).get();
        var data = shop.data() as Map<String, dynamic>;
        if (data.isNotEmpty) {
          shops.add(
            Shop(
              name: data['name'],
              email: data['email'],
              location: data['location'],
              distance: data['distance'],
              stars: data['stars'],
              reviews: data['reviews'],
              imageUrl: data['imageUrl'],
            ),
          );
        }
      },
    );
  }

  void getFeaturedData() async {
    setState(() {
      floading = true;
    });
    CollectionReference users =
        FirebaseFirestore.instance.collection('featured');
    var res = await users.get();
    res.docs.forEach(
      (element) async {
        var shop = await users.doc(element.id).get();
        var data = shop.data() as Map<String, dynamic>;
        if (data.isNotEmpty) {
          featured.add(
            Featured(
              name: data['name'],
              oPrice: data['oldPrice'],
              nPrice: data['newPrice'],
              imageUrl: data['imageUrl'],
            ),
          );
        }
      },
    );
    setState(() {
      floading = false;
    });
  }

  @override
  void initState() {
    getStorageData();
    getShopData();
    getFeaturedData();
    super.initState();
  }

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
                (!loading)
                    ? SizedBox(
                        height: size.height * 0.23,
                        child: Swiper(
                          itemCount: banners.length,
                          autoplay: true,
                          itemBuilder: (context, index) {
                            return BannersListTile(
                              imageUrl: banners[index],
                            );
                          },
                          pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                              activeColor: Colors.grey,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    // SizedBox(
                    //     height: size.height * 0.23,
                    //     child: ListView.separated(
                    //       itemBuilder: (context, index) => Padding(
                    //         padding: const EdgeInsets.all(3.0),
                    //         child: BannersListTile(
                    //           imageUrl: banners[index],
                    //         ),
                    //       ),
                    //       separatorBuilder: (context, index) =>
                    //           const SizedBox(width: 10),
                    //       itemCount: banners.length,
                    //       shrinkWrap: true,
                    //       scrollDirection: Axis.horizontal,
                    //     ),
                    //   )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
                // BannersListTile(
                //   imageUrl: banners[0],
                // ),
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
                (!floading)
                    ? SizedBox(
                        height: size.height * 0.23,
                        child: ListView.separated(
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: FeaturedListTile(
                              name: featured[index].name,
                              oPrice: featured[index].oPrice,
                              nPrice: featured[index].nPrice,
                              image: featured[index].imageUrl,
                            ),
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 10),
                          itemCount: featured.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
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
                    image: shops[index].imageUrl,
                    name: shops[index].name,
                    loc: shops[index].location,
                    dist: shops[index].distance,
                    stars: shops[index].stars,
                    reviews: shops[index].reviews,
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  itemCount: shops.length,
                ),
                SizedBox(height: size.height * 0.02),
                GestureDetector(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const MainAuthPage()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 28, 62, 101),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'LOG OUT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
