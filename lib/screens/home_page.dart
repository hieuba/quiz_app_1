// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import 'package:quiz_app/commons/appbar_custom.dart';
import 'package:quiz_app/commons/motobike.dart';
import 'package:quiz_app/commons/question_and_minute.dart';
import 'package:quiz_app/constants/padding.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/data/exams.dart';
import 'package:quiz_app/data/generate_map.dart';
import 'package:quiz_app/models/exam_model.dart';
import 'package:quiz_app/screens/detail/detail_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: Colors.blue.shade100,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            gradient: appBarGradient,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // appbar
              Padding(
                padding: EdgeInsets.only(
                  left: kSpacing,
                  right: kSpacing,
                  bottom: kSpacing,
                  top: topPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarCustom(
                      title: '',
                      icon: 'menu.png',
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      widget: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            color: tabbarColor,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/icons/icon_app.png'))),
                      ),
                    ),
                    Text(
                      'Hello, friend',
                      style: TextStyle(
                          fontSize: kSmallFontSize, color: whiteColor),
                    ),
                    const SizedBox(height: 8),
                    Text('Ôn thi GPLX', style: titleStyte),
                    InkWell(
                      onTap: () {
                        showSearch(
                            context: context,
                            delegate: DataSearch(examData: ExamData.exams));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 16.h),
                        height: 40.h,
                        decoration: BoxDecoration(
                            // color: Colors.amber.shade100,
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(35)),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.h),
                              child: SizedBox(
                                  child: Image.asset(
                                'assets/icons/search.png',
                              )),
                            ),
                            Expanded(
                              child: IgnorePointer(
                                ignoring: true,
                                child: TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.only(top: 5.h),
                                    hintText: 'Search',
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    disabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: grayColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
                child: Container(
                  color: Colors.grey.shade100,
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorWeight: 1.2,
                    labelStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    indicatorColor: Colors.blue,
                    labelColor: Colors.blue,
                    controller: _tabController,
                    unselectedLabelColor: tabbarColor,
                    tabs: const [
                      Tab(text: 'Xe máy'),
                      Tab(text: 'Ô tô'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey.shade100,
                  width: double.infinity,
                  height: double.infinity,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      const MotoBike(),
                      Center(
                        child: Text(
                          'Chúng tôi sẽ cập nhật sau!!',
                          style: TextStyle(color: blackColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate {
  List<Map<String, dynamic>> examData;
  DataSearch({
    required this.examData,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Map<String, dynamic>> matchQuery = [];

    for (var item in examData) {
      if (item['title'].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return Padding(
      padding: kPadding,
      child: ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          final examsData = matchQuery[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                PageTransition(
                  child: DetailScreen(
                      examModel: ExamModel.fromMap(matchQuery[index])),
                  type: PageTransitionType.topToBottom,
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 16.h),
              height: 100.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange.shade200,
                borderRadius: kBorderRadius,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 23.w, right: 12.w),
                      width: 72.w,
                      height: 72.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(examsData['thumnail']))),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GradientText(
                            text: examsData['title'],
                            gradient: textGradient,
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          QuestionAndMinute(
                            image: 'assets/icons/number_question.png',
                            text: '${examsData['total_question']} Câu hỏi',
                          ),
                          QuestionAndMinute(
                            image: 'assets/icons/timer.png',
                            text: convertSecondsToMinutes(
                                examsData['time'].toString()),
                          ),
                          SizedBox(height: 5.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Map<String, dynamic>> matchQuery = [];

    for (var item in examData) {
      if (item['title'].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return Padding(
      padding: kPadding,
      child: ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          final examsData = matchQuery[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                PageTransition(
                  child: DetailScreen(
                      examModel: ExamModel.fromMap(matchQuery[index])),
                  type: PageTransitionType.topToBottom,
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 16.h),
              height: 100.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange.shade200,
                borderRadius: kBorderRadius,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 23.w, right: 12.w),
                      width: 72.w,
                      height: 72.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(examsData['thumnail']))),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GradientText(
                            text: examsData['title'],
                            gradient: textGradient,
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          QuestionAndMinute(
                            image: 'assets/icons/number_question.png',
                            text: '${examsData['total_question']} Câu hỏi',
                          ),
                          QuestionAndMinute(
                            image: 'assets/icons/timer.png',
                            text: convertSecondsToMinutes(
                                examsData['time'].toString()),
                          ),
                          SizedBox(height: 5.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

     /*
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            child: Image.asset('assets/icons/menu.png')),
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade400,
                        ),
                      ],
                    ),
      */
