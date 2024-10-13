import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/StringPath.dart';
import '../utils/constant_resource.dart';
import '../utils/string_resource.dart';
import '../widget/widget_text_feild.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _selectedValue;
  TextEditingController search = TextEditingController();
  final List<String> titles = ['Dining', 'Salon/Spa', 'Entertainment', 'Cleaning'];
  final List<String> discounts = ['Up to 10%', 'Up to 20%', 'Up to 30%', 'Up to 40%'];
  final List<String> date = ['25', '26', '27', '28','29','30', '31'];
  final List<String> month = ['Today', 'Nov', 'Nov', 'Nov', 'Nov', 'Nov', 'Nov'];
  final String imageUrl = 'https://via.placeholder.com/100'; // Example image URL
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];


  @override
  void initState() {
    super.initState();
    _selectedValue = 'UAE'; // Set the default value
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(item, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(ConstantResource.RADIUS_FIVE),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      'No. ${imgList.indexOf(item)} image',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    ))
        .toList();
    return Scaffold(
      backgroundColor: Color(0xffD5F4ED),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: DropdownButton<String>(
                          icon: Icon(Icons.keyboard_arrow_down, size: 20),
                          underline: SizedBox(),
                          value: _selectedValue,
                          items: <String>['UAE', 'B', 'C', 'D'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyle(fontSize: 14, color: Colors.black)),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValue = newValue;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Image.asset(StringPath.LOGO_IMAGE_PATH, width: 100, height: 50),
                      ),
                      // Your badge image
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Badge(
                          label: Text('3'),
                          child: Image.asset(StringPath.SHOPPING_IMAGE_PATH), // Adjust the path
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      height: 100,
                      child: Row(
                        children: [
                          Expanded(
                              child:  WidgetTextField(
                                textEditingController: search,
                                hintText: StringResources.SEARCH,
                                showSuffixIcon: false,
                                isPasswordVisible: false,
                                paddingLeft: 10,
                                paddingRight: 10,
                                icon: Icons.search,
                              )
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Image.asset(StringPath.SETTINGS_IMAGE_PATH), // Adjust the path
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      'Filter By Category',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    height: 130,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: ListView.builder(
                        itemCount: titles.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    imageUrl,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  titles[index],
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontFamily: StringResources.INTER,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Divider(height: 2, color: Colors.black38),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Filter By Discount',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  SizedBox(
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: ListView.builder(
                        itemCount: discounts.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(padding: EdgeInsets.all(5),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xff8AD4C4),
                                    ),
                                    borderRadius: BorderRadius.circular(ConstantResource.RADIUS_FIVE),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      discounts[index],
                                      style: TextStyle(
                                        color: Color(0xff8AD4C4),
                                        fontSize: 18,
                                        fontFamily: StringResources.INTER,
                                        fontWeight: FontWeight.w200,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(padding: EdgeInsets.only(left: 20,right: 20),
                    child: Divider(height: 2,color: Colors.black38,),),
                  SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Upcoming Deals',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  SizedBox(
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: ListView.builder(
                        itemCount: discounts.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(padding: EdgeInsets.all(5),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xff8AD4C4),
                                    ),
                                    borderRadius: BorderRadius.circular(ConstantResource.RADIUS_FIVE),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          date[index],
                                          style: TextStyle(
                                            color: Color(0xff8AD4C4),
                                            fontSize: 18,
                                            fontFamily: StringResources.INTER,
                                            fontWeight: FontWeight.w200,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          month[index],
                                          style: TextStyle(
                                            color: Color(0xff628A79),
                                            fontSize: 14,
                                            fontFamily: StringResources.INTER,
                                            fontWeight: FontWeight.w200,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  SizedBox(
                    height: 250,
                    child: Column(children: [
                      CarouselSlider(
                        items: imageSliders,
                        carouselController: _controller,
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



