import 'package:edspert_bootcamp/application/contants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/component/shimmer_component.dart';
import '../../../controller/book_controllers.dart';
import 'detail_book_page.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  BookControllers? bookControllers;

  @override
  void initState() {
    super.initState();
    bookControllers = Provider.of<BookControllers>(context, listen: false);
    bookControllers!.fetchBookApi(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Constants.black,
          ),
        ),
        shadowColor: Colors.transparent,
        title: const Text(
          "Book Catalogue",
          style: TextStyle(color: Constants.black),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          bookControllers =
              Provider.of<BookControllers>(context, listen: false);
          return bookControllers!.fetchBookApi(context);
        },
        child: Consumer<BookControllers>(
          child: ShimmerListPage(
            bookList: bookControllers!.bookList,
          ),
          builder: (context, controllers, child) => Container(
            child: bookControllers!.bookList == null
                ? child
                : ListView.builder(
                    itemCount: bookControllers!.bookList!.books!.length,
                    itemBuilder: (context, index) {
                      final currentBook =
                          bookControllers!.bookList!.books![index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailBookPage(
                                isbn: currentBook.isbn13!,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          color: Constants.white,
                          margin:
                              const EdgeInsets.only(top: Constants.spacing2),
                          padding: const EdgeInsets.all(Constants.spacing4),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: SizedBox(
                                  child: Image.network(
                                    currentBook.image ?? "",
                                    fit: BoxFit.contain,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: child);
                                      }
                                      return SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Constants.gray.shade200,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(
                                                          Constants.spacing3))),
                                        ),
                                      );
                                    },
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Constants.gray.shade200,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(
                                                          Constants.spacing3))),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    currentBook.title == null
                                        ? Container()
                                        : Text(
                                            currentBook.title ?? "",
                                            style: const TextStyle(),
                                          ),
                                    currentBook.subtitle == null ||
                                            currentBook.subtitle == ""
                                        ? Container()
                                        : Container(
                                            margin: const EdgeInsets.only(
                                                top: Constants.spacing1),
                                            child: Text(
                                              currentBook.subtitle ?? "",
                                              style: const TextStyle(
                                                  color: Constants.gray,
                                                  fontSize:
                                                      Constants.fontSizeSm),
                                            ),
                                          ),
                                    const SizedBox(height: Constants.spacing2),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          currentBook.price!,
                                          style: const TextStyle(
                                            fontSize: Constants.fontSizeLg,
                                            fontFamily:
                                                Constants.primaryFontBold,
                                            color: Constants.primaryColor,
                                          ),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
