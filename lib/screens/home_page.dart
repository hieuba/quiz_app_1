import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/bloc/bloc/exam_bloc.dart';
import 'package:quiz_app/commons/app_bar.dart';

import 'package:quiz_app/constants/padding.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/commons/motobike.dart';

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
    examBloc.add(ExamInitEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  final examBloc = ExamBloc();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(
        backgroundColor: Colors.amber,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: appBarGradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // appbar
            Padding(
              padding: kPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  AppBarCustom(
                    title: '',
                    icon: 'menu.png',
                    onTap: () {},
                    widget: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                          color: tabbarColor, shape: BoxShape.circle),
                    ),
                  ),
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

                  Text(
                    'Hello, friend',
                    style: GoogleFonts.dmSans(
                        fontSize: kSmallFontSize, color: whiteColor),
                  ),
                  const SizedBox(height: 8),
                  Text('Ôn thi GPLX', style: titleStyte),
                  Container(
                    margin: EdgeInsets.only(top: 16.h),
                    height: 40.h,
                    decoration: BoxDecoration(
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
                          child: TextField(
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
                              hintStyle: GoogleFonts.nunito(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: grayColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32)),
              child: Container(
                color: Colors.grey.shade100,
                child: TabBar(
                  dividerColor: Colors.transparent,
                  indicatorWeight: 1.2,
                  labelStyle: GoogleFonts.nunito(
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
                    MotoBike(),
                    Text(
                      'de oto',
                      style: TextStyle(color: blackColor),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
