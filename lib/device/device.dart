import 'package:base/util/util_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
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
  ScanResult scanResult;

  // List<BluetoothServiceExpanded> _dataList = <BluetoothServiceExpanded>[];
  List<BluetoothServiceExpanded> _dataList = List.generate(20, (index) => BluetoothServiceExpanded(null, false));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Container(
          child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(scanResult?.advertisementData?.localName ?? "title", style: TextStyle(color: Colors.white)),
              subtitle: Text(scanResult?.device?.id?.toString() ?? "subtitle", style: TextStyle(color: Colors.white))),
        ),
        actions: [
          Container(alignment: Alignment.center, padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8), child: Text("断开")),
          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
        ],
      ),
      body: SingleChildScrollView(child: Container(width: double.infinity, child: _buildExpansionPanelList())),
    );
  }

  Widget _buildExpansionPanelList() => ExpansionPanelList(
        elevation: 0,
        expansionCallback: (index, isExpanded) => setState(() => _dataList[index].isExpanded = !isExpanded),
        children: _dataList.map((e) => ExpansionPanel(isExpanded: e.isExpanded, headerBuilder: (BuildContext context, bool isExpanded) => _buildExpansionHeader(context, isExpanded, e), body: _buildExpansionBody(e))).toList(),
      );

  Widget _buildExpansionHeader(BuildContext context, bool isExpanded, BluetoothServiceExpanded e) {
    return ListTile(title: Text("Service Name", style: TextStyle(color: Colours.black333, fontWeight: FontWeight.w400, fontSize: 16)), subtitle: Text("UUID  ${Uuid().v1().toString()}", style: TextStyle(fontSize: 12)));
  }

  Widget _buildExpansionBody(BluetoothServiceExpanded serviceExpanded) {
    // var characteristics = serviceExpanded.service?.characteristics;
    var characteristics = List.generate(5, (index) => "").toList();
    var childList = characteristics
        ?.map((e) => Container(
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey[300]))),
              width: double.infinity,
              margin: EdgeInsets.only(left: 20,right: 10),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Text("Device name", style: TextStyle(fontSize: 14, color: Colours.black333, fontWeight: FontWeight.w500)),
                  Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                  Text("UUID  ${Uuid().v1().toString()}", style: TextStyle(fontSize: 12, color: Colours.black666)),
                  Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                  Text("Properties: READ WRITE NOTIFY", style: TextStyle(fontSize: 12, color: Colours.black666)),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: 5,
                    child: Row(
                      mainAxisSize:MainAxisSize.min,
                      children: [
                      SizedBox(width: 36, height: 36, child: IconButton(icon: Icon(Icons.upload_rounded, color: Theme.of(context).primaryColor), onPressed: null)),
                      SizedBox(width: 36, height: 36, child: IconButton(icon: Icon(Icons.download_rounded, color: Theme.of(context).primaryColor), onPressed: null)),
                      SizedBox(width: 36, height: 36, child: IconButton(icon: Icon(Icons.notification_important_rounded, color: Theme.of(context).primaryColor), onPressed: null)),
                    ],),
                  )
                ],
              ),
            ))
        ?.toList();
    return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: childList);
  }
}

class BluetoothServiceExpanded {
  BluetoothService service;
  bool isExpanded;

  BluetoothServiceExpanded(this.service, this.isExpanded);

  @override
  String toString() {
    return 'BluetoothServiceExpanded{service: $service, isExpanded: $isExpanded}';
  }
}
