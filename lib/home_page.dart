import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> operatorsColors = [
    const Color(0xFF252525),
    const Color(0xFF252525),
    const Color(0xFF252525),
    const Color(0xFF252525)
  ];
  List<String> results = [];

  int operator = -1;

  TextEditingController firstNumberCntr = TextEditingController(),
      secondNumberCntr = TextEditingController();

  TextStyle resultsTextStyle = const TextStyle(
      color: Colors.white, fontSize: 17, decoration: TextDecoration.underline);

  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.black,
              child: Material(
                color: Colors.transparent,
                elevation: 100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Container(
                  width: 450,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xFF222222),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: results.isEmpty
                        ? Text(
                            'No action has been selected yet.',
                            textAlign: TextAlign.start,
                            style: resultsTextStyle,
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 198),
                            child: Column(
                              children: [
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: results.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      results[index],
                                      style: resultsTextStyle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
              child: TextFormField(
                controller: firstNumberCntr,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Enter...',
                    hintStyle: TextStyle(
                        fontSize: 14, color: Colors.white.withOpacity(0.5)),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Color(0xFF747474))),
                    labelText: "First Number",
                    labelStyle: const TextStyle(
                        fontSize: 14, color: Color(0xFF303030))),
                style: const TextStyle(fontSize: 14, color: Color(0xFF303030)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
              child: TextFormField(
                controller: secondNumberCntr,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Enter...',
                    hintStyle: TextStyle(
                        fontSize: 14, color: Colors.white.withOpacity(0.5)),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Color(0xFF747474))),
                    labelText: "Second Number",
                    labelStyle: const TextStyle(
                        fontSize: 14, color: Color(0xFF303030))),
                style: const TextStyle(fontSize: 14, color: Color(0xFF303030)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                width: 390,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: operatorsColors[0],
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 28,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Add',
                          style: TextStyle(
                            color: operatorsColors[0],
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 260),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 2, color: Colors.white)),
                          child: Visibility(
                            visible: operator == 0 ? true : false,
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                onClickOperator(0);
                operator = 0;
              },
            ),
            GestureDetector(
              child: Container(
                width: 390,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: operatorsColors[1],
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 28,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Substract',
                          style: TextStyle(
                            color: operatorsColors[1],
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 225),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 2, color: Colors.white)),
                          child: Visibility(
                            visible: operator == 1 ? true : false,
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                onClickOperator(1);
                operator = 1;
              },
            ),
            GestureDetector(
              child: Container(
                width: 390,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: operatorsColors[2],
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 28,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Multiply',
                          style: TextStyle(
                            color: operatorsColors[2],
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 235),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 2, color: Colors.white)),
                          child: Visibility(
                            visible: operator == 2 ? true : false,
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                onClickOperator(2);
                operator = 2;
              },
            ),
            GestureDetector(
              child: Container(
                width: 390,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: operatorsColors[3],
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.keyboard_arrow_up_sharp,
                        color: Colors.white,
                        size: 28,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Divide',
                          style: TextStyle(
                            color: operatorsColors[3],
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 248),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 2, color: Colors.white)),
                          child: Visibility(
                            visible: operator == 3 ? true : false,
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                onClickOperator(3);
                operator = 3;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Container(
                    width: 170,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF222222),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        'Clear',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                  onTap: () => clear(),
                ),
                GestureDetector(
                  child: Container(
                    width: 170,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF222222),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        'Calculate',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                  onTap: () => calculate(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onClickOperator(int index) {
    disableOtherBorderColors(index);
    setState(() {
      operatorsColors[index] = Colors.white;
    });
  }

  void disableOtherBorderColors(int index) {
    for (int i = 0; i < 4; i++) {
      if (i != index) {
        operatorsColors[i] = const Color(0xFF252525);
      }
    }
  }

  clear() {
    operatorsColors = [
      const Color(0xFF252525),
      const Color(0xFF252525),
      const Color(0xFF252525),
      const Color(0xFF252525)
    ];
    results.clear();
    operator = -1;
    firstNumberCntr.text = "";
    setState(() {
      secondNumberCntr.text = "";
    });
  }

  calculate() {
    String firstNumberStr = firstNumberCntr.text;
    String secondNumberStr = secondNumberCntr.text;
    if (firstNumberStr.isNotEmpty && secondNumberStr.isNotEmpty) {
      double firstNumber = double.parse(firstNumberStr);
      double secondNumber = double.parse(secondNumberStr);
      double result;

      switch (operator) {
        case 0:
          result = firstNumber + secondNumber;
          break;
        case 1:
          result = firstNumber - secondNumber;
          break;
        case 2:
          result = firstNumber * secondNumber;
          break;
        case 3:
          result = firstNumber / secondNumber;
          break;
        default:
          return;
      }

      if (results.length == 5) {
        results.removeAt(0);
      }
      setState(() {
        results.add(result.toStringAsFixed(2));
      });
    }
  }
}
