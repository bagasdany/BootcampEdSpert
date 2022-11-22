// ignore_for_file: must_be_immutable

import 'package:edspert_bootcamp/application/component/app_shimmer.dart';
import 'package:flutter/material.dart';

import '../../model/book_list_response.dart';
import '../contants/constants.dart';

class ShimmerListPage extends StatelessWidget {
  BookListResponse? bookList;
  ShimmerListPage({Key? key, required this.bookList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          color: Constants.white,
          margin: const EdgeInsets.only(top: Constants.spacing2),
          padding: const EdgeInsets.all(Constants.spacing4),
          child: Row(
            children: [
              AppShimmer(
                active: bookList == null,
                child: Container(
                  margin: const EdgeInsets.only(right: Constants.spacing4),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: SizedBox(
                      child: Image.network(
                        "",
                        fit: BoxFit.contain,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return SizedBox(
                                height: 100, width: 100, child: child);
                          }
                          return SizedBox(
                            height: 100,
                            width: 100,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Constants.gray.shade200,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(Constants.spacing3))),
                            ),
                          );
                        },
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return SizedBox(
                            height: 100,
                            width: 100,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Constants.gray.shade200,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(Constants.spacing3))),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bookList == null
                        ? AppShimmer(
                            active: bookList == null,
                            child: Container(
                              padding: const EdgeInsets.all(0),
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Container(
                                color: Constants.gray,
                                child: const Text(
                                  "",
                                  style: TextStyle(),
                                ),
                              ),
                            ))
                        : const Text(
                            "",
                            style: TextStyle(),
                          ),
                    Container(
                      margin: const EdgeInsets.only(top: Constants.spacing1),
                      child: bookList == null
                          ? AppShimmer(
                              active: bookList == null,
                              child: Container(
                                padding: const EdgeInsets.all(0),
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Container(
                                  color: Constants.gray,
                                  child: const Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: Constants.fontSizeSm),
                                  ),
                                ),
                              ))
                          : const Text(
                              "",
                              style: TextStyle(
                                  color: Constants.gray,
                                  fontSize: Constants.fontSizeSm),
                            ),
                    ),
                    const SizedBox(height: Constants.spacing2),
                    Align(
                        alignment: Alignment.topLeft,
                        child: bookList == null
                            ? AppShimmer(
                                active: bookList == null,
                                child: Container(
                                  padding: const EdgeInsets.all(0),
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Container(
                                    color: Constants.gray,
                                    child: const Text(
                                      "",
                                      style: TextStyle(
                                        fontSize: Constants.fontSizeLg,
                                        fontFamily: Constants.primaryFontBold,
                                        color: Constants.primaryColor,
                                      ),
                                    ),
                                  ),
                                ))
                            : const Text(
                                "",
                                style: TextStyle(
                                  fontSize: Constants.fontSizeLg,
                                  fontFamily: Constants.primaryFontBold,
                                  color: Constants.primaryColor,
                                ),
                              )),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
