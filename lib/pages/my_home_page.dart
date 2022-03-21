import 'package:bills_app/component/colors.dart';
import 'package:bills_app/widgets/buttons.datt.dart';
import 'package:bills_app/widgets/text_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/large_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            _listBills(),
            _payButton(),
            _textContainer(),
          ],
        ),

      ),

    );
  }
  _headSection(){
    return Container(
      height: 200,

      child: Stack(
        children: [
         _mainBackground(),
          _curveImageContainer(),
          _buttonContainer(),
        ],
      ),
    );

  }
  _buttonContainer(){
    return Positioned(
        bottom: 15,
        right: 53,
        child: GestureDetector(
          onTap: (){
            showModalBottomSheet<dynamic>(
              isScrollControlled: true,
                barrierColor: Colors.transparent,
              backgroundColor: Colors.transparent,

                context: context, builder: (BuildContext bc){
              return Container(
                height: MediaQuery.of(context).size.height-123,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                        child: Container(
                          color: Color(0xFFeef1f4).withOpacity(0.7),
                          width: MediaQuery.of(context).size.height,
                          height: MediaQuery.of(context).size.height-186,

                    )),
                    Positioned(
                      right: 53,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.only(top: 10, bottom: 25),
                        width: 60,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColor.mainColor
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppButtons(icon: Icons.cancel, iconColor: AppColor.mainColor,
                              textColor: Colors.white, backgroundColor: Colors.white,
                                onTap: (){Navigator.pop(context);} ),
                              AppButtons(icon: Icons.add, iconColor: AppColor.mainColor,
                                  textColor: Colors.white, backgroundColor: Colors.white,
                                  onTap: (){} ,text: "Add bill",),
                              AppButtons(icon: Icons.history, iconColor: AppColor.mainColor,
                                  textColor: Colors.white, backgroundColor: Colors.white,
                                  onTap: (){} , text: "History",)
                            ],
                          ) ,
                        ))

                  ],
                ),



              );
            });
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "images/lines.png"
                )
              ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: Offset(0,1),
                    color: Color(0xFF11314d).withOpacity(0.2),

                  )
                ]
            ),

          ),
        ));

  }
  _mainBackground(){
  return Positioned(
    bottom: 10,
      left: 0,
      child: Container(
        height: 190,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "images/background.png"
          )
          )
        ),
      )

  );
  }
  _curveImageContainer(){
    return  Positioned(
      left: 0,
        right: -2,
        bottom:10,
        child: Container(
          height: MediaQuery.of(context).size.height*0.13,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "images/curve.png"
                  )
              )
          ),
        )

    );
  }
  _listBills(){
    return Positioned(
      top: 185,
        left: 0,
        right: 0,
        bottom: 0,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (_, index){
              return Container(
                margin: const EdgeInsets.only(top: 20, right: 20),
                height: 130,
                width: MediaQuery.of(context).size.width-20,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30)
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFd8dbe0),
                          offset: Offset(1, 1),
                          blurRadius: 20.0,
                          spreadRadius: 10
                      )
                    ]
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 10, left: 18) ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height:60,
                                width: 60,
                                decoration: BoxDecoration(
                                  border:Border.all(
                                      width: 3,
                                      color: Colors.red
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "images/brand1.png"
                                      )
                                  ),


                                ),


                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "KenGen Power",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.mainColor
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "ID: 512",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.idColor
                                    ),
                                  )
                                ],
                              )

                            ],
                          ),

                          SizedText(text: "Auto pay on 24th of June", color: AppColor.green),
                          SizedBox(height: 5,)
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColor.selectBackground
                                ),
                                child: Center(
                                  child: Text(
                                    "Select",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.selectColor
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              Text(
                                "\R745.00",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight:FontWeight.w900 ,
                                    color: AppColor.mainColor
                                ),
                              ),
                              Text(
                                "Due in 3 days",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight:FontWeight.w700 ,
                                    color: AppColor.idColor
                                ),
                              ),
                              SizedBox(height: 10,)
                            ],
                          ),
                          SizedBox(width: 5,),
                          Container(
                            width: 5,
                            height: 35,
                            decoration: BoxDecoration(
                              color: AppColor.halfOval,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)
                              ),


                            ),
                          )


                        ],
                      )

                    ],
                  ),


                ) ,
              );
            },

          ),
        ),


    );

  }
  _payButton(){

    return Positioned(
      bottom: 10,

        child: AppLargeButton(text: 'Pay all bills',textColor: Colors.white,));
  }
  _textContainer(){
    return Stack(
      children: [
        Positioned(
            left: 0,
            top: 60,
            child: Text(
              "My Bills",
              style: TextStyle(
                  fontSize:60,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF293952)
              ),
            )),
        Positioned(
            left: 40,
            top: 50,
            child: Text(
              "My Bills",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            )),
      ],
    );
  }

}
