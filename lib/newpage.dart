import 'dart:math';

import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
      lowerBound: 0,
      upperBound: pi * 2,
    );
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).popAndPushNamed('/');
        },
        child: const Icon(Icons.home),
      ),
      backgroundColor: Colors.indigo,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: const Alignment(0, -0.80),
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 100),
                    height: 250,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${res['name']}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "${res['nickname']}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            const SizedBox(width: 40),
                            const Icon(
                              Icons.location_pin,
                              color: Colors.grey,
                            ),
                            Text(
                              "${res['km']}",
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.compare_arrows_outlined,
                              color: Colors.grey,
                            ),
                            Text(
                              "${res['de']}",
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(width: 40),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AnimatedBuilder(
                    animation: animationController,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 300,
                              width: double.infinity,
                              color: Colors.indigo.shade400,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage("${res['image']}"),
                                    radius: 60,
                                    backgroundColor: Colors.transparent,
                                  ),
                                  Text(
                                    "${res['km']}",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Text(
                                    "${res['de']}",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Image(
                        image: AssetImage('${res['image']}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    builder: (context, widget) {
                      return Transform.rotate(
                        angle: animationController.value,
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: widget,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Text(
              "OVERVIEW",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "${res['description']}",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
