import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttergram/constants/size.dart';
import 'package:fluttergram/widgets/comment.dart';
import 'package:fluttergram/utils/profile_image_parser.dart';

class FeedPage extends StatelessWidget {

  Widget _iconButton(onPressed, imageUrl, color) {
    return IconButton(
      onPressed: onPressed,
      icon: ImageIcon(
        AssetImage(imageUrl),
        color: color,
      ),
    );
  }

  Widget _feedHeader(int index) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
                'https://picsum.photos/id/$index/50/50'),
            radius: 16,
          ),
        ),
        Expanded(child: Text('dahyezzing')),
        IconButton(
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black87,
          ),
          onPressed: null,
        )
      ],
    );
  }

  CachedNetworkImage _feedImage(int index) {
    return CachedNetworkImage(
      imageUrl: 'https://picsum.photos/id/$index/200/200',
      imageBuilder: (BuildContext context, ImageProvider imageProvider) {
        return AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  Row _feedAction(int index) {
    return Row(
      children: <Widget>[
        _iconButton(null, 'assets/heart_selected.png', Colors.red),
        _iconButton(null, 'assets/comment.png', Colors.black87),
        _iconButton(null, 'assets/direct_message.png', Colors.black87),
        Spacer(),
        _iconButton(null, 'assets/bookmark.png', Colors.black87),
      ],
    );
  }

  Padding _feedLikes(int index) {
    return Padding(
      padding: EdgeInsets.only(left: common_gap),
      child: Text(
        '좋아요 130개',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: _iconButton(null, 'assets/actionbar_camera.png', Colors.black87),
          title: Image.asset(//leading 영역 바로 오른쪽에 들어갈 영역
            'assets/insta_text_logo.png',
            height: 26,
          ),
          actions: <Widget>[ //앱바 오른쪽 영역에 들어갈 위젯
            _iconButton(null, 'assets/actionbar_igtv.png', Colors.black87),
            _iconButton(null, 'assets/direct_message.png', Colors.black87),
          ],

        ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _feedHeader(index),
              _feedImage(index),
              _feedAction(index),
              _feedLikes(index),
              Comment(caption: 'dd', userName: 'dahyezzing'),
            ],
          );
        },
      ),

    );
  }
}