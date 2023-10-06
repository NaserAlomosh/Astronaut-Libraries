import 'package:astronaut_libraries/classes/navigation/app_navigation.dart';
import 'package:astronaut_libraries/view/add_library/add_library_view.dart';
import 'package:astronaut_libraries/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../model/library/library.dart';
import '../../view_model/library/cubit.dart';
import '../../view_model/library/states.dart';
import '../library_details/library_details.dart';

class LibrarysView extends StatefulWidget {
  final String widgetName;
  final bool added;
  const LibrarysView(
      {super.key, required this.widgetName, required this.added});

  @override
  State<LibrarysView> createState() => _LibrarysViewState();
}

class _LibrarysViewState extends State<LibrarysView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetLibraryCubit()..getData(widget.widgetName),
      child: SafeArea(
        child: Stack(
          children: [
            Scaffold(
              body: Center(
                child: Lottie.asset('assets/librarys_page.json',
                    height: double.infinity, width: double.infinity),
              ),
            ),
            Scaffold(
              appBar: AppBar(
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.all(4),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(30.w),
                      onTap: () {
                        if (widget.added) {
                          AppNavigation()
                              .navigatoinPush(context, const HomeView());
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                      child: Stack(
                        children: [
                          Lottie.asset(
                            'assets/back_icon.json',
                          ),
                          Container(
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ],
                      )),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30.w),
                      onTap: () {
                        AppNavigation().navigatoinPush(context,
                            AddLibraryView(widgetName: widget.widgetName));
                      },
                      child: Stack(
                        children: [
                          Lottie.asset('assets/add_icon.json'),
                          Container(
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.black.withOpacity(0.6),
              body: BlocConsumer<GetLibraryCubit, GetLibraryState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is GetLibraryLoading) {
                    return Center(
                      child: Lottie.asset('assets/loading.json'),
                    );
                  } else {
                    return builderLibrarysWidget(
                      context,
                      context.read<GetLibraryCubit>().librarys,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget builderLibrarysWidget(
  BuildContext context,
  List<LibraryModel> librarys,
) {
  return GridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisSpacing: 1,
    mainAxisSpacing: 1,
    crossAxisCount: 2,
    children: librarys
        .map(
          (e) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                AppNavigation().navigatoinPush(
                  context,
                  LibraryDetails(
                    description: e.description.toString(),
                    pubDevUrl: e.pubDevUrl.toString(),
                    image: e.image.toString(),
                    libraryName: e.name.toString(),
                    gitHubUrl: e.gitHubUrl.toString(),
                  ),
                );
              },
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Opacity(
                      opacity: 0.6,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        child: Image.network(
                          e.image.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: Text(e.name.toString()))
                ],
              ),
            ),
          ),
        )
        .toList(),
  );
}
