import 'package:calculator_app/constants.dart';
import 'package:calculator_app/scale_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  
  // bool isSwitched = true;
  // List<Color> colorList = [
  //   const Color(0xff17171C),
  //   const Color(0xffFFFFFF),
  //   const Color(0xff4E505F),
  //   const Color(0xff2E2F38),
  // ];

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       backgroundColor: colorList[0],
  //       body: SafeArea(
  //         child: ListView(
  //           padding: const EdgeInsets.only(bottom: 50, right: 20, left: 20),
  //           children: [
  //             Center(
  //               child: Column(
  //                 children: <Widget>[
  //                   Switch(
  //                     value: isSwitched,
  //                     onChanged: (value) {
  //                       setState(() {
  //                         isSwitched = value;
  //                         if (isSwitched) {
  //                           colorList = [
  //                             const Color(0xff17171C),
  //                             const Color(0xffFFFFFF),
  //                             const Color(0xff4E505F),
  //                             const Color(0xff2E2F38),
  //                           ];
  //                         } else {
  //                           colorList = [
  //                             const Color(0xffF1F2F3),
  //                             const Color(0xff000000),
  //                             const Color(0xffD2D3DA),
  //                             const Color(0xffD2D3DA),
  //                           ];
  //                         }
  //                       });
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Container(
  //               margin: const EdgeInsets.only(top: 50, bottom: 16),
  //               alignment: Alignment.bottomRight,
  //               width: 300,
  //               height: 48,
  //               child: const Text(
  //                 "6.291-5",
  //                 style: TextStyle(
  //                     fontSize: 40,
  //                     fontWeight: FontWeight.normal,
  //                     color: Color(0xff747477)),
  //               ),
  //             ),
  //             Container(
  //               alignment: Alignment.bottomRight,
  //               width: 300,
  //               height: 96,
  //               child: Text(
  //                 "6.291-5",
  //                 style: TextStyle(
  //                     fontSize: 96,
  //                     fontWeight: FontWeight.normal,
  //                     color: colorList[1]),
  //               ),
  //             ),
  //             _buttonRow("C", "±", "%", "÷", colorList[2]),
  //             _buttonRow("7", "8", "9", "×", colorList[3]),
  //             _buttonRow("4", "5", "6", "-", colorList[3]),
  //             _buttonRow("1", "2", "3", "+", colorList[3]),
  //             _buttonRow(".", "0", "⌫", "=", colorList[3]),
  //           ],
  //         ),
  //       ));
  // }

  // Row _buttonRow(String a, String b, String c, String d, Color color) {
  //   return Row(
  //     children: [
  //       Expanded(
  //         child: Container(
  //           margin: const EdgeInsets.only(top: 16),
  //           padding: const EdgeInsets.all(12),
  //           alignment: Alignment.center,
  //           height: 72,
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(24), color: color),
  //           child: Text(
  //             a,
  //             style: const TextStyle(color: Colors.white, fontSize: 32),
  //           ),
  //         ),
  //       ),
  //       Expanded(
  //         child: Container(
  //           margin: const EdgeInsets.only(left: 20, top: 16),
  //           padding: const EdgeInsets.all(12),
  //           alignment: Alignment.center,
  //           height: 72,
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(24), color: color),
  //           child: Text(
  //             b,
  //             style: const TextStyle(color: Colors.white, fontSize: 32),
  //           ),
  //         ),
  //       ),
  //       Expanded(
  //         child: Container(
  //           margin: const EdgeInsets.only(left: 20, top: 16),
  //           alignment: Alignment.center,
  //           height: 72,
  //           padding: const EdgeInsets.all(12),
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(24), color: color),
  //           child: Text(
  //             c,
  //             style: const TextStyle(color: Colors.white, fontSize: 32),
  //           ),
  //         ),
  //       ),
  //       Expanded(
  //         child: Container(
  //           margin: const EdgeInsets.only(left: 20, top: 16),
  //           alignment: Alignment.center,
  //           height: 72,
  //           padding: const EdgeInsets.all(12),
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(24),
  //               color: const Color(0xff4B5EFC)),
  //           child: Text(
  //             d,
  //             style: const TextStyle(color: Colors.white, fontSize: 32),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }


 Alignment dayAlign = Alignment.centerLeft;
  Alignment nightAlign = Alignment.centerRight;
  Alignment switchAlign = Alignment.centerLeft;
   final editController = TextEditingController();
   final resultController = TextEditingController();
  Color bgClr = nightBgClr;
  Color numClr = numbersClr;
  Color numTxtClr = white;
  Color resultClr = white;
  Color actRowClr = nightactionsClmnClr;
  Color switchClr = switchBtnBgClr;
  Color switchColor = switchBtnClr;
  double  resultFontSize(double size)=> size * 0.08;
  String expression = "";


    

  changeTheme() {
    setState(() {
      if (switchAlign == dayAlign) {
        switchAlign = nightAlign;
        bgClr = lightBgClr;
        numClr = white;
        numTxtClr = black;
        resultClr = black;
        actRowClr = actionsLightRowClr;
        switchClr = white;
        switchColor = actionsLightRowClr;
      } else {
        switchAlign = dayAlign;
        bgClr = nightBgClr;
        numClr = numbersClr;
        numTxtClr = white;
        resultClr = white;
        actRowClr = nightactionsClmnClr;
        switchClr = switchBtnBgClr;
        switchColor = switchBtnClr;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: bgClr,
      statusBarBrightness: switchAlign == dayAlign? Brightness.dark : Brightness.light,
    ));
    return Scaffold(
      backgroundColor: bgClr,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: size.width * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: switchClr,
                ),
                child: Stack(
                  children: [
                    AnimatedContainer(
                      alignment: dayAlign,
                      duration: const Duration(seconds: 1),
                      child: Icon(
                        Icons.sunny,
                        color: actionsClmnnClr,
                        size: size.height * 0.04,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: nightAlign,
                      duration: const Duration(seconds: 1),
                      child: Icon(
                        Icons.mode_night_outlined,
                        color: actionsClmnnClr,
                        size: size.height * 0.04,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: switchAlign,
                      duration: const Duration(milliseconds: 500),
                      child: InkWell(
                        onTap: () {
                          changeTheme();
                        },
                        child: Container(
                          width: size.height * 0.04,
                          height: size.height * 0.04,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: switchColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.04),
                child:  TextField(
                   controller: resultController,
                  decoration:  const InputDecoration(
                    hintText: "0",
                    hintStyle: TextStyle(color: Colors.white30),
                    border: InputBorder.none
                  ),
                  readOnly: true,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: lastAction,
                      fontSize: size.height * 0.04,
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextField(
                  controller:editController,
                  decoration:  const InputDecoration(
                    hintText: "0",
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none
                  ),
                  readOnly: true,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: resultClr,
                      fontSize: resultFontSize(size.height) ,
                    ),
                )
              ),
              GridView.count(
                padding: const EdgeInsets.symmetric(vertical: 15),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: size.height * 0.0016,
                crossAxisCount: 4,
                primary: false,
                children: [
                  button(actRowClr, "C", numTxtClr),
                  button(actRowClr, "+/-", numTxtClr),
                  button(actRowClr, "%", numTxtClr),
                  button(actionsClmnnClr, "÷", white),
                  button(numClr, "7", numTxtClr),
                  button(numClr, "8", numTxtClr),
                  button(numClr, "9", numTxtClr),
                  button(actionsClmnnClr, "x", white),
                  button(numClr, "4", numTxtClr),
                  button(numClr, "5", numTxtClr),
                  button(numClr, "6", numTxtClr),
                  button(actionsClmnnClr, "-", white),
                  button(numClr, "1", numTxtClr),
                  button(numClr, "2", numTxtClr),
                  button(numClr, "3", numTxtClr),
                  button(actionsClmnnClr, "+", white),
                  button(numClr, ".", numTxtClr),
                  button(numClr, "0", numTxtClr),
                  button(numClr, "⌫", numTxtClr),
                  button(actionsClmnnClr, "=", white),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  

  Widget button(Color bgclr, String text, Color numTxtClr) {
    return scaleWidget(
      onTap: ()=>  btnOnClick(text),
      scale: 0.7,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgclr,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: numTxtClr,
          ),
        ),
      ),
    );
  }
  
  btnOnClick(String text) {
    setState(() {
      if(text == "C"){
        resultController.text = '0';
        editController.text = "0";
      }else if( text == "+/-"){
        editController.text = "${double.parse(resultat(resultController.text))*(-1)}";
        resultController.text=editController.text;
      }else if( text == "%"){
        editController.text = "${double.parse(resultat(resultController.text))/100}";
        resultController.text=editController.text;
      }else if( text == "."){
        editController.text = "${double.parse(resultat(resultController.text))/100}";
      }else if(text == '⌫'){
        resultController.text = resultController.text.substring(0, resultController.text.length-1);
        if(resultController.text==""){
          resultController.text="0";
          editController.text='0';
        }
        editController.text = resultat(resultController.text);
      }else if( text == "=" ){      
          try{
            editController.text = resultat(resultController.text);
          }catch(e){
            editController.text = "EROR";
            resultController.text='0';
          }
          resultController.text=editController.text;
      }else{
        if(resultController.text == '0'){
          resultController.text= text;
        }else{
          resultController.text += text;
          var a=int.parse(text);
           editController.text="";
            if(0<=a && a<=9){
              if(resultController.text.contains('+') || resultController.text.contains('-') || resultController.text.contains('÷') || resultController.text.contains('x')) {
                editController.text+=resultat(resultController.text);
              }else{
              editController.text+=text;
              }
          }
        }
      }
    });
  }
  
  String resultat(String text) {
     expression = resultController.text;
     expression = expression.replaceAll('÷','/');
       expression = expression.replaceAll('x','*');
        Parser p = Parser();
            Expression exp = p.parse(expression);
            ContextModel cm = ContextModel();
            return "${exp.evaluate(EvaluationType.REAL, cm)}";
  }


}
