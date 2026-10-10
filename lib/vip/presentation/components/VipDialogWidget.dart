import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/utils/SizeConfig.dart';
import 'package:ahlachat/core/utils/images.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSliderDialog extends StatefulWidget {
  int currentIndex;
  ImageSliderDialog({required this.currentIndex});
  @override
  _ImageSliderDialogState createState() => _ImageSliderDialogState();
}

class _ImageSliderDialogState extends State<ImageSliderDialog> {




  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 270,
              width: SizeConfig.screenWidth,
              child: PageView.builder(
                controller: PageController(initialPage:widget.currentIndex , keepPage: true, viewportFraction: 1),

                itemCount: vipAssetsContent.length,
                onPageChanged: (index) {
                  setState(() {
                    widget.currentIndex = index;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return Column(mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(child: CachedNetworkImage(
                        imageUrl:vipAssetsContent[index].Image ,
                        fit: BoxFit.fill,
                      ), ),
                      SizedBox(height: 30),
                      Text(vipAssetsContent[index].MainTitle,style: StyleTitleB.copyWith(fontSize: 22)),
                      SizedBox(height: 15),
                      Text(vipAssetsContent[index].Content,style: StyleTitleG.copyWith(fontSize: 12),textAlign: TextAlign.center),

                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < vipAssetsContent.length; i++)
                  if (i == widget.currentIndex)
                    Indicator(active: true)
                  else
                    Indicator(active: false)
              ],
            ),
            SizedBox(height: 30),
            InkWell(onTap: () => Navigator.pop(context),
              child: Container(
                height: 50,
                child: Center(child: Text(getLang( context: context,key: "Close"),style: StyleTitleVip,)),
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: VipGradiant
                ),


              ),
            ),


          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final bool active;

  const Indicator({ this.active = false}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Color(0xFFc5a485) : Colors.grey,
      ),
    );
  }
}

void showImageSliderDialog({required BuildContext context,required int Index}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ImageSliderDialog(currentIndex: Index);
    },
  );
}
