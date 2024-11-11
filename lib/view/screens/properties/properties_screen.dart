import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/src/providers.dart';


class PropertiesScreen extends ConsumerStatefulWidget {
  const PropertiesScreen({super.key});

  @override
  ConsumerState<PropertiesScreen> createState() => _ListingsScreenState();
}

class _ListingsScreenState extends ConsumerState<PropertiesScreen> {
  final ScrollController _scrollController = ScrollController();
  bool showLoader = false;

  @override
  void didChangeDependencies() {
  //  var profileProvider =  ref.watch(profileViewModel);
    // Future.microtask((){
    //   profileProvider.loadData(context).then((value) => ref
    //       .watch(walletViewModel)
    //       .getAcctBalance(userType: profileProvider.profileData?.role ?? 0));
    //
    // });
    //
    // _scrollController.addListener(() {
    //   if (_scrollController.position.atEdge) {
    //     if (_scrollController.position.pixels == 0) {
    //       // onAtTop?.call();
    //     }
    //     // Reach the bottom of the list
    //     else {
    //       if (provider.canLoadMoreListings) {
    //         setState(() {
    //           showLoader = true;
    //         });
    //         provider.getMoreListings();
    //         provider.getMoreUnverifiedListings();
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
    var profileProvider = ref.watch(profileViewModel);
    var theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: AppColors.kPrimary1,
      body: XResponsiveWrap.mobile(
        onRefresh: () async {
          await profileProvider.loadData(context).whenComplete((){
            // listingProvider.getPersonalProperties(context);
            // listingProvider.getPersonalUnverifiedProperties(context);
          });
        } ,
        controller: _scrollController,
        children: [

        ],
      ),
    );
  }
}
