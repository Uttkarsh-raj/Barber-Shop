import 'package:flutter/material.dart';
import 'package:hair_salon/widgets/category_listtile.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final List<String> icons = [
    'assets/icons/scissors.png',
    'assets/icons/makeup_icon.png',
    'assets/icons/hair_str_icon.png',
    'assets/icons/mani_icon.png',
    'assets/icons/spa_icon.png',
    'assets/icons/b_trim_icon.png',
    'assets/icons/hair_color_icon.png',
    'assets/icons/wax_icon.png',
    'assets/icons/facial_icon.png'
  ];
  final List<String> title = [
    'Hair Cut',
    'Makeup',
    'Straightening',
    'Mani-Pedi',
    'Spa/Massage',
    'Beard Trimming',
    'Hair Coloring',
    'Waxing',
    'Facial',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Category',
          style: TextStyle(
            // color: Colors.white,
            fontSize: 22,
            letterSpacing: 0.02,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
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
            itemCount: title.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
        ),
      ),
    );
  }
}
