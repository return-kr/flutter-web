// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pdp_flutter/constant.dart';
import 'package:pdp_flutter/model/NewsModel.dart';
import 'package:pdp_flutter/news_response_stream.dart';
import 'dart:developer';

class ApiCallScreen extends StatefulWidget {
  const ApiCallScreen({Key? key}) : super(key: key);

  @override
  State<ApiCallScreen> createState() => _ApiCallScreenState();
}

class _ApiCallScreenState extends State<ApiCallScreen> {
  final newsResponseStream = NewsResponseStream();

  void getAllNews() async {
    final newsResponse = await http.get(Uri.parse(Strings.apiUrl));
    if (newsResponse.statusCode == 200) {
      newsResponseStream.newsSink
          .add(NewsModel.fromJson(jsonDecode(newsResponse.body)));
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  void dispose() {
    super.dispose();
    newsResponseStream.dispose();
  }

  @override
  void initState() {
    super.initState();
    getAllNews();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('PDP Flutter'),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        body: SafeArea(
          child: StreamBuilder<NewsModel>(
            stream: newsResponseStream.newsStream,
            initialData: null,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.articles?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${snapshot.data?.articles![index].title}',
                            style: TextStyle(
                              fontFamily: 'SF',
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800],
                              fontSize: 40,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: Image.network(
                                "${snapshot.data?.articles![index].urlToImage}"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                '${snapshot.data?.articles![index].author}',
                                style:
                                    TextStyle(fontFamily: 'SF', fontSize: 17),
                              ),
                              Spacer(),
                              Text(
                                '${snapshot.data?.articles![index].publishedAt}',
                                style:
                                    TextStyle(fontFamily: 'SF', fontSize: 17),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${snapshot.data?.articles![index].content}',
                            style: TextStyle(
                                fontFamily: 'SF',
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${snapshot.data?.articles![index].description}',
                            style: TextStyle(
                                fontFamily: 'SF',
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                debugPrint('apiSnapshotError_debug: ${snapshot.error}');
                log('apiSnapshotError_debug: ${snapshot.error}');
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
