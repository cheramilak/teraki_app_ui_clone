import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:teraki_app_ui/models/book_model.dart';

import '../providers/theme_provider.dart';

class BookDetailScreen extends StatefulWidget {
  final BookModel model;
  const BookDetailScreen({super.key, required this.model});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final themProvider = Provider.of<ThemeProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: themProvider.isDark ? black : white,
            title: Text(
              widget.model.title,
              style: TextStyle(color: black),
              overflow: TextOverflow.ellipsis,
            ),
            shadowColor: Colors.transparent.withOpacity(0.1),
            leading: Padding(
              padding: EdgeInsets.only(left: 5),
              child: IconButton(
                onPressed: () {
                  finish(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: blueColor,
                ),
              ),
            ),
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 300,
            actions: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: IconButton(
                  icon: Icon(
                    themProvider.isDark
                        ? Icons.dark_mode_outlined
                        : Icons.sunny,
                    color: blueColor,
                  ),
                  onPressed: () {
                    themProvider.setDarkMode = !themProvider.isDark;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: const Icon(
                  Icons.search_outlined,
                  color: blueColor,
                ),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              background: Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/' + widget.model.image,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Container(
                        width: size.width - 30,
                        margin:
                            EdgeInsets.only(left: 10, bottom: 15, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.model.title,
                              style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            20.height,
                            Row(
                              children: [
                                const Icon(
                                  Icons.people,
                                  color: white,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  child: Text(
                                    widget.model.author,
                                    style: TextStyle(color: white),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            10.height,
                            Row(
                              children: [
                                const Icon(
                                  Icons.record_voice_over,
                                  color: white,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  child: Text(
                                    'narrate by',
                                    style: TextStyle(color: white),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            10.height,
                            Row(
                              children: [
                                const Icon(
                                  Icons.category,
                                  color: white,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  child: Text(
                                    'category',
                                    style: TextStyle(color: white),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            10.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: widget.model.rate.toDouble() > 0
                                          ? yellow
                                          : gray,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: widget.model.rate.toDouble() > 1
                                          ? yellow
                                          : gray,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: widget.model.rate.toDouble() > 2
                                          ? yellow
                                          : gray,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: widget.model.rate.toDouble() > 3
                                          ? yellow
                                          : gray,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: widget.model.rate.toDouble() > 4
                                          ? yellow
                                          : gray,
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border:
                                        Border.all(color: blueColor, width: 1),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.share,
                                        color: blueColor,
                                      ),
                                      10.width,
                                      Text(
                                        'SHARE',
                                        style: TextStyle(color: blueColor),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
              hasScrollBody: true,
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    toolbarHeight: 0,
                    backgroundColor: themProvider.isDark ? black : white,
                    bottom: TabBar(
                        indicatorColor: blueColor,
                        labelColor: blueColor,
                        unselectedLabelColor:
                            themProvider.isDark ? white : black,
                        tabs: [
                          Tab(
                            icon: Icon(
                              Icons.info_outline,
                              color: blueColor,
                            ),
                            text: 'About',
                          ),
                          Tab(
                            icon: Icon(
                              Icons.message_outlined,
                              color: blueColor,
                            ),
                            text: 'Reviews',
                          )
                        ]),
                  ),
                  body: TabBarView(children: [
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            15.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border:
                                        Border.all(color: blueColor, width: 1),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.play_arrow,
                                        color: blueColor,
                                      ),
                                      15.width,
                                      Text(
                                        'Play Sample',
                                        style: TextStyle(
                                            color: blueColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      5.width
                                    ],
                                  ),
                                ),
                                15.width,
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.blueAccent),
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Text(
                                      'Buy',
                                      style: TextStyle(color: whiteColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            10.height,
                            Text(
                              'Description',
                              style: TextStyle(
                                  color: blueColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'qwertyuiop[asdfghjklzxcvbnmsdfghj ertyui gfds oiuytrew kjhgfdsa qwertyuiop[asdfghjklzxcvbnmsdfghj ertyui gfds oiuytrew kjhg nbvcx iuytrew hgfds gfds jhgfds uytr',
                              style: secondaryTextStyle(),
                            ),
                            10.height,
                            Text(
                              'Detail',
                              style: TextStyle(
                                  color: blueColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            8.height,
                            Container(
                              margin: EdgeInsets.only(left: 30, right: 100),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.timelapse_sharp,
                                        color: blueColor,
                                      ),
                                      15.width,
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Duration',
                                            style: TextStyle(
                                                color: blueColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          5.height,
                                          Text(
                                            '2h 43m:05s',
                                            style: secondaryTextStyle(),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.playlist_play_outlined,
                                        color: blueColor,
                                      ),
                                      15.width,
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Chapters',
                                            style: TextStyle(
                                                color: blueColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          5.height,
                                          Text(
                                            '12',
                                            style: secondaryTextStyle(),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            30.height,
                            Container(
                              margin: EdgeInsets.only(left: 30, right: 90),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.language,
                                        color: blueColor,
                                      ),
                                      15.width,
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Language',
                                            style: TextStyle(
                                                color: blueColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          5.height,
                                          Text(
                                            'English',
                                            style: secondaryTextStyle(),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.calendar_month_outlined,
                                        color: blueColor,
                                      ),
                                      15.width,
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Upload Data',
                                            style: TextStyle(
                                                color: blueColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          5.height,
                                          Text(
                                            '2023-11-09',
                                            style: secondaryTextStyle(),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            15.height,
                            Text(
                              'Authors',
                              style: TextStyle(
                                  color: blueColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            10.height,
                            Card(
                              elevation: 5,
                              child: Container(
                                height: 70,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 5, bottom: 5),
                                child: Row(children: [
                                  Icon(
                                    Icons.person,
                                    color: gray,
                                    size: 50,
                                  ),
                                  5.width,
                                  Expanded(
                                    child: Text(
                                      widget.model.author,
                                      style: TextStyle(
                                          color: blueColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios_outlined)
                                ]),
                              ),
                            ),
                            15.height,
                            Text(
                              'Narrators',
                              style: TextStyle(
                                  color: blueColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            10.height,
                            Card(
                              elevation: 5,
                              child: Container(
                                height: 70,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 5, bottom: 5),
                                child: Row(children: [
                                  Icon(
                                    Icons.person,
                                    color: gray,
                                    size: 50,
                                  ),
                                  5.width,
                                  Expanded(
                                    child: Text(
                                      'Narrators',
                                      style: TextStyle(
                                          color: blueColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios_outlined)
                                ]),
                              ),
                            ),
                            15.height,
                            Text(
                              'Publisher',
                              style: TextStyle(
                                  color: blueColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            10.height,
                            Text(
                              'teraki',
                              style: secondaryTextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Card(
                        elevation: 5,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    widget.model.rate,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '/ 5',
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                              Text('Based on 50 reviews'),
                              10.height,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: widget.model.rate.toDouble() > 0
                                        ? yellow
                                        : gray,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: widget.model.rate.toDouble() > 1
                                        ? yellow
                                        : gray,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: widget.model.rate.toDouble() > 2
                                        ? yellow
                                        : gray,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: widget.model.rate.toDouble() > 3
                                        ? yellow
                                        : gray,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: widget.model.rate.toDouble() > 4
                                        ? yellow
                                        : gray,
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    )
                  ]),
                ),
              )),
        ],
      ),
    );
  }
}
