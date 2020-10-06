import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(height: 896, width: 414, allowFontScaling: true);
    var userprofile = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.only(top: 30),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/User/avatar.png"),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.edit,
                      size: ScreenUtil().setSp(15),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Kalana Mihiranga",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "071802532",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 40,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).accentColor,
            ),
            child: Center(
              child: Text("Change my account details"),
            ),
          )
        ],
      ),
    );
    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Icon(
          Icons.arrow_back,
          size: ScreenUtil().setSp(30),
        ),
        userprofile,
        Icon(
          LineAwesomeIcons.sun_o,
          size: ScreenUtil().setSp(30),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          header,
          Expanded(
            child: ListView(
              children: <Widget>[
                ProfileListItem(
                  icon: LineAwesomeIcons.adjust,
                  text: "Delete my account",
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.users,
                  text: "Invite Friends",
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.train,
                  text: "About Us",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final text;
  final bool hasNavigation;

  const ProfileListItem({this.icon, this.text, this.hasNavigation = true});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 40).copyWith(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: 25,
          ),
          SizedBox(
            width: 25,
          ),
          Text(this.text, style: TextStyle(fontWeight: FontWeight.w500)),
          Spacer(),
          // if (this.hasNavigation)
          //   Icon(
          //     LineAwesomeIcons.angle_right,
          //     size: 25,
            // ),
        ],
      ),
    );
  }
}