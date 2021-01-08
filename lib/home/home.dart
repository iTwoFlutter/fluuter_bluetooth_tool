import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluttooth_debugging/res/colours.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BLE蓝牙助手"),
          actions: [
            Center(child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator(value: null, strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(Colors.white)))),
            Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
            IconButton(icon: Icon(Icons.add, color: Colors.white, size: 24), onPressed: null),
            Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
          ],
        ),
        drawer: _buildDrawer(),
        body: SmartRefresher(
          controller: _refreshController,
          header: ClassicHeader(),
          onRefresh: () {},
          enablePullDown: true,
          child: ListView.builder(itemCount: 20, itemBuilder: (c, i) => _buildItem(c, i)),
        ));
  }

  Widget _buildItem(BuildContext ctx, int index) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5)), boxShadow: <BoxShadow>[BoxShadow(color: Colors.grey[400])]),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
          Container(width: 50, height: 50, padding: EdgeInsets.all(10), child: Image.asset("images/ic_bluetooth_white.png"), decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(8)))),
          Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text("Name ", style: TextStyle(fontSize: 16, color: Colours.black333)),
              Padding(padding: EdgeInsets.symmetric(vertical: 2)),
              Text("00:00:00:00:00:00 ", style: TextStyle(fontSize: 14, color: Colours.black666)),
              Padding(padding: EdgeInsets.symmetric(vertical: 2)),
              Text("可链接", style: TextStyle(fontSize: 14, color: Colours.black666)),
              Spacer(),
            ],
          ),
          Spacer(),
          Text("-90 dBm", style: TextStyle(fontSize: 12, color: Colours.black999)),
          Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
          Container(
              child: Text("链接", style: TextStyle(color: Colors.white)), padding: EdgeInsets.only(top: 3, bottom: 3, left: 6, right: 6), decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(5)))),
          Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Container(
      width: 300,
      height: double.infinity,
      color: Colors.white,
      child: Text("AA"),
      alignment: Alignment.center,
    );
  }
}
