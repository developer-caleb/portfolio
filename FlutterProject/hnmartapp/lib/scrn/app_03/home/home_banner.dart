import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  List<String> imageList = [];

  @override
  void initState() {
    super.initState();
    fetchBannerImages();
  }

  Future<void> fetchBannerImages() async {
    final response = await http.get(Uri.parse('http://www.hanaromartapp.com/api/home-banner'));
    if (response.statusCode == 200) {
      final jsonResult = json.decode(response.body);
      final bannerList = jsonResult['data']['bannerList'];
      final imageUrls =
          bannerList.map<String>((banner) => 'http://www.hanaromartapp.com' + banner['display_img'] as String).toList();
      setState(() {
        imageList = imageUrls;
      });
    } else {
      throw Exception('Failed to fetch banner images');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1.0,
        autoPlayInterval: const Duration(milliseconds: 2800),
        autoPlay: true, // Enable auto-play
        enlargeCenterPage: true, // Make the selected image larger
        scrollDirection: Axis.horizontal, // Set the scroll direction
      ),
      items: imageList
          .map((imagePath) => SizedBox(
                width: double.maxFinite,
                child: Image.network(
                  imagePath,
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                ),
              ))
          .toList(),
    );
  }
}
