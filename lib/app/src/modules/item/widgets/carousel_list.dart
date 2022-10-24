import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ItemBanner extends StatelessWidget {
  const ItemBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                // margin: EdgeInsets.all(0.0),
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(8.0),
                  color: Colors.red,
                  // image: DecorationImage(
                  //   image: NetworkImage("ADD IMAGE URL HERE"),
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),

              //2nd Image of Slider
              Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  // image: DecorationImage(
                  //   image: NetworkImage("ADD IMAGE URL HERE"),
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),

              //3rd Image of Slider
              Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  // image: DecorationImage(
                  //   image: NetworkImage("ADD IMAGE URL HERE"),
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),

              //4th Image of Slider
              Container(
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  // image: DecoraionImage(
                  //   image: NetworkImage("ADD IMAGE URL HERE"),
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),

              //5th Image of Slider
              Container(
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  // image: DecorationImage(
                  //   image: NetworkImage("ADD IMAGE URL HERE"),
                  //   fit: BoxFit.cover,
                ),
              ),
              // ),
            ],

            //Slider Container properties
            options: CarouselOptions(
              height: currentHeight,
              // enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              enableInfiniteScroll: true,
              autoPlayInterval: const Duration(seconds: 10),
              viewportFraction: 1,
            ),
          ),
        ],
      ),
    );
  }
}
