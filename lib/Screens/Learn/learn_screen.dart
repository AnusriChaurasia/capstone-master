import 'package:capstone/Screens/Learn/detailed_screen.dart';
import 'package:capstone/Screens/Learn/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Learn extends StatefulWidget {
  Learn({Key key}) : super(key: key);
  @override
  _LearnState createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //bottomNavigationBar: AppBottomNav(),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(alignment: Alignment.centerLeft,image: AssetImage("assets/images/undraw_pilates_gpdb.png"),),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(color: Color(0xFFF2BEA1),shape: BoxShape.circle,),
                      child: SvgPicture.asset("assets/icons/menu.svg"),),
                  ),
                  Text(
                    "Hey Learner!! \n",
                    style: Theme.of(context).textTheme.headline3.copyWith(fontWeight: FontWeight.w900),),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Budgeting ",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) {return DetailsScreen();}),);
                          },
                        ),
                        CategoryCard(
                          title: "Saving",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) {return DetailsScreen();}),);
                          },
                        ),
                        CategoryCard(
                          title: "Financial Institution",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) {return DetailsScreen();}),);
                          },
                        ),
                        CategoryCard(
                          title: "Credit",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) {return DetailsScreen();}),);
                          },
                        ),
                        CategoryCard(
                          title: "Debt",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Identity Theft",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Life Events",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Investment",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
