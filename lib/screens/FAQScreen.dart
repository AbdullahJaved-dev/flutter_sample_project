import 'package:flutter/material.dart';

class FAQItem {
  int? id;
  final String title;
  final String desc;
  bool isExpanded;

  FAQItem({
    this.id,
    required this.title,
    required this.desc,
    required this.isExpanded,
  });
}

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  List<FAQItem> textVisibility = [];

  void createFaqList() {
    List<FAQItem> items = [];
    for (int i = 0; i < 20; i++) {
      items.add(
        FAQItem(
            title: "What is PriceActionlive.com?",
            desc:
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
            isExpanded: false),
      );
    }

    setState(() {
      textVisibility.addAll(items);
    });
  }

  @override
  void initState() {
    createFaqList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.blue,
              ),
            );
          }),
          title: const Text(
            "FAQs",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: const Color(0xFFe8c65b),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*const SizedBox(height: 16),
              const Text(
                "FAQ's",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),*/
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: textVisibility.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                 textVisibility[index].title,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                height: 24,
                                width: 24,
                                margin: const EdgeInsets.only(left: 8),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      textVisibility[index].isExpanded =
                                          !textVisibility[index].isExpanded;
                                    });
                                  },
                                  icon: Icon(
                                    textVisibility[index].isExpanded
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  padding: const EdgeInsets.all(0),
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                            visible: textVisibility[index].isExpanded,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(top: 8),
                              child: Text(
                                textVisibility[index].desc,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
