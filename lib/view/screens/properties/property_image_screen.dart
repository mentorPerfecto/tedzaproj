import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/utils.dart';
import 'package:flutter/material.dart';

class PropertyImageScreen extends StatefulWidget {

  final String propertyName;
  final int index;
  final List<String> propertyImages;

  const PropertyImageScreen({super.key, required this.propertyName, required this.index, required this.propertyImages});


  @override
  State<PropertyImageScreen> createState() => _PropertyImageScreenState();
}

class _PropertyImageScreenState extends State<PropertyImageScreen> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  void initState() {

   setState(() {
     _current = widget.index;
   });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kTextBlack,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24.spMin,
              color: AppColors.kTextWhite,
            ),
            onPressed: () {
              navigateBack(context);
            }),
        title: TextView(
          text: widget.propertyName,
          fontSize: 16.spMin,
          fontFamily: ttHoves,
          fontWeight: FontWeight.w600,
          color: AppColors.kGrey300,
        ),
      ),
      body:  Center(
        child: Stack(
          children: [
            Center(
              child: CarouselSlider(
                items:  widget.propertyImages.map((item) {
                  return ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                      child: Hero(
                        tag: item,
                        child: Container(
                          height: 400.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: NetworkImage(item),
                            ),
                          ),
                        ),
                      ));
                }).toList(),
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: false,
                    enableInfiniteScroll: widget.propertyImages.length >1,
                    enlargeCenterPage: true,
                    padEnds: false,
                    viewportFraction: 1,
                    initialPage: _current,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ),
            Center(
              child: Visibility(
                visible: widget.propertyImages.length > 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: _current > 0,
                      child: Material(
                        color: AppColors.kLightAsh,
                        shape: const CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        child: IconButton(
                          onPressed: () {
                            _controller.previousPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.kTextBlack,
                            size: 20.spMin,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _current < (widget.propertyImages.length - 1),
                      child: Material(
                        color: AppColors.kLightAsh,
                        shape: const CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        child: IconButton(
                          onPressed: () {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.kTextBlack,
                            size: 20.spMin,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
