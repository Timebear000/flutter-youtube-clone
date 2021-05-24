import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class YoutubeBottomSheet extends StatelessWidget {
  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '만들기',
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.close),
        ),
      ],
    );
  }

  Widget _ItemButton(
      {@required String icon,
      @required double iconSize,
      @required String title,
      @required Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.3),
            ),
            child: Center(
              child: Container(
                width: iconSize,
                height: iconSize,
                child: SvgPicture.asset("assets/svg/icons/$icon.svg"),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(title),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 20),
        height: 200,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _header(),
            SizedBox(height: 10),
            _ItemButton(
              icon: "upload",
              iconSize: 17.0,
              title: "동영상 업로드",
              onTap: () {},
            ),
            SizedBox(height: 10),
            _ItemButton(
              icon: "broadcast",
              iconSize: 17.0,
              title: "실시간 스트리밍 시작",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
