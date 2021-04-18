import 'package:bar_social_app/screens/login_register_screen.dart';
import 'package:bar_social_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          /*SizedBox.expand(
            child: Image.asset(
              "assets/welcome_screen/bar-background.jpg",
              fit: BoxFit.cover,
            ),
          ),*/
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.3,
              child: Column(
                children: [
                  Expanded(
                    child: WelcomeTitle(),
                  ),
                  Expanded(
                    flex: 2,
                    child: WelcomeCarrousel(),
                  ),
                  WelcomeButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bienvenido a SocialBar",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          "Una red social con mucha diversión",
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}

final List<Map> carrouselData = [
  {
    "image_text": "Conoce gente nueva",
    "image_url": "assets/welcome_screen/page_1.png"
  },
  {
    "image_text": "Compite con otros",
    "image_url": "assets/welcome_screen/page_2.png"
  },
  {
    "image_text": "Gana dinero jugando",
    "image_url": "assets/welcome_screen/page_3.png"
  }
];

class WelcomeCarrousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        for (Map content in carrouselData)
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 120,
                child: Image.asset(content["image_url"]),
              ),
              const SizedBox(height: 20),
              Text(
                content["image_text"],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          )
      ],
    );
  }
}

class WelcomeButton extends StatefulWidget {
  @override
  _WelcomeButtonState createState() => _WelcomeButtonState();
}

class _WelcomeButtonState extends State<WelcomeButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 55,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      onPressed: () => Navigator.of(context)
          .push(CupertinoPageRoute(builder: (_) => LoginRegisterScreen())),
      color: secondaryColor,
      child: Text(
        "Comenzar",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }
}
