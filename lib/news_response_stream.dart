import 'dart:async';

import 'package:pdp_flutter/model/NewsModel.dart';

class NewsResponseStream {
  final _newsResponseController = StreamController<NewsModel>.broadcast();
  StreamSink<NewsModel> get newsSink => _newsResponseController.sink;
  Stream<NewsModel> get newsStream => _newsResponseController.stream;

  void dispose() {
    _newsResponseController.close();
  }
}