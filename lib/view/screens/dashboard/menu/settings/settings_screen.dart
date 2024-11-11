// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:ecommerce/src/components.dart';
// import 'package:ecommerce/src/config.dart';
// import 'package:ecommerce/src/providers.dart';
// import 'package:ecommerce/src/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:ecommerce/src/screens.dart';
//
// class SettingsScreen extends ConsumerWidget {
//   const SettingsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     ref.watch(walletViewModel);
//     ref.watch(themeViewModel).themeMode;
//     var theme = Theme.of(context);
//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       appBar: AppBars.mainAppBar(
//         context,
//         backgroundColor: theme.scaffoldBackgroundColor,
//         arrowBackColor: theme.colorScheme.primary,
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: 20.w,
//           vertical: 20.h,
//         ),
//         child: SizedBox(
//           width: 360.w,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextView(
//                 text: settings,
//                 fontSize: 22.spMin,
//                 fontWeight: FontWeight.w600,
//                 fontFamily: ttHoves,
//               ),
//               Gap(
//                 20.h,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   navigatePush(context, const ChangePasswordScreen());
//                 },
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Image.asset(
//                             AppImages.securityPassword,
//                             width: 19.w,
//                             height: 20.h,
//                             color: theme.indicatorColor,
//                           ),
//                           Gap(5.w),
//                           TextView(
//                             text: changePassword,
//                             fontSize: 16.spMin,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: ttHoves,
//                           )
//                         ],
//                       ),
//                       Icon(
//                         Icons.arrow_forward_ios,
//                         size: 24.spMin,
//                         color: theme.colorScheme.primary,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Gap(
//                 20.h,
//               ),
//               // GestureDetector(
//               //   onTap: () {
//               //     // authProvider.resendOTP(context,
//               //     //     email: DummyData.emailAddress.toString());
//               //     trxProvider.transactionPinStatus?.data == true
//               //         ? navigatePush(context, const EnterOtpScreen())
//               //         : navigatePush(context, const CreatePinScreen());
//               //   },
//               //   child: SizedBox(
//               //     child: Row(
//               //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //       children: [
//               //         Row(
//               //           children: [
//               //             Image.asset(
//               //               AppImages.pinLock,
//               //               width: 19.w,
//               //               height: 20.h,
//               //               color: theme.indicatorColor,
//               //             ),
//               //             Gap(5.w),
//               //             TextView(
//               //               text: trxProvider.transactionPinStatus?.data == true
//               //                   ? resetPin
//               //                   : setupPin,
//               //               fontSize: 16.spMin,
//               //               fontWeight: FontWeight.w500,
//               //               fontFamily: ttHoves,
//               //             )
//               //           ],
//               //         ),
//               //         Icon(
//               //           Icons.arrow_forward_ios,
//               //           size: 24.spMin,
//               //           color: theme.colorScheme.primary,
//               //         )
//               //       ],
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
