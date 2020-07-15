import 'package:flutter/material.dart';
import 'package:fluttergram/constants/size.dart';
import 'package:fluttergram/utils/profile_image_parser.dart';
import 'package:intl/intl.dart';

class Comment extends StatelessWidget {
  final String userName;
  final bool showProfile;
  final DateTime dateTime;
  final String caption;

  Comment({
    @required this.userName,
    this.showProfile = true,
    this.dateTime,
    @required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: common_gap),
        ),
        Visibility(
          visible: showProfile,
          child: CircleAvatar(
            backgroundImage: NetworkImage(getProfileImgPath(userName)),
            radius: profile_radius,
          ),
        ),
        Visibility(
          visible: showProfile,
          child: SizedBox(
            width: common_xs_gap,
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              RichText(
                text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: userName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '  '),
                      TextSpan(
                          text: '아~~~~~~~심심하다~~~~~~~~~~~~~~~휴~~길게~~~길게~~~~~'),
                    ]),
              ),
              SizedBox(
                height: common_xs_gap,

              ),
              Visibility(
                visible: dateTime != null,
                child: dateTime == null
                    ? SizedBox()
                    : Text(
                  new DateFormat("yyyy-MM-dd").format(dateTime),
                  style: TextStyle(color: Colors.grey[700], fontSize: 11),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}