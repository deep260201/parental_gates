import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GetParentPermition extends StatefulWidget {
  const GetParentPermition({super.key});

  @override
  State<GetParentPermition> createState() => _GetParentPermitionState();
}

class _GetParentPermitionState extends State<GetParentPermition> {
  List<String> oneToNine = [
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven",
    "Eight",
    "Nine"
  ];
  List<int> number = [];
  List<String> numberWord = [];
  List<int?> ansNumber = [];
  int currentIndex = 0;

  checkSuccess() {
    if (currentIndex == 3) {
      if (listEquals(number, ansNumber)) {
        Navigator.pop(context, true);
      } else {
        setNumber();
      }
    } else {
      currentIndex++;
    }
  }

  setNumber() {
    currentIndex = 0;
    number = [];
    numberWord = [];
    ansNumber = [];
    for (int i = 0; i < 4; i++) {
      int num = Random().nextInt(9) + 1;
      number.add(num);
      numberWord.add(oneToNine[num - 1]);
      ansNumber.add(null);
    }
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    setNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xfff7f5ec),
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                icon: const Icon(
                  Icons.close_rounded,
                  color: Colors.blue,
                  size: 30,
                ))
          ],
        ),
        backgroundColor: const Color(0xfff7f5ec),
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.landscape) {
              return SafeArea(
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width / 2.1,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomButton(
                                        buttonSize: 50,
                                        onTap: () {
                                          // flutterTts.speak(
                                          //     "Ask your parents To continue.");
                                        },
                                        child:
                                            const Icon(Icons.volume_up_rounded),
                                      ),
                                      const Column(
                                        children: [
                                          Text(
                                            "   Ask your parents",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "To conitune. tap:",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Text(
                                    numberWord.join(" , "),
                                    style: const TextStyle(
                                        color: Colors.blue, fontSize: 18),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      for (int i = 0; i < 4; i++)
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Column(
                                                children: [
                                                  Text(
                                                      (ansNumber[i] ?? '')
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 20,
                                                          height: 2,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Container(
                                                      height: 2.5,
                                                      width: 30,
                                                      color: Colors.blue)
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width / 2.1,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (int i = 0; i < 3; i++)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        for (int j = 1; j < 4; j++)
                                          IgnorePointer(
                                            ignoring: currentIndex > 3,
                                            child: CustomButton(
                                                child: Text("${(i * 3) + j}",
                                                    style: const TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                onTap: () {
                                                  setState(() {
                                                    ansNumber[currentIndex] =
                                                        (i * 3) + j;
                                                    checkSuccess();
                                                  });
                                                }),
                                          ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              );
            } else {
              return SafeArea(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomButton(
                                      buttonSize: 50,
                                      onTap: () {},
                                      child:
                                          const Icon(Icons.volume_up_rounded),
                                    ),
                                    const Column(
                                      children: [
                                        Text(
                                          "   Ask your parents",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "To conitune. tap:",
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 12),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                  numberWord.join(" , "),
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 18),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (int i = 0; i < 4; i++)
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Column(
                                              children: [
                                                Text(
                                                    (ansNumber[i] ?? '')
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 20,
                                                        height: 2,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Container(
                                                    height: 2.5,
                                                    width: 30,
                                                    color: Colors.blue)
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (int i = 0; i < 3; i++)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      for (int j = 1; j < 4; j++)
                                        IgnorePointer(
                                          ignoring: currentIndex > 3,
                                          child: CustomButton(
                                              child: Text("${(i * 3) + j}",
                                                  style: const TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              onTap: () {
                                                setState(() {
                                                  ansNumber[currentIndex] =
                                                      (i * 3) + j;
                                                  checkSuccess();
                                                });
                                              }),
                                        ),
                                    ],
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ));
  }
}

class CustomButton extends StatelessWidget {
  final Widget child;
  final double buttonSize;
  final Function() onTap;
  const CustomButton({
    super.key,
    this.buttonSize = 60,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          height: buttonSize,
          width: buttonSize,
          decoration: BoxDecoration(
              color: const Color(0xfff7f5ec),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.blue, width: 2),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(255, 0, 53, 97),
                    blurRadius: 0.5,
                    offset: Offset(0, 3))
              ]),
          child: child),
    );
  }
}