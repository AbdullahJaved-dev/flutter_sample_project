import 'package:flutter/material.dart';
import 'package:flutter_sample_project/screens/NewsDetailScreen.dart';
import 'package:flutter_sample_project/screens/RatingsScreen.dart';

import 'HomeScreen.dart';

class NewsItem {
  final int id;

  NewsItem({required this.id});
}

class TodayNewsScreen extends StatefulWidget {
  const TodayNewsScreen({super.key});

  @override
  State<TodayNewsScreen> createState() => _TodayNewsScreenState();
}

class _TodayNewsScreenState extends State<TodayNewsScreen> {
  List<NewsItem> newsItems = [
    NewsItem(id: 1),
    NewsItem(id: 2),
    NewsItem(id: 3),
    NewsItem(id: 4),
    NewsItem(id: 5),
    NewsItem(id: 6),
  ];

  @override
  void initState() {
    super.initState();
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
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              const Text(
                "Today News",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: newsItems.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          const EdgeInsets.only(left: 16, bottom: 8, right: 16),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.network(
                            "https://images.unsplash.com/photo-1683009427598-9c21a169f98f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.width * 0.3,
                            fit: BoxFit.cover,
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.green,
                              height: MediaQuery.of(context).size.width * 0.3,
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "The Benefits of Live Trading in the Forex Market",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "By Admin",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        "06-20-2015 11:10:49 am",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),

                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>  const NewsDetailScreen(),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white, // Background color
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(4.0), // 16-pixel border radius
                                          ),
                                          padding:  const EdgeInsets.symmetric(horizontal: 8),
                                        ),
                                        child:  Text("Read More".toUpperCase(),
                                            style:  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
