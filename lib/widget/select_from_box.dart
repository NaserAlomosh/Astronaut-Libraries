// // ignore_for_file: must_be_immutable

// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../style/color_app.dart';
// import '../view_model/select_from_box/cubit.dart';
// import '../view_model/select_from_box/states.dart';

// class CustemSelect extends StatelessWidget {
//   CustemSelect({super.key, required this.listItem});

//   final List listItem;
//   String? selectedValue;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SelectTybeCubit(),
//       child: BlocConsumer<SelectTybeCubit, SelectTybeStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return DropdownButtonHideUnderline(
//             child: DropdownButton2<String>(
//               dropdownStyleData: const DropdownStyleData(
//                   decoration: BoxDecoration(color: AppColor.primary)),
//               isExpanded: true,
//               hint: Text(
//                 'Select Item',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Theme.of(context).hintColor,
//                 ),
//               ),
//               items: listItem
//                   .map((item) => DropdownMenuItem<String>(
//                         value: item,
//                         child: Text(
//                           item,
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                       ))
//                   .toList(),
//               value: context.read<SelectTybeCubit>().selectedTybe,
//               onChanged: (String? value) {
//                 selectedValue = context
//                     .read<SelectTybeCubit>()
//                     .selectFromBox(value.toString());
//               },
//               buttonStyleData: const ButtonStyleData(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 height: 40,
//                 width: 140,
//               ),
//               menuItemStyleData: const MenuItemStyleData(
//                 height: 40,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
