import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_sample_project/screens/ContactUsScreen.dart';

class RatingsData {
  final String name;
  final double rating;
  final String ratingDescription;

  RatingsData(
      {required this.name,
      required this.rating,
      required this.ratingDescription});
}

class RatingsScreen extends StatefulWidget {
  const RatingsScreen({super.key});

  @override
  State<RatingsScreen> createState() => _RatingsScreenState();
}

class _RatingsScreenState extends State<RatingsScreen> {
  double? rating = 4.9;

  List<RatingsData> ratingsList = [];

  List<RatingsData> getRatingList() {
    List<RatingsData> list = [];
    list.add(RatingsData(
        name: "ION COLEA",
        rating: 4.0,
        ratingDescription:
            "With a very small capital I am earning \$20/\$30 a day"));
    list.add(RatingsData(
        name: "ION COLEA",
        rating: 4.0,
        ratingDescription:
            "With a very small capital I am earning \$20/\$30 a day"));
    list.add(RatingsData(
        name: "ION COLEA",
        rating: 4.0,
        ratingDescription:
            "With a very small capital I am earning \$20/\$30 a day"));
    list.add(RatingsData(
        name: "ION COLEA",
        rating: 4.0,
        ratingDescription:
            "With a very small capital I am earning \$20/\$30 a day"));
    return list;
  }

  @override
  void initState() {
    super.initState();
    ratingsList.addAll(getRatingList());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFe8c65b),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '${rating ?? 0.0}',
                      style: const TextStyle(
                        fontSize: 120,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Baseline(
                      baseline: 80.0,
                      baselineType: TextBaseline.ideographic,
                      child: Text(
                        '/5',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                RatingBar(
                  itemSize: 45,
                  initialRating: rating ?? 0.0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ignoreGestures: true,
                  ratingWidget: RatingWidget(
                    full: const Icon(
                      Icons.star_outlined,
                      color: Colors.white,
                    ),
                    half: const Icon(
                      Icons.star_half_outlined,
                      color: Colors.white,
                    ),
                    empty: const Icon(
                      Icons.star_outline,
                      color: Colors.white,
                    ),
                  ),
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  onRatingUpdate: (rating) {
                    setState(() {
                      this.rating = rating;
                    });
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ListView.builder(
                  itemCount: ratingsList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ContactUsScreen(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ratingsList[index].name.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            RatingBar(
                              itemSize: 14,
                              initialRating: ratingsList[index].rating,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              ignoreGestures: true,
                              ratingWidget: RatingWidget(
                                full: const Icon(
                                  Icons.star_outlined,
                                  color: Colors.white,
                                ),
                                half: const Icon(
                                  Icons.star_half_outlined,
                                  color: Colors.white,
                                ),
                                empty: const Icon(
                                  Icons.star_outline,
                                  color: Colors.white,
                                ),
                              ),
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              onRatingUpdate: (rating) {},
                            ),
                            const SizedBox(height: 3),
                            Text(
                              ratingsList[index].ratingDescription,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
