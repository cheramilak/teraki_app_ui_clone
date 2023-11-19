import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:teraki_app_ui/models/book_model.dart';
import 'package:teraki_app_ui/providers/theme_provider.dart';
import 'package:teraki_app_ui/screens/book_detail.dart';
import 'package:teraki_app_ui/utils/slider_wiget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themProvider = Provider.of<ThemeProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: IconButton(
              icon: Icon(
                themProvider.isDark ? Icons.dark_mode_outlined : Icons.sunny,
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
        title: Container(
            child: Image.asset(
          'assets/images/logo.png',
          width: 70,
          fit: BoxFit.fill,
        )),
        centerTitle: true,
        backgroundColor: themProvider.isDark ? black : white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.height,
            Container(
                height: size.height * 0.3,
                width: double.infinity,
                child: const SliderMovie(mSliderList: [
                  'assets/images/images14.jpeg',
                  'assets/images/images18.jpeg',
                  'assets/images/e.jpeg',
                  'assets/images/images1.jpeg'
                ])),
            10.height,
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Recent',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            8.height,
            Container(
              height: size.height * 0.27,
              margin: const EdgeInsets.only(left: 5),
              child: ListView.builder(
                  itemCount: _recent.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      width: size.width * 0.3,
                      margin: const EdgeInsets.only(left: 10),
                      child: BookItem(model: _recent[index]).onTap(() {
                        BookDetailScreen(model: _recent[index]).launch(context);
                      }),
                    );
                  }),
            ),
            10.height,
            Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Popular',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    'See all',
                    style: secondaryTextStyle(color: blueColor),
                  ),
                ],
              ),
            ),
            8.height,
            Container(
              height: size.height * 0.27,
              margin: const EdgeInsets.only(left: 5),
              child: ListView.builder(
                  itemCount: _bookItem3.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      width: size.width * 0.3,
                      margin: const EdgeInsets.only(left: 10),
                      child: BookItem(model: _bookItem3[index]).onTap((){
                         BookDetailScreen(model: _bookItem3[index]).launch(context);
                      }),
                    );
                  }),
            ),
            10.height,
            Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Education',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    'See all',
                    style: secondaryTextStyle(color: blueColor),
                  ),
                ],
              ),
            ),
            8.height,
            Container(
              height: size.height * 0.27,
              margin: const EdgeInsets.only(left: 5),
              child: ListView.builder(
                  itemCount: _bookItem1.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      width: size.width * 0.3,
                      margin: const EdgeInsets.only(left: 10),
                      child: BookItem(model: _bookItem1[index]).onTap((){
                         BookDetailScreen(model: _bookItem1[index]).launch(context);
                      }),
                    );
                  }),
            ),
            10.height,
            Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Recent',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    'See all',
                    style: secondaryTextStyle(color: blueColor),
                  ),
                ],
              ),
            ),
            8.height,
            Container(
              height: size.height * 0.27,
              margin: const EdgeInsets.only(left: 5),
              child: ListView.builder(
                  itemCount: _bookItem2.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      width: size.width * 0.3,
                      margin: const EdgeInsets.only(left: 10),
                      child: BookItem(model: _bookItem2[index]).onTap((){
                         BookDetailScreen(model: _bookItem2[index]).launch(context);
                      }),
                    );
                  }),
            ),
            10.height,
            Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent',
                    style: boldTextStyle(),
                  ),
                  Text(
                    'See all',
                    style: secondaryTextStyle(color: blueColor),
                  ),
                ],
              ),
            ),
            8.height,
            Container(
              height: size.height * 0.27,
              margin: const EdgeInsets.only(left: 5),
              child: ListView.builder(
                  itemCount: _bookItem3.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      width: size.width * 0.3,
                      margin: const EdgeInsets.only(left: 10),
                      child: BookItem(model: _bookItem3[index]).onTap((){
                         BookDetailScreen(model: _bookItem3[index]).launch(context);
                      }),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  late final List<BookModel> _recent = [
    BookModel(
        title: 'ፍቅር እስከ መቃብር',
        author: ' ሀዲስ ዓለማየሁ ',
        image: 'images3.jpg',
        isFree: true,
        rate: '4.5'),
    BookModel(
        title: 'የተቆለፈበት ቁልፍ',
        author: ' ምህረት ደበበ ',
        image: 'images11.jpg',
        isFree: false,
        rate: '4,7'),
    BookModel(
        title: 'እሳት ወይ አበባ',
        author: 'ፀጋዬ ገብረ መድኅን',
        image: 'images.jpg',
        isFree: false,
        rate: '4.4'),
    BookModel(
        title: 'ኦሮማይ',
        author: 'በዓሉ ግርማ',
        image: 'images21.jpg',
        isFree: true,
        rate: '5,0'),
    BookModel(
        title: 'ሰመመን',
        author: 'ሲሳይ ንጉሱ',
        image: 'images22.jpg',
        isFree: false,
        rate: '4.4'),
    BookModel(
        title: 'ልጅነት',
        author: 'ዘነበ ወላ',
        image: 'images23.jpg',
        isFree: true,
        rate: '5.0'),
    BookModel(
        title: 'እቴሜቴ ሎሚ ሽታ',
        author: 'አዳም ረታ',
        image: 'images24.jpg',
        isFree: false,
        rate: '4.6'),
    BookModel(
        title: 'ብርቅርቅታ',
        author: 'ዓቢይ ደምሴ',
        image: 'images25.jpg',
        isFree: true,
        rate: '5.0'),
    BookModel(
        title: 'እንቅልፍ እና ዕድሜ',
        author: 'በዕውቀቱ ስዩም',
        image: 'images26.jpg',
        isFree: true,
        rate: '4.8'),
    BookModel(
        title: 'የጋዜጠኛው ማስታወሻ',
        author: 'ተስፋዬ ገብረአብ',
        image: 'images27.jpg',
        isFree: false,
        rate: '4.3'),
    BookModel(
        title: 'አልወለድም',
        author: 'አቤ ጉበኛ',
        image: 'images28.jpg',
        isFree: false,
        rate: '3.4'),
    BookModel(
        title: 'ለራስ የተጻፈ ደብዳቤ',
        author: 'ደበበ ሰይፉ',
        image: 'images29.jpg',
        isFree: false,
        rate: '4.5'),
    BookModel(
        title: 'ተከርቸም',
        author: 'ይስማዕከ ወርቁ',
        image: 'images30.jpg',
        isFree: true,
        rate: '4.6')
  ];

  late final List<BookModel> _bookItem1 = [
    BookModel(
        title: 'ተከርቸም',
        author: 'ይስማዕከ ወርቁ',
        image: 'images30.jpg',
        isFree: false,
        rate: '4.6'),
    BookModel(
        title: 'አልወለድም',
        author: 'አቤ ጉበኛ',
        image: 'images28.jpg',
        isFree: false,
        rate: '4.6'),
    BookModel(
        title: 'ለራስ የተጻፈ ደብዳቤ',
        author: 'ደበበ ሰይፉ',
        image: 'images29.jpg',
        isFree: false,
        rate: '4.6'),
    BookModel(
        title: 'የጋዜጠኛው ማስታወሻ',
        author: 'ተስፋዬ ገብረአብ',
        image: 'images27.jpg',
        isFree: false,
        rate: '4.6'),
    BookModel(
        title: 'አልወለድም',
        author: 'አቤ ጉበኛ',
        image: 'images28.jpg',
        isFree: false,
        rate: '4.6'),
    BookModel(
        title: 'ለራስ የተጻፈ ደብዳቤ',
        author: 'ደበበ ሰይፉ',
        image: 'images29.jpg',
        isFree: false,
        rate: '4.6'),
    BookModel(
        title: 'ተከርቸም',
        author: 'ይስማዕከ ወርቁ',
        image: 'images30.jpg',
        isFree: false,
        rate: '4.6'),
    BookModel(
        title: 'ፍቅር እስከ መቃብር',
        author: ' ሀዲስ ዓለማየሁ ',
        image: 'images3.jpg',
        isFree: false,
        rate: '4.9'),
    BookModel(
        title: 'የተቆለፈበት ቁልፍ',
        author: ' ምህረት ደበበ ',
        image: 'images11.jpg',
        isFree: true,
        rate: '4.9'),
    BookModel(
        title: 'እሳት ወይ አበባ',
        author: 'ፀጋዬ ገብረ መድኅን',
        image: 'images.jpg',
        isFree: true,
        rate: '4.6'),
    BookModel(
        title: 'ኦሮማይ',
        author: 'በዓሉ ግርማ',
        image: 'images21.jpg',
        isFree: true,
        rate: '4.5'),
    BookModel(
        title: 'ሰመመን',
        author: 'ሲሳይ ንጉሱ',
        image: 'images22.jpg',
        isFree: true,
        rate: '4.5'),
    BookModel(
        title: 'ልጅነት',
        author: 'ዘነበ ወላ',
        image: 'images23.jpg',
        isFree: true,
        rate: '4.5'),
    BookModel(
        title: 'እቴሜቴ ሎሚ ሽታ',
        author: 'አዳም ረታ',
        image: 'images24.jpg',
        isFree: false,
        rate: '4.6'),
    BookModel(
        title: 'ብርቅርቅታ',
        author: 'ዓቢይ ደምሴ',
        image: 'images25.jpg',
        isFree: false,
        rate: '4.6'),
    BookModel(
        title: 'እንቅልፍ እና ዕድሜ',
        author: 'በዕውቀቱ ስዩም',
        image: 'images26.jpg',
        isFree: false,
        rate: '5.0'),
    BookModel(
        title: 'የጋዜጠኛው ማስታወሻ',
        author: 'ተስፋዬ ገብረአብ',
        image: 'images27.jpg',
        isFree: false,
        rate: '5.0'),
    BookModel(
        title: 'አልወለድም',
        author: 'አቤ ጉበኛ',
        image: 'images28.jpg',
        isFree: true,
        rate: '4.4'),
    BookModel(
        title: 'ለራስ የተጻፈ ደብዳቤ',
        author: 'ደበበ ሰይፉ',
        image: 'images29.jpg',
        isFree: true,
        rate: '4.4'),
    BookModel(
        title: 'ተከርቸም',
        author: 'ይስማዕከ ወርቁ',
        image: 'images30.jpg',
        isFree: true,
        rate: '4.6')
  ];

  late final List<BookModel> _bookItem2 = [
    BookModel(
        title: 'እቴሜቴ ሎሚ ሽታ',
        author: 'አዳም ረታ',
        image: 'images24.jpg',
        isFree: true,
        rate: '5.0'),
    BookModel(
        title: 'ብርቅርቅታ',
        author: 'ዓቢይ ደምሴ',
        image: 'images25.jpg',
        isFree: true,
        rate: '5.0'),
    BookModel(
        title: 'እንቅልፍ እና ዕድሜ',
        author: 'በዕውቀቱ ስዩም',
        image: 'images26.jpg',
        isFree: true,
        rate: '5.0'),
    BookModel(
        title: 'የጋዜጠኛው ማስታወሻ',
        author: 'ተስፋዬ ገብረአብ',
        image: 'images27.jpg',
        isFree: true,
        rate: '5.0'),
    BookModel(
        title: 'ፍቅር እስከ መቃብር',
        author: ' ሀዲስ ዓለማየሁ ',
        image: 'images3.jpg',
        isFree: true,
        rate: '4.9'),
    BookModel(
        title: 'አልወለድም',
        author: 'አቤ ጉበኛ',
        image: 'images28.jpg',
        isFree: true,
        rate: '4.9'),
    BookModel(
        title: 'ለራስ የተጻፈ ደብዳቤ',
        author: 'ደበበ ሰይፉ',
        image: 'images29.jpg',
        isFree: false,
        rate: '4.9'),
    BookModel(
        title: 'ተከርቸም',
        author: 'ይስማዕከ ወርቁ',
        image: 'images30.jpg',
        isFree: false,
        rate: '5.0'),
    BookModel(
        title: 'የተቆለፈበት ቁልፍ',
        author: ' ምህረት ደበበ ',
        image: 'images11.jpg',
        isFree: false,
        rate: '5.0'),
    BookModel(
        title: 'እሳት ወይ አበባ',
        author: 'ፀጋዬ ገብረ መድኅን',
        image: 'images.jpg',
        isFree: false,
        rate: '5.0'),
    BookModel(
        title: 'ኦሮማይ',
        author: 'በዓሉ ግርማ',
        image: 'images21.jpg',
        isFree: true,
        rate: '4.6'),
    BookModel(
        title: 'ሰመመን',
        author: 'ሲሳይ ንጉሱ',
        image: 'images22.jpg',
        isFree: false,
        rate: '4.6'),
    BookModel(
        title: 'ልጅነት',
        author: 'ዘነበ ወላ',
        image: 'images23.jpg',
        isFree: false,
        rate: '4.6'),
    BookModel(
        title: 'እቴሜቴ ሎሚ ሽታ',
        author: 'አዳም ረታ',
        image: 'images24.jpg',
        isFree: true,
        rate: '5.0'),
    BookModel(
        title: 'ብርቅርቅታ',
        author: 'ዓቢይ ደምሴ',
        image: 'images25.jpg',
        isFree: true,
        rate: '4.2'),
    BookModel(
        title: 'እንቅልፍ እና ዕድሜ',
        author: 'በዕውቀቱ ስዩም',
        image: 'images26.jpg',
        isFree: true,
        rate: '4.2'),
    BookModel(
        title: 'የጋዜጠኛው ማስታወሻ',
        author: 'ተስፋዬ ገብረአብ',
        image: 'images27.jpg',
        isFree: true,
        rate: '4.2'),
    BookModel(
        title: 'አልወለድም',
        author: 'አቤ ጉበኛ',
        image: 'images28.jpg',
        isFree: true,
        rate: '5.0'),
    BookModel(
        title: 'ለራስ የተጻፈ ደብዳቤ',
        author: 'ደበበ ሰይፉ',
        image: 'images29.jpg',
        isFree: true,
        rate: '5.0'),
    BookModel(
        title: 'ተከርቸም',
        author: 'ይስማዕከ ወርቁ',
        image: 'images30.jpg',
        isFree: true,
        rate: '5.0')
  ];

  late final List<BookModel> _bookItem3 = [
    BookModel(
        title: 'ሰመመን',
        author: 'ሲሳይ ንጉሱ',
        image: 'images22.jpg',
        isFree: true,
        rate: '5.0'),
        BookModel(
        title: 'እንቅልፍ እና ዕድሜ',
        author: 'በዕውቀቱ ስዩም',
        image: 'images26.jpg',
        isFree: true,
        rate: '5.0'),
    BookModel(
        title: 'የጋዜጠኛው ማስታወሻ',
        author: 'ተስፋዬ ገብረአብ',
        image: 'images27.jpg',
        isFree: false,
        rate: '5.0'),
    BookModel(
        title: 'እቴሜቴ ሎሚ ሽታ',
        author: 'አዳም ረታ',
        image: 'images24.jpg',
        isFree: false,
        rate: '4.0'),
    BookModel(
        title: 'ልጅነት',
        author: 'ዘነበ ወላ',
        image: 'images23.jpg',
        isFree: true,
        rate: '5.0'),
    BookModel(
        title: 'እሳት ወይ አበባ',
        author: 'ፀጋዬ ገብረ መድኅን',
        image: 'images.jpg',
        isFree: true,
        rate: '5.0'),
    BookModel(
        title: 'ኦሮማይ',
        author: 'በዓሉ ግርማ',
        image: 'images21.jpg',
        isFree: true,
        rate: '5.0'),
    BookModel(
        title: 'ብርቅርቅታ',
        author: 'ዓቢይ ደምሴ',
        image: 'images25.jpg',
        isFree: true,
        rate: '4.0'),
    BookModel(
        title: 'እቴሜቴ ሎሚ ሽታ',
        author: 'አዳም ረታ',
        image: 'images24.jpg',
        isFree: true,
        rate: '5.0'),
    BookModel(
        title: 'ብርቅርቅታ',
        author: 'ዓቢይ ደምሴ',
        image: 'images25.jpg',
        isFree: false,
        rate: '3.9'),
    BookModel(
        title: 'እንቅልፍ እና ዕድሜ',
        author: 'በዕውቀቱ ስዩም',
        image: 'images26.jpg',
        isFree: false,
        rate: '4.9'),
    BookModel(
        title: 'የጋዜጠኛው ማስታወሻ',
        author: 'ተስፋዬ ገብረአብ',
        image: 'images27.jpg',
        isFree: false,
        rate: '3.9'),
    BookModel(
        title: 'ፍቅር እስከ መቃብር',
        author: ' ሀዲስ ዓለማየሁ ',
        image: 'images3.jpg',
        isFree: false,
        rate: '4.6'),
    BookModel(
        title: 'አልወለድም',
        author: 'አቤ ጉበኛ',
        image: 'images28.jpg',
        isFree: false,
        rate: '3.9'),
    BookModel(
        title: 'ለራስ የተጻፈ ደብዳቤ',
        author: 'ደበበ ሰይፉ',
        image: 'images29.jpg',
        isFree: true,
        rate: '5.0'),
    BookModel(
        title: 'ተከርቸም',
        author: 'ይስማዕከ ወርቁ',
        image: 'images30.jpg',
        isFree: true,
        rate: '4.4'),
    BookModel(
        title: 'የተቆለፈበት ቁልፍ',
        author: ' ምህረት ደበበ ',
        image: 'images11.jpg',
        isFree: false,
        rate: '4.4'),
    BookModel(
        title: 'አልወለድም',
        author: 'አቤ ጉበኛ',
        image: 'images28.jpg',
        isFree: false,
        rate: '5.0'),
    BookModel(
        title: 'ለራስ የተጻፈ ደብዳቤ',
        author: 'ደበበ ሰይፉ',
        image: 'images29.jpg',
        isFree: true,
        rate: '5.0'),
    BookModel(
        title: 'ተከርቸም',
        author: 'ይስማዕከ ወርቁ',
        image: 'images30.jpg',
        isFree: true,
        rate: '4.9')
  ];
}

class BookItem extends StatelessWidget {
  final BookModel model;
  const BookItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theProvider = Provider.of<ThemeProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/' + model.image,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: gray,
                    child: Text(
                      'Free',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: theProvider.isDark ? black : white),
                    ),
                  ).visible(model.isFree),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      margin: const EdgeInsets.only(left: 3),
                      color: gray,
                      child: Row(
                        children: [
                          Text(
                            model.rate,
                            style: TextStyle(
                                fontSize: 13,
                                color: theProvider.isDark ? black : white),
                          ),
                          2.width,
                          const Icon(
                            Icons.star_rate,
                            size: 15,
                            color: white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          child: Text(
            model.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.people,
              color: blueColor,
              size: 15,
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              child: Text(
                model.author,
                style: secondaryTextStyle(),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        )
      ],
    );
  }
}
