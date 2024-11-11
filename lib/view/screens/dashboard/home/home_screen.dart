import 'package:ecommerce/model/response/category_response_model.dart';
import 'package:ecommerce/view_model/market_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/src/utils.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/providers.dart';
import 'package:ecommerce/src/models.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    //list = ref.read(fetchVendorStream);

    super.initState();
    // refreshList();
  }

  @override
  void didChangeDependencies() {
    var provider = ref.watch(marketPlaceViewModel);
    // ref.watch(marketPlaceViewModel).filteredProperties =
    //     List.from(ref.watch(marketPlaceViewModel).propertiesListings);

    provider.getSearchProperties();
    provider.initMarketPlace();
    // _scrollController.addListener(() {
    //   if (_scrollController.position.atEdge) {
    //     if (_scrollController.position.pixels == 0) {
    //       // onAtTop?.call();
    //     }
    //     // Reach the bottom of the list
    //     else {
    //       if (provider.canLoadMoreSearchProperties) {
    //         setState(() {
    //           showLoader = true;
    //         });
    //         // provider.getMoreSearchProperties();
    //       } else {
    //         setState(() {
    //           showLoader = false;
    //         });
    //       }
    //     }
    //   }
    // });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var marketPlaceProvider = ref.watch(marketPlaceViewModel);
    var searchList = marketPlaceProvider.searchProperties;
    var themeModeProvider = ref.watch(themeViewModel).themeMode;
    var profileProvider = ref.watch(profileViewModel);
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBars.mainAppBar(context,
          backgroundColor: theme.scaffoldBackgroundColor,
          isVisible: false,
          arrowBackColor: theme.colorScheme.primary,
          bottomVisible: marketPlaceProvider.isLoadingSearch,
          // text: marketPlaceProvider.isLoadingSearch.toString(),
          text: "Explore",
          bottom: const LinearProgressIndicator(
            color: AppColors.kPrimaryLight,
            backgroundColor: AppColors.kPrimaryColor,
          )),
      body: XResponsiveWrap.mobile(
        controller: _scrollController,
        onRefresh: () {
          return marketPlaceProvider.applyFilters();
        },
        padding: const EdgeInsets.symmetric(horizontal: 5),
        children: [
          searchAndFilterMenu(themeModeProvider),
          const Gap(10),
          searchList.isEmpty
              ? const EmptyListStateWidget(
              stateDesc: "No results found for this search")
              : PaginatedListView(
            itemCount: searchList.length,
            itemBuilder: (context, index) {
              var item = searchList[index];
              if (index == searchList.length) {
                return Container(
                  alignment: Alignment.center,
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
                );
              } else {
                return SizedBox(
                  height: 350.h,
                  width: 100,
                  child: ListingsGridItem(
                    category:item.category!.name.toString(),
                    listingId: item.id.toString(),
                    imageText: item.images!.first.toString(),
                    price: item.price.toString(),
                    nameOfHouse: item.title.toString(),
                    houseAddress: item.description.toString(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return const FilterWidget();
      },
    );
  }

  searchAndFilterMenu(ThemeMode theme) {
    var marketPlaceProvider = ref.watch(marketPlaceViewModel);
    var themeMode = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Hero(
            tag: "searchTag",
            child: Material(
              child: CustomTextField(
                textColor: themeMode == ThemeMode.light
                    ? AppColors.kBlack4
                    : AppColors.kTextGray,
                fieldLabel: '',
                hint: "Title",
                prefixIcon: const Icon(Icons.search),
                borderRadius: 28.r,
                controller: marketPlaceProvider.searchController,
                onChanged: (value) {
                  marketPlaceProvider.applyFilters();
                },
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        GestureDetector(
          onTap: () {
            _showFilterSheet();
          },
          child: Container(
            // height: 40.h,
            // width: 81.w,
            padding: EdgeInsets.symmetric(vertical: 9.5.h, horizontal: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28.r),
              border: Border.all(
                  color: themeMode == ThemeMode.light
                      ? AppColors.kTextBlack
                      : AppColors.kDarkSecondary),
              color: theme.scaffoldBackgroundColor,
            ),

            child: Row(
              children: [
                TextView(
                  text: filter,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.spMin,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: themeMode == ThemeMode.light
                      ? AppColors.kTextBlack
                      : AppColors.kWhite,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class FilterWidget extends ConsumerStatefulWidget {
  const FilterWidget({super.key});

  @override
  ConsumerState<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends ConsumerState<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    var marketPlaceProvider = ref.watch(marketPlaceViewModel);
    var themeModeProvider = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.kTransparent,
      body: SafeArea(
        child: Container(
          color: theme.scaffoldBackgroundColor,
          padding: EdgeInsets.all(15.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: '${filter}s',
                      fontWeight: FontWeight.w600,
                      fontSize: 20.spMin,
                    ),
                    IconButton(
                      onPressed: () {
                        navigateBack(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: theme.colorScheme.primary,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),

                ///Amount
                TextView(
                  text: price,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.spMin,
                ),
                SizedBox(
                  height: 14.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        fieldLabel: '',
                        hint: '\$ No Min',
                        keyboardType: TextInputType.number,
                        controller: marketPlaceProvider.minAmountController,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: CustomTextField(
                        fieldLabel: '',
                        hint: '\$ No Max',
                        keyboardType: TextInputType.number,
                        controller: marketPlaceProvider.maxAmountController,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 30.h,
                ),

                ///Property Type
                TextView(
                  text: "Category",
                  fontWeight: FontWeight.w600,
                  fontSize: 16.spMin,
                ),
                SizedBox(
                  height: 14.h,
                ),
                selectListingWidget(themeModeProvider),
                SizedBox(
                  height: 30.h,
                ),

                // TextField(
                //   controller: marketPlaceProvider.propertyTypeController,
                //   decoration: InputDecoration(labelText: 'Property Type'),
                // ),

                // Apply and Reset buttons
                SizedBox(height: 16.w),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: DefaultButtonMain(
                color: themeModeProvider == ThemeMode.dark
                    ? AppColors.kWhite
                    : AppColors.kTransparent,
                text: reset,
                width: 172.w,
                borderColor: AppColors.kPrimary1,
                borderRadius: 30.r,
                textColor: AppColors.kPrimary1,
                onPressed: () {
                  marketPlaceProvider.resetFilters(context);
                },
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: DefaultButtonMain(
                text: apply,
                width: 172.w,
                color: AppColors.kPrimary1,
                borderRadius: 30.r,
                onPressed: () {
                  marketPlaceProvider
                      .applyFilters()
                      .whenComplete(() => navigateBack(context));
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

selectListingWidget(ThemeMode themeMode) {
  var provider = ref.watch(marketPlaceViewModel);
  var theme = Theme.of(context);

  return Container(
    height: 45.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        6.r,
      ),
      border: Border.all(
        width: 1.2.w,
        color: AppColors.kDisabledButton,
      ),
      color: theme.scaffoldBackgroundColor,
    ),
    padding: EdgeInsets.symmetric(
      horizontal: 12.w,
      vertical: 10.h,
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text(
          any,
          style: TextStyle(
              color: themeMode == ThemeMode.light
                  ? AppColors.kTextBlack
                  : AppColors.kTextWhite),
        ),
        value: provider.selectedListingType,
        icon: Image.asset(
          AppImages.dropDown,
          color: themeMode == ThemeMode.light
              ? AppColors.kTextBlack
              : AppColors.kTextWhite,
        ),
        iconSize: 24.r,
        // elevation: 16,
        style: TextStyle(
            color: themeMode == ThemeMode.light
                ? AppColors.kTextBlack
                : AppColors.kTextWhite),
        onChanged: (newProperty) {
          provider.updateListingTypeName(newProperty!);
        },
        items: provider.listingTypeResponse
            .map<DropdownMenuItem<String>>((CategoryResponseModel listingType) {
          return DropdownMenuItem<String>(
            value: listingType.id!.toString(),
            child: TextView(
                text: listingType.name!,
                color: themeMode == ThemeMode.light
                    ? AppColors.kTextBlack
                    : AppColors.kTextWhite),
          );
        }).toList(),
      ),
    ),
  );
}
}
