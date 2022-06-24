import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int activeIndex = 0;
  final urlImages = [
    'https://static01.nyt.com/images/2018/02/11/us/11dc-pelosi/11dc-pelosi-jumbo.jpg?quality=75&auto=webp',
    'https://static01.nyt.com/images/2017/06/26/opinion/26chiraWeb/26chiraWeb-jumbo.jpg?quality=75&auto=webp',
    'https://s.abcnews.com/images/General/pelosi-office-breach-arrest-richard-barnett-02-sh-llr-210107_1610132367804_hpMain_16x9_992.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: SizedBox(
          width: double.infinity,
          child: Image.asset(
            'assets/images/nytlogo.png',
            height: 30.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notification_add,
              color: Colors.black,
            ),
            onPressed: () {
              print('presionado');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Updated: ',
                  style: TextStyle(color: Colors.black38),
                ),
                Text(
                  DateFormat('yMMMMd').format(DateTime.now()),
                ),
                const Text(
                  ' at ',
                  style: TextStyle(color: Colors.black38),
                ),
                Text(
                  DateFormat('jm').format(DateTime.now()),
                ),
              ],
            ),
          ),
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 200,
              onPageChanged: (index, reason) =>
                  setState((() => activeIndex = index)),
            ),
            itemCount: urlImages.length,
            itemBuilder: (context, index, realIndex) {
              final urlImage = urlImages[index];

              return buildImage(urlImage, index);
            },
          ),
          const SizedBox(height: 10),
          buildIndicator(),
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Title(
                  color: Colors.black,
                  child: const Text(
                    'Pelosi Wants to Win House, but Can she Corral The Democrats?',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ListTile(
                  leading: MyBullet(),
                  title: const Text(
                    'At 77, Representative Nancy Pelosi remains a dominant, but polarizing, figure in Washington.',
                  ),
                ),
                ListTile(
                  leading: MyBullet(),
                  title: const Text(
                    "How she bridges Democrats' factions on inmigration may help determine whther she can lead her party to a majority",
                  ),
                ),
                ListTile(
                  leading: const Text(
                    '2h ago',
                    style: TextStyle(color: Colors.black26),
                  ),
                  trailing: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.bookmark,
                          color: Colors.blueAccent,
                        ),
                        Icon(
                          Icons.ios_share,
                          color: Colors.blueAccent,
                        ),
                      ]),
                ),
              ],
            ),
          ),
          const Divider(
            height: 5.0,
            thickness: 2.0,
            indent: 100.0,
            endIndent: 100.0,
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              children: [
                Title(
                  color: Colors.black,
                  child: const Text(
                    'Analysis: G.O.P. Squirms as Trump Veers Off Script With Abuse Remarks',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        effect: const SlideEffect(
            spacing: 8.0,
            radius: 4.0,
            dotWidth: 24.0,
            dotHeight: 8.0,
            paintStyle: PaintingStyle.stroke,
            strokeWidth: 1.5,
            dotColor: Colors.grey,
            activeDotColor: Colors.indigo),
      );
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.0,
      width: 5.0,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
