import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vorkinsta/models/box_item.dart';
import 'package:vorkinsta/models/ca_model.dart';
import 'package:vorkinsta/screens/auth/login_page.dart';
import 'package:vorkinsta/screens/auth/signup_page.dart';
import 'package:vorkinsta/values/app_colors.dart';
import 'package:vorkinsta/values/app_strings.dart';
import 'package:vorkinsta/widget/base_appbar.dart';
import 'package:vorkinsta/widget/box.dart';
import 'package:vorkinsta/widget/list_item.dart';
import 'package:vorkinsta/widget/rich_underline_text.dart';
import 'package:vorkinsta/widget/rounded_btn.dart';
import 'package:vorkinsta/widget/subscribe_edit_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

bool isCollapsed = true;

class _HomePageState extends State<HomePage> {
  final List<CaModel> caModels = [
    CaModel("Jobs", AppColors.green),
    CaModel("Resumes", AppColors.blue1),
    CaModel("Freelancers", AppColors.orange),
    CaModel("Trainings", AppColors.red),
    CaModel("Apps", AppColors.pink)
  ];

  final List<BoxItem> boxItems = [
    BoxItem(22, "MEMBERS"),
    BoxItem(41, "JOBS"),
    BoxItem(6, "RESUMES"),
    BoxItem(11, "TRAININGS"),
    BoxItem(7, "APPS"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(
        iconData: Icons.menu,
        appBar: AppBar(),
        widgets: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text(
                AppStrings.loginText,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupPage()));
              },
              child: const Text(
                AppStrings.signupText,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    RichUnderlineText(
                        text: ["Unlimited Search for", "FREE"], index: 1),
                  ],
                ),
              ),
              CarouselSlider.builder(
                itemCount: caModels.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        ListItem(
                  item: caModels[itemIndex],
                ),
                options: CarouselOptions(
                  height: 75,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  viewportFraction: 0.9,
                  aspectRatio: 2.0,
                  initialPage: 1,
                ),
              ),
              // SizedBox(
              // height: 60,
              //   child: ListView.builder(
              //       itemCount: 4,
              //       scrollDirection: Axis.horizontal,
              //       shrinkWrap: true,
              //      itemBuilder: (_, index) {
              //        return ListItem(item: caModels[index]);
              //      }),
              //  ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: Image(image: AssetImage("assets/banner.png")),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: RichUnderlineText(
                  text: ["You are ", "FREE ", "Companion to everything"],
                  index: 1,
                  size: 12,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: InkWell(
                  onTap: () async {
                    const url = "https://www.youtube.com/watch?v=7W52ICRJrqg";

                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Couldn't launch the url")));
                    }
                  },
                  child: const SizedBox(
                      height: 40,
                      width: 80,
                      child: Image(
                        image: AssetImage("assets/thumbnail.png"),
                        fit: BoxFit.contain,
                      )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const RoundedBtn(name: AppStrings.signupText),
                    const SizedBox(width: 80),
                    const RoundedBtn(name: AppStrings.loginText),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                child: Row(
                  children: boxItems
                      .map((item) => Box(
                            item: item,
                          ))
                      .toList(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 11, 16, 4),
                child: Text(
                  AppStrings.title3,
                  style: TextStyle(
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: Text(
                  AppStrings.desc,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                    color: AppColors.darkBlue,
                    fontSize: 12,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: SubscribeEditField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
