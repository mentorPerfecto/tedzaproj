// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ecommerce/src/providers.dart';
// import 'package:ecommerce/utils/navigators.dart';
//
// import '../../../config/app_colors.dart';
//
// class StateSelectionDialogue extends ConsumerStatefulWidget {
//   const StateSelectionDialogue({super.key});
//
//   @override
//   ConsumerState<StateSelectionDialogue> createState() =>
//       _StateSelectionDialogueState();
// }
//
// class _StateSelectionDialogueState
//     extends ConsumerState<StateSelectionDialogue> {
//   bool isStateSelected = false;
//   String selectedStateCode = '';
//   String? selectedState;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [statePopUp()],
//     );
//   }
//
//   statePopUp() async {
//     var provider = ref.watch(listingViewModel);
//
//     final deviceW = MediaQuery.of(context).size.width;
//     final deviceH = MediaQuery.of(context).size.height;
//
//     final selectedValue = await showModalBottomSheet<String>(
//         // backgroundColor: Colors.white,
//         context: context,
//         shape: RoundedRectangleBorder(
//             borderRadius:
//                 BorderRadius.vertical(top: Radius.circular(deviceH * 0.04))),
//         isScrollControlled: true,
//         builder: (BuildContext context) {
//           return Container(
//             //
//             margin: EdgeInsets.only(
//                 left: deviceW * 0.08,
//                 right: deviceW * 0.08,
//                 bottom: deviceH * 0.01),
//             padding: EdgeInsets.only(top: deviceH * 0.01),
//             height: deviceH * 0.85,
//             width: deviceW / 1.75,
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Column(
//                 //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: deviceH * 0.03,
//                   ),
//
//                   Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//                     GestureDetector(
//                       onTap: () {
//                         navigateBack(context);
//                       },
//                       child: Container(
//                           alignment: Alignment.topRight,
//                           child:
//                               const Icon(Icons.keyboard_arrow_down_outlined)),
//                     ),
//                   ]),
//
//                   // Text(title, textAlign: TextAlign.center, style: kTitleStyle,),
//                   Text(
//                     "Select State",
//                     style: TextStyle(
//                         fontSize: 29.spMin, fontWeight: FontWeight.w700),
//                   ),
//                   SizedBox(
//                     height: deviceH * 0.01,
//                   ),
//
//                   SizedBox(
//                     height: deviceH * 0.05,
//                   ),
//
//                   Column(
//                     children: [
//                       SizedBox(
//                         height: 600.h,
//                         child: ListView.builder(
//                           itemCount: provider.statesResponseModel.length,
//                           physics: const BouncingScrollPhysics(),
//                           itemBuilder: (context, index) {
//                             // final bank = banks![index];
//                             return MaterialButton(
//                               height: 46.h,
//                               minWidth: double.infinity,
//                               elevation: 0,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12.r)),
//                               color: provider.statesResponseModel[index]
//                                           .isSelected ==
//                                       true
//                                   ? AppColors.kPrimary1
//                                   : null,
//                               onPressed: () {
//                                 provider.selectState(index);
//                                 Navigator.of(context).pop(
//                                     provider.statesResponseModel[index].name);
//                                 // Navigator.of(context).pop(ResponseData.statesModel![index].code);
//                                 selectedStateCode = provider
//                                     .statesResponseModel[index].code
//                                     .toString();
//                                 isStateSelected = true;
//                               },
//                               child: Text(
//                                 provider.statesResponseModel[index].name
//                                     .toString(),
//                                 style: TextStyle(fontSize: 15.spMin),
//                               ),
//                             );
//                             // return ListTile(
//                             //   title: Text(bank['name']!, style: kTextStyle.copyWith(color: AppColors.blue, ),),
//                             //   onTap: () {
//                             //     Navigator.of(context).pop(bank['name']);
//                             //   },
//                             // );
//                           },
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           );
//         });
//     if (selectedValue != null) {
//       setState(() {
//         selectedState = selectedValue;
//         // isSelected = true;
//       });
//     }
//   }
// }
