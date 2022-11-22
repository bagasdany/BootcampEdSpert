/*
Response getbook =>
      {
          "error": "0",
          "total": "20",
          "books": [
              {
                  "title": "Game Hacking Academy",
                  "subtitle": "A Beginner&#039;s Guide to Understanding Game Hacking Techniques",
                  "isbn13": "1001668595152",
                  "price": "$0.00",
                  "image": "https://itbook.store/img/books/1001668595152.png",
                  "url": "https://itbook.store/books/1001668595152"
              },
          ]
      }

Response searchbook =>
      {
          "error": "0",
          "total": "20",
          "total": "640",
          "page": "1",
          "books": [
              {
                  "title": "Game Hacking Academy",
                  "subtitle": "A Beginner&#039;s Guide to Understanding Game Hacking Techniques",
                  "isbn13": "1001668595152",
                  "price": "$0.00",
                  "image": "https://itbook.store/img/books/1001668595152.png",
                  "url": "https://itbook.store/books/1001668595152"
              },
          ]
      }


Response detailbook =>
      {
          "error": "0",
          "title": "Game Hacking Academy",
          "subtitle": "A Beginner&#039;s Guide to Understanding Game Hacking Techniques",
          "authors": "Attilathedud",
          "publisher": "Self-publishing",
          "language": "English",
          "isbn10": "166859515X",
          "isbn13": "1001668595152",
          "pages": "511",
          "year": "2021",
          "rating": "0",
          "desc": "Hacking games requires a unique combination of reversing, memory management, networking, and security skills. Even as ethical hacking has exploded in popularity, game hacking still occupies a very small niche in the wider security community. While it may not have the same headline appeal as a Chrome...",
          "price": "$0.00",
          "image": "https://itbook.store/img/books/1001668595152.png",
          "url": "https://itbook.store/books/1001668595152",
          "pdf": {
              "Free eBook": "https://www.dbooks.org/d/5668330414-1668594823-1266792716650a6c/"
          }
      }
*/

import 'package:dio/dio.dart';
import 'package:edspert_bootcamp/application/contants/string_constants.dart';
import 'package:flutter/material.dart';

import '../application/contants/endpoint.dart';
import '../model/book_detail_response.dart';
import '../model/book_list_response.dart';

class BookControllers extends ChangeNotifier {
  final _dio = Dio(
    BaseOptions(
        baseUrl: StringConstants.baseUrl,
        connectTimeout: 10000,
        receiveTimeout: 9000),
  );
  BookListResponse? bookList;
  fetchBookApi(context) async {
    try {
      Response response = await _dio.get(Endpoint.getBook);

      var map = response.data;
      var res = BookListResponse.fromJson(map);
      bookList = res;
      notifyListeners();
    } on DioError catch (error) {
      if (error.type == DioErrorType.connectTimeout ||
          error.type == DioErrorType.receiveTimeout ||
          error.message.contains("SocketException: Failed")) {
        var snackBar =
            const SnackBar(content: Text("Periksa Koneksi Internet Anda"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        //Kirim CrashAnalytics ..
      }
    } on NoSuchMethodError catch (e) {
      //Kirim CrashAnalytics ..
      var snackBar = SnackBar(content: Text("kode error $e"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FormatException catch (e) {
      //Kirim CrashAnalytics ..
      var snackBar = SnackBar(content: Text("kode error $e"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  BookDetailResponse? detailBook;
  fetchDetailBookApi(isbn, context) async {
    try {
      Response response = await _dio.get("${Endpoint.detailBook}/$isbn");

      var map = response.data;
      var res = BookDetailResponse.fromJson(map);
      detailBook = res;
      notifyListeners();
      await fetchSimiliarBookApi(detailBook!.title!, context);
    } on DioError catch (error) {
      if (error.type == DioErrorType.connectTimeout ||
          error.type == DioErrorType.receiveTimeout ||
          error.message.contains("SocketException: Failed")) {
        var snackBar =
            const SnackBar(content: Text("Periksa Koneksi Internet Anda"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        //Kirim CrashAnalytics ..
      }
    } on NoSuchMethodError catch (e) {
      //Kirim CrashAnalytics ..
      var snackBar = SnackBar(content: Text("kode error $e"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FormatException catch (e) {
      //Kirim CrashAnalytics ..
      var snackBar = SnackBar(content: Text("kode error $e"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  BookListResponse? similiarBooks;
  fetchSimiliarBookApi(String title, context) async {
    try {
      Response response = await _dio.get("${Endpoint.searchBook}/$title");
      var map = response.data;
      var res = BookListResponse.fromJson(map);
      similiarBooks = res;
      notifyListeners();
    } on DioError catch (error) {
      if (error.type == DioErrorType.connectTimeout ||
          error.type == DioErrorType.receiveTimeout ||
          error.message.contains("SocketException: Failed")) {
        var snackBar =
            const SnackBar(content: Text("Periksa Koneksi Internet Anda"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        //Kirim CrashAnalytics ..
      }
    } on NoSuchMethodError catch (e) {
      //Kirim CrashAnalytics ..
      var snackBar = SnackBar(content: Text("kode error $e"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FormatException catch (e) {
      //Kirim CrashAnalytics ..
      var snackBar = SnackBar(content: Text("kode error $e"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
