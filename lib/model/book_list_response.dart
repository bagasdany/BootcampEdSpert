// To parse this JSON data, do
//
//     final BookListResponse = BookListResponseFromJson(jsonString);

import 'dart:convert';

BookListResponse welcomeFromJson(String str) =>
    BookListResponse.fromJson(json.decode(str));

String welcomeToJson(BookListResponse data) => json.encode(data.toJson());

class BookListResponse {
  BookListResponse({
    this.error,
    this.total,
    this.books,
  });

  String? error;
  String? total;
  List<Book>? books;

  factory BookListResponse.fromJson(Map<String, dynamic> json) =>
      BookListResponse(
        error: json["error"],
        total: json["total"],
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "total": total,
        "books": List<dynamic>.from(books!.map((x) => x.toJson())),
      };

  void add(BookListResponse getbook) {}
}

class Book {
  Book({
    this.title,
    this.subtitle,
    this.isbn13,
    this.price,
    this.image,
    this.url,
  });

  String? title;
  String? subtitle;
  String? isbn13;
  String? price;
  String? image;
  String? url;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json["title"],
        subtitle: json["subtitle"],
        isbn13: json["isbn13"],
        price: json["price"],
        image: json["image"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "isbn13": isbn13,
        "price": price,
        "image": image,
        "url": url,
      };
}
