// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SelectDate extends StatelessWidget {
//   final Function onSelected;
//   const SelectDate({super.key, required this.onSelected});

//   @override
//   Widget build(BuildContext context) {
//     return CoolDatepicker(
//       bottomSelectedBorderColor: Colors.red,
//       calendarSize: 400.w,
//       resultTS: TextStyle(color: Colors.white.withOpacity(0.6)),
//       selectedCircleColor: Colors.black12,
//       headerColor: Colors.transparent,
//       selectedBetweenAreaColor: Colors.amber,
//       arrowIconAreaColor: Colors.black54,
//       cancelFontColor: Colors.white,
//       resultBD: BoxDecoration(
//         backgroundBlendMode: BlendMode.clear,
//         color: Colors.transparent.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.white.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 10,
//             offset: const Offset(0, 1), // changes position of shadow
//           ),
//         ],
//       ),
//       okButtonColor: const LinearGradient(
//         colors: [
//           Colors.black26,
//           Colors.black26,
//         ],
//       ),
//       isDark: true,
//       defaultValue: [
//         DateTime(2020, 8, 24),
//       ], // single select
//       onSelected: onSelected,
//       disabledList: [
//         DateTime(2021, 10, 22),
//         DateTime(2021, 10, 12),
//       ],
//       disabledRangeList: [
//         {
//           'start': DateTime(2021, 11, 1),
//           'end': DateTime(2021, 11, 13),
//         },
//       ],
//     );
//   }
// }
