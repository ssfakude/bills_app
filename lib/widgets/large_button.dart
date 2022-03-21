import 'package:bills_app/component/colors.dart';
import 'package:flutter/cupertino.dart';

class AppLargeButton extends StatelessWidget {
  final Color?  backgrondColor;
  final Color? textColor;
  final Function()? onTap;
  final String text;
  final bool? isBorder;
  const AppLargeButton({Key? key, this.backgrondColor:AppColor.mainColor, this.isBorder:false, this.onTap, this.textColor,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        height: 60,
        width: MediaQuery.of(context).size.width-60,
        decoration: BoxDecoration(
          color: backgrondColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: AppColor.mainColor
          )
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: textColor
            ),
          ),
        ),
      ),
    );
  }
}
