import 'package:astronaut_libraries/widget/text_fiald_add_new.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController? searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void deactivate() {
    searchController!.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Lottie.asset('assets/search.json'),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black.withOpacity(0.7),
        ),
        AddTextFiald(
          controller: searchController!,
          hintText: 'Search',
          onChanged: (onChanged) {},
          sucsses: false,
        ),
      ],
    );
  }
}
