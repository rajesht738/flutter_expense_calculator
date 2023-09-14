import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    // final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: height * .45, child: _head()),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transaction History",
                    style: TextStyle(
                        fontSize: 19,
                        color: Color.fromARGB(255, 17, 16, 16),
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 17, 16, 16),
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: const Icon(Icons.radar),
                ),
                title: const Text(
                  "Transfer",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                subtitle: const Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                trailing: Text('\$56'));
          }))
        ],
      )),
    );
  }
}

Widget _head() {
  // First get the FlutterView.
  FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;

// Dimensions in physical pixels (px)
// Size size = view.physicalSize;
// double width = size.width;
// double height = size.height;

// Dimensions in logical pixels (dp)
  Size size = view.physicalSize / view.devicePixelRatio;
  double width = size.width;
  double height = size.height;

  return Stack(
    children: [
      Column(
        children: [
          Container(
            width: width,
            height: height * 0.3,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Stack(
              children: [
                Positioned(
                  top: height * .04,
                  right: width * .03,
                  child: ClipRRect(
                    child: Container(
                      height: 40,
                      width: 40,
                      color: const Color.fromRGBO(250, 250, 250, 0.1),
                      child: const Icon(
                        Icons.notification_add_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Afternoon",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        "Mr. John Doe",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      Positioned(
        top: height * 0.16,
        left: width * 0.14,
        child: Container(
          height: height * 0.25,
          width: width * 0.75,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(47, 125, 21, 3),
                    offset: Offset(0, 6),
                    blurRadius: 12,
                    spreadRadius: 6)
              ],
              color: const Color.fromARGB(255, 47, 125, 121),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Balance',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 14),
                child: Row(
                  children: [
                    Text(
                      "\$ 1586.20",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TotalCalculationfun(Icons.arrow_downward, 'Income'),
                    TotalCalculationfun(Icons.arrow_upward, 'Expenses'),
                  ],
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ 1586.20",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      "\$ 586.20",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

TotalCalculationfun(icon, Detail) {
  return Row(
    children: [
      CircleAvatar(
        backgroundColor: Colors.lightBlue,
        radius: 12,
        child: Icon(
          icon,
          color: Colors.white,
          size: 19,
        ),
      ),
      const SizedBox(
        width: 7,
      ),
      Text(
        Detail,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    ],
  );
}
