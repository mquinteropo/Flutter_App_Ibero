import 'package:flutter_app_testing_ibero/models/news.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  String UrlForApi(optionUrl) {
    switch (optionUrl) {
      //All articles about Tesla from the last month, sorted by recent first
      case 1:
        return 'https://newsapi.org/v2/everything?q=apple&from=2021-02-21&to=2021-02-21&sortBy=popularity&apiKey=f5411eeab72d4c92adfc9957d6d40537';
      //Top business headlines in the US right now
      case 2:
        return 'https://newsapi.org/v2/everything?q=tesla&from=2021-01-22&sortBy=publishedAt&apiKey=f5411eeab72d4c92adfc9957d6d40537';
      //All articles mentioning Apple from yesterday, sorted by popular publishers first
      case 3:
        return 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f5411eeab72d4c92adfc9957d6d40537';
      //Top headlines from TechCrunch right now
      case 4:
        return 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f5411eeab72d4c92adfc9957d6d40537';
      //All articles published by the Wall Street Journal in the last 6 months, sorted by recent first
      case 5:
        return 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=f5411eeab72d4c92adfc9957d6d40537';
    }
  }

  GetDio({@required int optionUrl}) async {
    var dio = Dio();

    Response response = await dio.get(UrlForApi(optionUrl));

    if (response.statusCode == 200) {
      return NewsApiModel.fromjson(response.data);
    } else {
      print('Algo ha salido mal');
    }
  }
}
