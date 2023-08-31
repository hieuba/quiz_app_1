import 'package:flutter/material.dart';

import 'package:quiz_app/constants/padding.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/widgets/question1.dart';

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
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: appBarGradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: kPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/menu.png'),
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade400,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Hello, friend',
                    style: TextStyle(fontSize: kFontSize, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Let\'s test your knowledge',
                    style: TextStyle(
                        fontSize: kTitleFontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35)),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.blue.shade300,
                        ),
                        hintText: 'Search',
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        hintStyle: TextStyle(
                          fontSize: kFontSize,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffBABABA),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32)),
              child: Container(
                color: Colors.grey.shade100,
                child: TabBar(
                  indicatorColor: Colors.blue,
                  labelColor: Colors.black,
                  controller: _tabController,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(text: 'Question 1'),
                    Tab(text: 'Question 2'),
                    Tab(text: 'Question 3'),
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
                  children: const [
                    Question1(),
                    Text('2'),
                    Text('3'),
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
