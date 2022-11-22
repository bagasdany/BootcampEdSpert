import 'package:edspert_bootcamp/application/component/app_shimmer.dart';
import 'package:edspert_bootcamp/application/component/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

import '../../../application/component/image_view_screen.dart';
import '../../../application/contants/constants.dart';
import '../../../controller/book_controllers.dart';

class DetailBookPage extends StatefulWidget {
  const DetailBookPage({
    super.key,
    required this.isbn,
  });
  final String isbn;

  @override
  State<DetailBookPage> createState() => _DetailBookPageState();
}

class _DetailBookPageState extends State<DetailBookPage> {
  BookControllers? controllers;

  @override
  void initState() {
    super.initState();
    controllers = Provider.of<BookControllers>(context, listen: false);
    controllers!.fetchDetailBookApi(widget.isbn, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, BookControllers bControllers, child) {
            return Text(
              controllers?.detailBook?.title ?? "",
              style: const TextStyle(
                color: Constants.black,
                overflow: TextOverflow.fade,
              ),
            );
          },
        ),
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
        actions: [
          Container(
            margin: const EdgeInsets.only(right: Constants.spacing4),
            child: IconButton(
              icon: const Icon(
                Icons.share_outlined,
                color: Constants.black,
                size: 30,
              ),
              onPressed: () {
                Share.share(
                    "https://api.itbook.store/1.0/books/${controllers!.detailBook!.isbn13!}");
              },
            ),
          )
        ],
      ),
      body: Consumer<BookControllers>(builder: (context, controllers, child) {
        return controllers.detailBook == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ImageViewScreen(
                                      imageUrl: controllers.detailBook!.image!),
                                ),
                              );
                            },
                            child: AppShimmer(
                              active: controllers.detailBook == null,
                              child: SizedBox(
                                height: 200,
                                width: 200,
                                child: SizedBox(
                                  child: Image.network(
                                    controllers.detailBook!.image ?? "",
                                    fit: BoxFit.contain,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return SizedBox(
                                            height: 200,
                                            width: 200,
                                            child: child);
                                      }
                                      return SizedBox(
                                        height: 200,
                                        width: 200,
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
                                        height: 200,
                                        width: 200,
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
                            ),
                            // Image.network(
                            //   controllers.detailBook!.image!,
                            //   height: 200,
                            // ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: Constants.spacing4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controllers.detailBook!.title ?? "",
                                    style: const TextStyle(
                                        fontSize: Constants.fontSizeLg,
                                        fontFamily: Constants.primaryFontBold),
                                  ),
                                  Text(
                                    controllers.detailBook!.authors!,
                                    style: const TextStyle(
                                      color: Constants.gray,
                                    ),
                                  ),
                                  const SizedBox(height: Constants.spacing2),
                                  Row(
                                    children: List.generate(
                                      5,
                                      (index) => Icon(
                                        Icons.star,
                                        color: index <
                                                int.parse(controllers
                                                    .detailBook!.rating!)
                                            ? Colors.yellow
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    controllers.detailBook!.subtitle ?? "",
                                    style: const TextStyle(
                                      fontFamily: Constants.primaryFontBold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    controllers.detailBook!.price!,
                                    style: const TextStyle(
                                      fontSize: Constants.fontSizeLg,
                                      fontFamily: Constants.primaryFontBold,
                                      color: Constants.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: Constants.spacing4),
                      SizedBox(
                          width: double.infinity,
                          child: Button2(
                              text: "Buy",
                              onPressed: () async {
                                dynamic uri = Uri.parse(
                                    controllers.detailBook!.url ??
                                        "google.com");
                                try {
                                  (await canLaunchUrl(uri))
                                      ? launchUrl(uri)
                                      : debugPrint("Tidak berhasil navigasi");
                                } catch (e) {
                                  debugPrint("error");
                                }
                              })),
                      const SizedBox(height: Constants.spacing4),
                      Text(controllers.detailBook!.desc ?? ""),
                      const SizedBox(height: Constants.spacing4),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Year : ${controllers.detailBook!.year ?? ""}"),
                          Text("ISBN ${controllers.detailBook!.isbn13 ?? ""}"),
                          Text("${controllers.detailBook!.pages ?? ""} Page"),
                          Text(
                              "Publisher : ${controllers.detailBook!.publisher ?? ""}"),
                          Text(
                              "Language : ${controllers.detailBook!.language ?? ""}"),
                        ],
                      ),
                      const SizedBox(height: Constants.spacing4),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          Text(
                            "Similar",
                            style: TextStyle(
                                color: Constants.gray,
                                fontFamily: Constants.primaryFontBold),
                          ),
                        ],
                      ),
                      controllers.similiarBooks == null
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              height: 180,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    controllers.similiarBooks!.books!.length,
                                itemBuilder: (context, index) {
                                  final current =
                                      controllers.similiarBooks!.books![index];
                                  return SizedBox(
                                    width: 100,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailBookPage(
                                              isbn: current.isbn13!,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          // Image.network(
                                          //   current.image!,
                                          //   height: 100,
                                          // ),
                                          AppShimmer(
                                            active:
                                                controllers.detailBook == null,
                                            child: SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: SizedBox(
                                                child: Image.network(
                                                  current.image ?? "",
                                                  fit: BoxFit.contain,
                                                  loadingBuilder:
                                                      (BuildContext context,
                                                          Widget child,
                                                          ImageChunkEvent?
                                                              loadingProgress) {
                                                    if (loadingProgress ==
                                                        null) {
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
                                                            color: Constants
                                                                .gray.shade200,
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius.circular(
                                                                        Constants
                                                                            .spacing3))),
                                                      ),
                                                    );
                                                  },
                                                  errorBuilder: (BuildContext
                                                          context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                    return SizedBox(
                                                      height: 100,
                                                      width: 100,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Constants
                                                                .gray.shade200,
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius.circular(
                                                                        Constants
                                                                            .spacing3))),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            current.title!,
                                            maxLines: 3,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
