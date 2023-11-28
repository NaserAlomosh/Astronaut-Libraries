import 'package:astronaut_libraries/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'widget/favorite_library.dart';
import 'widget/favorite_posts.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 2,
          child: Stack(
            children: [
              Scaffold(
                body: Center(
                  child: Lottie.asset('assets/favorite.json'),
                ),
              ),
              Scaffold(
                backgroundColor: Colors.black.withOpacity(0.6),
                appBar: TabBar(
                    splashBorderRadius: BorderRadius.circular(20),
                    unselectedLabelColor: Colors.blueAccent.withOpacity(0.6),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blueAccent.withOpacity(0.6),
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.blueAccent.withOpacity(0.6),
                            ),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.bookmark_border),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.blueAccent.withOpacity(0.6),
                            ),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.collections_bookmark,
                                ),
                                CustomText(text: 'Posts', fontsize: 12),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                body: const TabBarView(
                  children: [
                    FavoriteLibrary(),
                    FavoritePosts(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
