import 'package:flutter/material.dart';

class AboutPALScreen extends StatefulWidget {
  const AboutPALScreen({super.key});

  @override
  State<AboutPALScreen> createState() => _AboutPALScreenState();
}

class _AboutPALScreenState extends State<AboutPALScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFe8c65b),
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
            "About PAL",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shrinkWrap: true,
            children: [
              Image.network(
                "https://images.unsplash.com/photo-1683009427598-9c21a169f98f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16),
                color: Colors.blue,
                child: const Column(
                  children: [
                    Text(
                      "Speech: Rising to the challenge, driving forward solutions",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Closing remarks by UN Women Executive Director Sima Bahous at the second regular session of the UN Women Executive Board, UN Headquarters, 13 September 2023.\n\n"
                      "Mr. President, in absentia, thank you for leading this body throughout the year with such dedication and skill. I know that the commitment to gender equality we have seen under Ukraine’s Presidency reflects your country’s commitment to human rights and the values of the United Nations. I thank you for it and know that you will continue to drive this forward wherever you go. Thank you, Ukraine."
                      "I also thank the Vice-Presidents for their valuable leadership contributions within their regional groups and their rich contributions through the year.\n\n"
                      "In particular, I recognize Ambassador Massari from Italy who chaired the afternoon session yesterday, and Ambassador Greco, also from Italy, who has chaired us through this morning, as well as the invaluable contributions of the Ambassadors of Colombia and Thailand throughout the year, and Nelly, the distinguished representative of Cameroon.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "By Admin",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "06-20-2015 11:10:49 am",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
