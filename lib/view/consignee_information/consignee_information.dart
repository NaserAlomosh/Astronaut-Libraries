import 'package:astronaut_libraries/service/networking/send_message/send_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConsigneeInformation extends StatelessWidget {
  final String image;

  final String name;

  final String id;
  //
  final String postImage;
  final String gitHubUrl;
  final String pubDevUrl;
  final String description;
  final String profileImage;
  final String datePost;
  final int likeNumber;
  final String postId;
  final String postUserId;
  const ConsigneeInformation({
    super.key,
    required this.image,
    required this.name,
    required this.id,
    required this.postImage,
    required this.description,
    required this.profileImage,
    required this.datePost,
    required this.likeNumber,
    required this.postId,
    required this.postUserId,
    required this.gitHubUrl,
    required this.pubDevUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: const Icon(Icons.send),
        onPressed: () async {
          await sendMessage(
            description: description,
            gitHubUrl: gitHubUrl,
            image: image,
            postId: postId,
            pubDevUrl: pubDevUrl,
            sendToId: id,
            shareTime: datePost,
          );
        },
      ),
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(image),
            ),
          ),
          SizedBox(height: 20.h),
          Center(child: Text(name)),
        ],
      ),
    );
  }
}
