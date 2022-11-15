// ignore_for_file: prefer_const_constructors_in_immutables, avoid_unnecessary_containers, library_private_types_in_public_api, must_call_super

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../application/app/contants/constants.dart';

class AppBarComponent extends StatefulWidget {
  // String chatCount = "1";

  AppBarComponent({
    Key? key,
  }) : super(key: key);

  @override
  _AppBarComponentState createState() => _AppBarComponentState();
}

class _AppBarComponentState extends State<AppBarComponent>
    with AutomaticKeepAliveClientMixin<AppBarComponent> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentroute = ModalRoute.of(context)?.settings.name;

    bool isHavenotch = MediaQuery.of(context).viewPadding.top > 5;

    // final ScrollController _homeController = new ScrollController();
    return Container(
        child: SafeArea(
      top: isHavenotch,
      child: Container(
        child: Column(
          children: [
            Container(
                height: isHavenotch == true ? 40 : 60,
                margin: EdgeInsets.only(top: isHavenotch == true ? 0 : 15),
                padding: const EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 10.0,
                ),
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(top: isHavenotch == true ? 0 : 40),
                      height: 36,
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Navigator.canPop(context) && currentroute != '/'
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Constants.black,
                                    size: 26,
                                  ),
                                )
                              : Container(),

                          /// if user click shape white in appbar navigate to search layout
                          InkWell(
                            onTap: () {
                              // Navigator.of(context).pushNamed('/search');
                              // Navigator.push(
                              //   context,
                              //   PageRouteBuilder(
                              //     pageBuilder: (_, __, ___) => SearchView(),
                              //     transitionDuration:
                              //         const Duration(seconds: 0),
                              //   ),
                              // );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 0),
                              height: 36,
                              width: MediaQuery.of(context).size.width * 0.57,
                              decoration: BoxDecoration(
                                  color: Constants.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  border: Border.all(
                                      color: Constants.gray.shade200),
                                  shape: BoxShape.rectangle),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: Constants.spacing1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 0),
                                    child: Text(
                                      ('Cari di KlikNSS'),
                                      style: TextStyle(
                                          // fontFamily: "Popins",
                                          color: Constants.gray.shade400,
                                          // fontWeight: FontWeight.m,
                                          // letterSpacing: 0.0,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          /// Icon chat (if user click navigate to chat layout)
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/inbox');
                            },
                            child: CircleAvatar(
                              radius: 19,
                              backgroundColor: Constants.white,
                              child: Stack(
                                alignment:
                                    const AlignmentDirectional(3.0, -3.0),
                                children: <Widget>[
                                  SvgPicture.asset(
                                    'assets/svg/message.svg',
                                    width: 26,
                                    height: 26,
                                    alignment: Alignment.center,
                                    color: Colors.black,
                                  ),
                                  const CircleAvatar(
                                    radius: 8.6,
                                    backgroundColor: Colors.transparent,
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                          fontSize: Constants.fontSizeXs,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          /// Icon notification (if user click navigate to notification layout)
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/notification');
                            },
                            child: CircleAvatar(
                              radius: 19,
                              backgroundColor: Constants.white,
                              child: Stack(
                                alignment:
                                    const AlignmentDirectional(3.0, -3.0),
                                children: <Widget>[
                                  SvgPicture.asset(
                                    'assets/svg/notification.svg',
                                    width: 26,
                                    height: 26,
                                    alignment: Alignment.center,
                                    color: Colors.black,
                                  ),
                                  const CircleAvatar(
                                    radius: 8.6,
                                    backgroundColor: Colors.transparent,
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                          fontSize: Constants.fontSizeXs,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/initialcart');
                            },
                            child: CircleAvatar(
                              radius: 19,
                              backgroundColor: Constants.white,
                              child: Stack(
                                alignment:
                                    const AlignmentDirectional(3.0, -3.0),
                                children: <Widget>[
                                  SvgPicture.asset(
                                    'assets/svg/cart.svg',
                                    width: 26,
                                    height: 26,
                                    alignment: Alignment.center,
                                    color: Colors.black,
                                  ),
                                  const CircleAvatar(
                                    radius: 8.6,
                                    backgroundColor: Colors.transparent,
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                          fontSize: Constants.fontSizeXs,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}
