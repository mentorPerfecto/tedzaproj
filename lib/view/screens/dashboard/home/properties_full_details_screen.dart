import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/view_model/market_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/screens.dart';
import 'package:ecommerce/src/utils.dart';
import 'package:ecommerce/src/providers.dart';



class PropertyFullDetailsScreen extends ConsumerStatefulWidget {
  final String id;

  const PropertyFullDetailsScreen({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<PropertyFullDetailsScreen> createState() => _PropertyFullDetailsScreenState();
}

class _PropertyFullDetailsScreenState extends ConsumerState<PropertyFullDetailsScreen> {
  @override
  void didChangeDependencies() {
    var provider = ref.watch(marketPlaceViewModel);
    provider.getSingleListing(context, id: widget.id);
    super.didChangeDependencies();
  }

  bool isExpanded = false;
  bool isLengthExpanded = false;
  bool isHouseRulesExpanded = false;
  @override
  Widget build(BuildContext context) {
    double screenWidthOffFifteen = ((MediaQuery.sizeOf(context).width) - 15);
    double screenWidth = MediaQuery.sizeOf(context).width;
    var listingProvider = ref.watch(marketPlaceViewModel);
    var authProvider = ref.watch(authViewModel);
    var profileProvider = ref.watch(profileViewModel);
    var themeMode = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBars.mainAppBar(
        context,
        backgroundColor: theme.scaffoldBackgroundColor,
        arrowBackColor: theme.colorScheme.primary,
      ),
      body: SafeArea(
        child: listingProvider.isGettingSingleListing
            ? Center(
          child: SizedBox(
            height: 70,
            width: 70,
            child: LoadingIndicator(
              indicatorType: Indicator.ballGridPulse,
              colors: const [
                AppColors.kPrimary2,
              ],
              strokeWidth: 2,
              backgroundColor: theme.scaffoldBackgroundColor,
              pathBackgroundColor: theme.colorScheme.primary,
            ),
          ),
        )
            : SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PropertyView(
                    screenWidthOffFifteen: screenWidthOffFifteen,
                    screenWidth: screenWidth,
                    propertyPrice: 'N${listingProvider.singleListing?.price}',
                  ),
                  PropertiesDetailsAndAmenities(
                    screenWidthOffFifteen: screenWidthOffFifteen,
                    isExpanded: isExpanded,
                    isLengthExpanded: isLengthExpanded,
                    isHouseRulesExpanded: isHouseRulesExpanded,
                    detailsOnTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    amenitiesOnTap: () {
                      setState(() {
                        isLengthExpanded = !isLengthExpanded;
                      });
                    },
                    houseRulesOnTap: () {
                      setState(() {
                        isHouseRulesExpanded = !isHouseRulesExpanded;
                      });
                    },
                    propertyDetails: propertyDetailsText,
                    houseRules: houseRuleText,
                  ),
                ],
              ),
              Gap(10.h),
            ],
          ),
        ),
      ),
    );
  }
}

class PropertiesDetailsAndAmenities extends ConsumerWidget {
  const PropertiesDetailsAndAmenities(
      {super.key,
      required this.screenWidthOffFifteen,
      required this.isExpanded,
      required this.isLengthExpanded,
      required this.isHouseRulesExpanded,
      required this.detailsOnTap,
      required this.amenitiesOnTap,
      required this.houseRulesOnTap,
      required this.propertyDetails,
      required this.houseRules});

  final double screenWidthOffFifteen;
  final bool isExpanded;
  final bool isLengthExpanded;
  final bool isHouseRulesExpanded;
  final VoidCallback detailsOnTap;
  final VoidCallback amenitiesOnTap;
  final VoidCallback houseRulesOnTap;
  final String propertyDetails;
  final String houseRules;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var listingProvider = ref.watch(marketPlaceViewModel);
    Theme.of(context);
    return SizedBox(
      width: screenWidthOffFifteen.w,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0.w,
          vertical: 5.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            TextView(
              text: "Category ",
              fontSize: 16.spMin,
              fontWeight: FontWeight.w600,
              fontFamily: ttHoves,
            ),
            SizedBox(
              height: 12.h,
            ),
            TextView(
              text: listingProvider.singleListing?.category?.name.toString() ?? '',
              maxLines: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.kSubText,
              fontFamily: ttHoves,
            ),

            SizedBox(
              height: 15.h,
            ),
            const XampDivider(),

            //
            TextView(
              text: "Description ",
              fontSize: 16.spMin,
              fontWeight: FontWeight.w600,
              fontFamily: ttHoves,
            ),
            SizedBox(
              height: 12.h,
            ),
            TextView(
              text: listingProvider.singleListing?.description.toString() ?? '',
              maxLines: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.kSubText,
              fontFamily: ttHoves,
            ),

            SizedBox(
              height: 15.h,
            ),
            const XampDivider(),
          ],
        ),
      ),
    );
  }
}


class PropertyView extends ConsumerWidget {
  const PropertyView(
      {super.key,
        required this.screenWidth,
        required this.propertyPrice,
        required this.screenWidthOffFifteen});

  final double screenWidth;
  final String propertyPrice;
  final double screenWidthOffFifteen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var listingProvider = ref.watch(marketPlaceViewModel);
    var singleListingProvider = listingProvider.singleListing;
    ThemeMode themeMode = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    String propertyName = listingProvider.singleListing!.title ?? "";
    return SizedBox(
      // height: 483.0.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //first subFirst Child
          SizedBox(
            // color: Colors.red,
            // height: 257.h,
            width: screenWidth.w,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 15.w,
                    top: 5.h,
                  ),
                  child: SizedBox(
                    // height: 20.h,
                    width: screenWidthOffFifteen.w,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 200.h,
                  child: PageView.builder(
                      itemCount: listingProvider.singleListing!.images!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var propertyImage = listingProvider.singleListing!.images![index];
                        return InkWell(
                          onTap: () {
                            navigatePush(
                                context,
                                PropertyImageScreen(
                                  propertyImages: listingProvider.singleListing!.images!.toList(),
                                  propertyName: propertyName,
                                  index: index,
                                ));
                          },
                          child: Hero(
                            tag: propertyImage,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 14.h,
                              ),
                              height: 195,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(propertyImage),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    child: Container(
                                      height: 26.h,
                                      width: 54.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.kGreenLoader,
                                        borderRadius: BorderRadius.circular(40.r),
                                      ),
                                      child: Center(
                                        child: TextView(
                                          text:
                                          '${index + 1}/${listingProvider.singleListing!.images!.length}',
                                          fontSize: 14.spMin,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: ttHoves,
                                          color: AppColors.kTextBlack,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          //Second subFirst Child
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
            child: SizedBox(
              // color: Colors.red,
              // height: 205.h,
              width: screenWidthOffFifteen,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //first Second subFirst Child
                  SizedBox(
                    // height: 52.h,
                    width: screenWidthOffFifteen,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //
                        TextView(
                          text:
                          '${UtilFunctions.currency(context)} ${UtilFunctions.formatAmount(double.parse(listingProvider.singleListing!.price.toString()))}',
                          fontSize: 18.spMin,
                          fontWeight: FontWeight.w600,
                          fontFamily: ttHoves,
                        )
                      ],
                    ),
                  ),
                  Gap(5.h),
                  TextView(
                    text: singleListingProvider!.title.toString(),
                    fontSize: 16.spMin,
                    fontWeight: FontWeight.w600,
                    fontFamily: ttHoves,
                  ),
                  Gap(5.h),
                  SizedBox(
                    height: 10.h,
                  ),
                  const XampDivider()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}