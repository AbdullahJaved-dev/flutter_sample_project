import 'package:flutter/material.dart';
import 'package:flutter_sample_project/screens/RatingsScreen.dart';

class GridItems {
  final String name;
  final String image;

  GridItems({required this.name, required this.image});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<GridItems> gridItems = [];

  List<GridItems> createGridItemsList() {
    List<GridItems> items = [];
    items.add(GridItems(name: 'DIR-Copy Trade Service', image: 'image1.jpg'));
    items.add(GridItems(name: 'Become a pro trader', image: 'image2.jpg'));
    items.add(GridItems(name: 'I.D Trading Signals', image: 'image3.jpg'));
    items.add(GridItems(name: 'Live trade with us', image: 'image4.jpg'));
    items.add(GridItems(name: 'Performance', image: 'image5.jpg'));
    items.add(GridItems(name: 'How much earn', image: 'image6.jpg'));
    return items;
  }

  @override
  void initState() {
    super.initState();
    gridItems.addAll(createGridItemsList());
  }

  void onGridItemClick(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RatingsScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFe8c65b),
        body: Center(
            child: GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: gridItems.length,
          itemBuilder: (context, index) {
            bool isRightEdge = (index) % 2 == 0;
            bool isBottomEdge = index < 4;
            return InkWell(
              onTap: () {
                onGridItemClick(index);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border(
                    right: isRightEdge
                        ? const BorderSide(color: Colors.black26, width: 2.0)
                        : BorderSide.none,
                    bottom: isBottomEdge
                        ? const BorderSide(color: Colors.black26, width: 2.0)
                        : BorderSide.none,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.width / 5,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.blue,
                            width: 1.0,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "images/splash.jpg",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        gridItems[index].name,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}
