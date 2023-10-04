import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../widget/test_detilse.dart';

class LibraryDetails extends StatelessWidget {
  final String image;
  final String libraryName;

  final String gitHubUrl;

  final String pubDevUrl;
  const LibraryDetails({
    super.key,
    required this.image,
    required this.libraryName,
    required this.gitHubUrl,
    required this.pubDevUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Center(
            child: Lottie.asset('assets/details_library.json',
                height: double.infinity, width: double.infinity),
          ),
        ),
        DetailPage(
          pubDevUrl: pubDevUrl,
          gitHubUrl: gitHubUrl,
          libraryName: libraryName,
          image: image,
        )
      ],
    );
  }
}
