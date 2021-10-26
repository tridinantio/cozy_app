import 'package:cozy/pages/home_page.dart';
import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          bottom: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/Icons/404.png",
                  width: MediaQuery.of(context).size.width - (2 * margin),
                  height: 86,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Where are you going?",
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  "Seems like the page that you were\nrequested is already gone",
                  style: greyTextStyle.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    height: 50,
                    width: 210,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17))),
                        child: Text(
                          "Back to Home",
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        })),
              ],
            ),
          )),
    );
  }
}
