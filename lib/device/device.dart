import 'package:base/util/util_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluttooth_debugging/res/colours.dart';
import 'package:uuid/uuid.dart';

class BluetoothDevicePage extends StatefulWidget {
  static actionStart() {
    RouterUtil.navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => BluetoothDevicePage()));
  }

  @override
  _BluetoothDevicePageState createState() => _BluetoothDevicePageState();
}

class _BluetoothDevicePageState extends State<BluetoothDevicePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Device")),
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _buildChild(),
          ))),
    );
  }

  List<Widget> _buildChild() {
    var list = <Widget>[];
    list.add(_buildHead());
    return list;
  }

  Widget _buildHead() {
  return  Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 40,right: 40,top: 20,bottom: 20),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)), border: Border.all(color: Colors.grey[400])),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(text: TextSpan(text: "蓝牙名称:", style: TextStyle(fontSize: 12, color: Colours.black333), children: <InlineSpan>[TextSpan(text: "DeviceName", style: TextStyle(fontSize: 12, color: Colours.black666))])),
          RichText(text: TextSpan(text: "服务:", style: TextStyle(fontSize: 12, color: Colours.black333), children: <InlineSpan>[TextSpan(text: Uuid().v1().toString(), style: TextStyle(fontSize: 12, color: Colours.black666))])),
          RichText(text: TextSpan(text: "广播:", style: TextStyle(fontSize: 12, color: Colours.black333), children: <InlineSpan>[TextSpan(text: Uuid().v1().toString()*3, style: TextStyle(fontSize: 12, color: Colours.black666))])),
        ],
      ),
    );
  }
}
