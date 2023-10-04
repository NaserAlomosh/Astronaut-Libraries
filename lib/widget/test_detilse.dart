import 'package:astronaut_libraries/widget/custom_text_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatelessWidget {
  final String image;

  final String libraryName;

  final String gitHubUrl;

  final String pubDevUrl;

  const DetailPage({
    Key? key,
    required this.image,
    required this.libraryName,
    required this.gitHubUrl,
    required this.pubDevUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Opacity(
        opacity: 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 26.sp,
                      ),
                      children: [
                        TextSpan(
                          text: libraryName,
                        ),
                        WidgetSpan(
                          child: IconButton(
                            onPressed: () async {
                              await Clipboard.setData(
                                  ClipboardData(text: libraryName));
                            },
                            icon: Icon(
                              Icons.copy,
                              size: 26.sp,
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                CustomTextButton(
                  uri: Uri.parse(gitHubUrl),
                  link: true,
                  label: 'Go To github',
                ),
                SizedBox(height: 20.h),
                CustomTextButton(
                  link: true,
                  uri: Uri.parse(pubDevUrl),
                  label: 'Go To pub.div',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
