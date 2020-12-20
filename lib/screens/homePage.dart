import 'package:flutter/material.dart';

List userData = [
  {
    "photo":
        "https://cdn.pixabay.com/photo/2017/06/13/12/53/profile-2398782_1280.png",
    "userName": "Sijal Swift",
    "postDate": "Sep 01 2020",
    "postDescription":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
    "hashTags": "#happy #smile #fun_loving #flutter #happy_learning",
    "postImage": "https://i.ytimg.com/vi/iZVojrtRy18/maxresdefault.jpg",
    "reacts": "63K",
    "comments": "60K",
    "shares": "110K",
  },
  {
    "photo":
        "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png",
    "userName": "Jacky Jacky",
    "postDate": "Apr 14 2020",
    "postDescription":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
    "hashTags": "#happy #smile #fun_loving #flutter #happy_learning",
    "postImage":
        "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/eggs-breakfast-avocado-1296x728-header.jpg",
    "reacts": "120K",
    "comments": "100K",
    "shares": "50K",
  },
  {
    "photo":
        "https://cdn1.iconfinder.com/data/icons/avatar-97/32/avatar-02-512.png",
    "userName": "John Shah",
    "postDate": "Dec 10 2020",
    "postDescription":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
    "hashTags": "#happy #smile #fun_loving #flutter #happy_learning",
    "postImage":
        "https://hikinggurus.com/wp-content/uploads/2016/08/hiking-gurus-best-trekking-poles.jpg",
    "reacts": "15K",
    "comments": "450K",
    "shares": "200K",
  },
  {
    "photo":
        "https://storage.googleapis.com/webdesignledger.pub.network/WDL/maxresdefault-970x546.jpg",
    "userName": "Juna Shrestha",
    "postDate": "Jan 24 2020",
    "postDescription":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
    "hashTags": "#happy #smile #fun_loving #flutter #happy_learning",
    "postImage":
        "https://cdn.cultofmac.com/wp-content/uploads/2020/07/D9687021-373A-4E27-9458-A968A28B5030.jpeg",
    "reacts": "28K",
    "comments": "40K",
    "shares": "54K",
  },
  {
    "photo":
        "https://www.unigreet.com/wp-content/uploads/2020/04/Sweet-girl-dp-1024x999.jpg",
    "userName": "Jeff",
    "postDate": "Jul 20 2020",
    "postDescription":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
    "postImage":
        "https://media.mlive.com/sportsnow_impact/photo/erbwomensallstar02jpg-1781e165d25956e6.jpg",
    "reacts": "8K",
    "comments": "70K",
    "shares": "58K",
    "hashTags": "#happy #smile #fun_loving #flutter #happy_learning",
  },
  {
    "photo": "https://flutter.dev/images/catalog-widget-placeholder.png",
    "userName": "Chan Chan",
    "postDate": "Mar 24 2020",
    "postDescription":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
    "postImage": "https://miro.medium.com/max/900/1*0Z9489Gdptl1gxVl3eGgsg.png",
    "reacts": "288K",
    "comments": "440K",
    "shares": "154K",
    "hashTags": "#happy #smile #fun_loving #flutter #happy_learning",
  }
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double width;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Facebook",
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          for (int i = 0; i < userData.length; i++)
            Column(
              children: [
                GestureDetector(
                    child: _card(userData[i], context),
                    onTap: () {
                      Navigator.pushNamed(context, "/userDetails",
                          arguments: userData[i]);
                    }),
                SizedBox(
                    height: 10, child: Container(color: Colors.grey.shade400))
              ],
            )
        ],
      ),
    );
  }

  Widget _card(data, context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          _cardHeader(data),
          _cardBody(data),
          _cardFooter(data, context),
          _commentCard()
        ],
      ),
    );
  }

  Widget _cardHeader(Map data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(data["photo"]),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: data["userName"],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                            text: "  added a new post",
                            style:
                                TextStyle(fontSize: 17, color: Colors.black54))
                      ]),
                ),
                SizedBox(height: 5),
                Row(children: [
                  Text(data["postDate"],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green)),
                  SizedBox(width: 5),
                  Icon(
                    Icons.settings,
                    size: 19,
                  )
                ]),
              ],
            ),
          ],
        ),
        Icon(Icons.more_horiz),
      ],
    );
  }

  Widget _cardBody(Map data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          data["postDescription"],
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 10),
        Text(
          data["hashTags"],
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        Image.network(data["postImage"])
      ],
    );
  }

  Widget _cardFooter(Map data, context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.blue,
                backgroundImage: NetworkImage(
                    "https://i.pinimg.com/originals/39/44/6c/39446caa52f53369b92bc97253d2b2f1.png"),
              ),
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(
                    "https://spng.pngfind.com/pngs/s/6-62693_facebook-heart-transparent-facebook-heart-icon-hd-png.png"),
              ),
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.yellow,
                backgroundImage: NetworkImage(
                    "https://www.pngfind.com/pngs/m/3-39565_haha-emoticons-emoticon-png-facebook-haha-react-png.png"),
              ),
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.yellow,
                backgroundImage: NetworkImage(
                    "https://img.pngio.com/shock-emoji-illustration-emoji-smiley-emoticon-wow-come-to-your-wow-emoji-transparent-640_640.jpg"),
              ),
              SizedBox(width: 5),
              Text(data["reacts"])
            ],
          ),
          Row(children: [
            Text('${data["comments"]} comments',
                style: TextStyle(color: Colors.black54)),
            SizedBox(width: 4),
            Text('${data["shares"]} shares',
                style: TextStyle(color: Colors.black54)),
          ])
        ]),
        Divider(color: Colors.black26, thickness: 1),
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(children: [
                Icon(Icons.thumb_up),
                SizedBox(width: 10),
                Text("Like"),
              ]),
              Row(children: [
                Icon(Icons.message),
                SizedBox(width: 10),
                Text("Comment"),
              ]),
              Row(children: [
                Icon(Icons.share),
                SizedBox(width: 10),
                Text("Share"),
              ]),
            ],
          ),
        )
      ],
    );
  }

  Widget _commentCard() {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CircleAvatar(
            radius: 17,
            backgroundColor: Colors.blue,
            backgroundImage: NetworkImage(
                "https://www.pngfind.com/pngs/m/354-3548272_rebecca-richardsdiop-headshot-circle-girl-hd-png-download.png"),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade300,
            ),
            width: width - 60,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  SizedBox(width: 10),
                  Text("Write a comment....", style: TextStyle()),
                ]),
                Row(children: [
                  CircleAvatar(
                    radius: 13,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                        "https://icon-library.com/images/emoji-icon-png/emoji-icon-png-12.jpg"),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 13,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                        "https://cdn0.iconfinder.com/data/icons/images-photography/24/photos-taking-camera-circle-picture-pictures-image-photography-photo-512.png"),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                        "https://ddo0fzhfvians.cloudfront.net/uploads/icons/png/9762267611548330724-512.png"),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 13,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                        "https://cdn4.iconfinder.com/data/icons/social-productivity-line-art-6/128/sticker-face-ol-512.png"),
                  ),
                  SizedBox(width: 5),
                ])
              ],
            ),
          )
        ]),
        Divider(color: Colors.black26, thickness: 1),
      ],
    );
  }
}
