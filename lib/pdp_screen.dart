// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdp_flutter/api_call_screen.dart';
import 'package:pdp_flutter/constant.dart';
import 'package:pdp_flutter/counter_stream.dart';
import 'package:pdp_flutter/screen_query.dart';

class PdpScreen extends StatefulWidget {
  const PdpScreen({super.key});

  @override
  State<PdpScreen> createState() => _PdpScreenState();
}

class _PdpScreenState extends State<PdpScreen> {
  final counterStream = CounterStream();
  int counter = 0;

  void counterUpdate() async {
    for (int i = 0; i < 50; ++i) {
      await Future.delayed(Duration(milliseconds: 500));
      ++counter;
      counterStream.counterSink.add(counter);
    }
  }

  void navigateToNewsScreen(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ApiCallScreen(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    counterStream.dispose();
  }

  @override
  void initState() {
    super.initState();
    counterUpdate();
  }

  @override
  Widget build(BuildContext context) {
    ScreenBreakpoint breakpoint = ScreenBreakpoint(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (breakpoint.isMobile)
                    ? Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset('lib/images/logo.jpeg'),
                              ),
                            ),
                          ),
                          StreamBuilder<Object>(
                            stream: counterStream.counterStream,
                            initialData: 0,
                            builder: (context, snapshot) {
                              return Text(
                                "Counter: ${snapshot.data}",
                                style:
                                    TextStyle(fontFamily: 'SF', fontSize: 20),
                              );
                            },
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          SizedBox(
                            height: 150,
                            width: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.asset('lib/images/logo.jpeg'),
                              ),
                            ),
                          ),
                          Spacer(),
                          StreamBuilder<Object>(
                            stream: counterStream.counterStream,
                            initialData: 0,
                            builder: (context, snapshot) {
                              return Text(
                                "Counter: ${snapshot.data}",
                                style:
                                    TextStyle(fontFamily: 'SF', fontSize: 20),
                              );
                            },
                          ),
                          Spacer(),
                        ],
                      ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Home  ->  Work Desk  ->  Wooden Desk',
                  style: TextStyle(
                    fontFamily: 'SF',
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                (breakpoint.isMobile)
                    ? Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 300,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset("lib/images/desk.jpeg"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                              elevation: 0,
                              color: Colors.green[100],
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Wooden Desk',
                                      style: TextStyle(
                                          fontFamily: 'SF',
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Made with Oak wood',
                                      style: TextStyle(
                                        fontFamily: 'SF',
                                        fontSize: 24,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Price: ',
                                          style: TextStyle(
                                            fontFamily: 'SF',
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '19,000 INR.',
                                          style: TextStyle(
                                            fontFamily: 'SF',
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        // navigateToNewsScreen(context);
                                        context.go('/api');
                                      },
                                      icon: Icon(Icons.get_app),
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: Colors.green,
                                        padding: EdgeInsets.all(15.0),
                                      ),
                                      label: Text(
                                        'Buy Now',
                                        style: TextStyle(
                                            fontFamily: 'SF', fontSize: 14),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () {},
                                      icon: Icon(Icons.add),
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: Colors.orange,
                                        padding: EdgeInsets.all(15.0),
                                      ),
                                      label: Text(
                                        'Add to Cart',
                                        style: TextStyle(
                                            fontFamily: 'SF', fontSize: 14),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: Icon(Icons.save),
                                      style: TextButton.styleFrom(
                                        elevation: 0,
                                        padding: EdgeInsets.all(15.0),
                                      ),
                                      label: Text(
                                        'Add to Wishlist',
                                        style: TextStyle(
                                            fontFamily: 'SF', fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: breakpoint.maxScreenWidth * 0.62,
                            height: 450,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset("lib/images/desk.jpeg"),
                              ),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: breakpoint.maxScreenWidth * 0.335,
                            child: Card(
                              elevation: 0,
                              color: Colors.green[100],
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Wooden Desk',
                                        style: TextStyle(
                                            fontFamily: 'SF',
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Made with Oak wood',
                                        style: TextStyle(
                                          fontFamily: 'SF',
                                          fontSize: 24,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Price: ',
                                            style: TextStyle(
                                              fontFamily: 'SF',
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            '19,000 INR.',
                                            style: TextStyle(
                                              fontFamily: 'SF',
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      (breakpoint.isTablet)
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ElevatedButton.icon(
                                                  onPressed: () {
                                                    // navigateToNewsScreen(
                                                    //     context);
                                                    context.go('/api');
                                                  },
                                                  icon: Icon(Icons.get_app),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    backgroundColor:
                                                        Colors.green,
                                                    padding:
                                                        EdgeInsets.all(15.0),
                                                  ),
                                                  label: Text(
                                                    'Buy Now',
                                                    style: TextStyle(
                                                        fontFamily: 'SF',
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                ElevatedButton.icon(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.add),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    backgroundColor:
                                                        Colors.orange,
                                                    padding:
                                                        EdgeInsets.all(15.0),
                                                  ),
                                                  label: Text(
                                                    'Add to Cart',
                                                    style: TextStyle(
                                                        fontFamily: 'SF',
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextButton.icon(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.save),
                                                  style: TextButton.styleFrom(
                                                    elevation: 0,
                                                    padding:
                                                        EdgeInsets.all(15.0),
                                                  ),
                                                  label: Text(
                                                    'Add to Wishlist',
                                                    style: TextStyle(
                                                        fontFamily: 'SF',
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Row(
                                              children: [
                                                ElevatedButton.icon(
                                                  onPressed: () {
                                                    // navigateToNewsScreen(
                                                    //     context);
                                                    context.go('/api');
                                                  },
                                                  icon: Icon(Icons.get_app),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    backgroundColor:
                                                        Colors.green,
                                                    padding:
                                                        EdgeInsets.all(15.0),
                                                  ),
                                                  label: Text(
                                                    'Buy Now',
                                                    style: TextStyle(
                                                        fontFamily: 'SF',
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                ElevatedButton.icon(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.add),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    backgroundColor:
                                                        Colors.orange,
                                                    padding:
                                                        EdgeInsets.all(15.0),
                                                  ),
                                                  label: Text(
                                                    'Add to Cart',
                                                    style: TextStyle(
                                                        fontFamily: 'SF',
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                TextButton.icon(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.save),
                                                  style: TextButton.styleFrom(
                                                    elevation: 0,
                                                    padding:
                                                        EdgeInsets.all(15.0),
                                                  ),
                                                  label: Text(
                                                    'Add to Wishlist',
                                                    style: TextStyle(
                                                        fontFamily: 'SF',
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 0,
                    color: Color.fromARGB(255, 201, 255, 140),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About',
                            style: TextStyle(
                              fontFamily: 'SF',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            Strings.longLorem,
                            style: TextStyle(
                              fontFamily: 'SF',
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            Strings.longLorem,
                            style: TextStyle(
                              fontFamily: 'SF',
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
