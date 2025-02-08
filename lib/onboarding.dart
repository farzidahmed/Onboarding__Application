import 'package:flutter/material.dart';
import 'package:testing_application/content_model.dart';
import 'package:testing_application/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: contents.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(contents[index].images),
                      Text(
                        contents[index].titile,
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        contents[index].discription,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  contents.length,
                  (index) => Container(
                        height: 10,
                        width: currentIndex == index ? 25 : 10,
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.tealAccent),
                      )),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(40),
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.tealAccent),
                      onPressed: () {
                        if (currentIndex == contents.length - 1) {}
                        _controller.previousPage(
                            duration: Duration(microseconds: 100),
                            curve: Curves.bounceIn);
                      },
                      child: Text("skip")),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(40),
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.tealAccent),
                      onPressed: () {
                        if (currentIndex == contents.length - 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        }
                        _controller.nextPage(
                            duration: Duration(microseconds: 100),
                            curve: Curves.bounceIn);
                      },
                      child: Text(currentIndex == contents.length - 1
                          ? "Continue"
                          : "Next")),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
