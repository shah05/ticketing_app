import 'package:flutter/material.dart';
import 'package:ticketing_app/model/equipment.dart';
import 'package:ticketing_app/service/rest_api.dart';
import 'package:ticketing_app/widgets/redirect_to_login.dart';

class EquipmentResultScreen extends StatefulWidget {
  Future<Equipment> equipment;
  @required String contractId;
  @required String serialNo;

  EquipmentResultScreen({this.contractId, this.serialNo});

  @override
  _EquipmentResultScreenState createState() => _EquipmentResultScreenState();
}

class _EquipmentResultScreenState extends State<EquipmentResultScreen> {
  @override
  void initState() {
    super.initState();
    widget.equipment =
        ApiService.getEquipmentInfo(widget.contractId, widget.serialNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: FutureBuilder(
        future: widget.equipment,
        builder: (context, snapshot) {
          Equipment equipment = snapshot.data;
          if (equipment == null) {
            return Container(
              alignment: FractionalOffset.center,
              child: CircularProgressIndicator(),
            );
          }
          if (equipment.httpCode == 200) {
            return buildEquimentDisplay(
                widget.contractId, widget.serialNo, equipment);
          }

          return RedirectToLogin();
        },
      ),
    );
  }

  Widget buildEquimentDisplay(
      String contractId, String serialNo, Equipment equipment) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text('Serial Number'),
              subtitle: Text(serialNo),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Contract Id'),
              subtitle: Text(contractId),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Message'),
              subtitle: Text(equipment.message),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Sla'),
              subtitle: Text(equipment.sla==null ? 'NA' : equipment.sla),
            ),
          ),
        ],
      ),
    );
  }
}
