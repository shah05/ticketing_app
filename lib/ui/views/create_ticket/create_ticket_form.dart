import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ticketing_app/model/attachments.dart';
import 'package:ticketing_app/model/contract.dart';
import 'package:ticketing_app/model/service_type.dart';
import 'package:ticketing_app/model/ticket.dart';
import 'package:intl/intl.dart';
import 'package:ticketing_app/screens/create_ticket/create_ticket_status_screen.dart';
import 'package:ticketing_app/service/rest_api.dart';
import 'package:ticketing_app/util/constants.dart';
import 'package:flutter/services.dart';
import 'package:ticketing_app/widgets/redirect_to_login.dart';
import 'package:ticketing_app/widgets/top_banner.dart';

class CreateTicketFormScreen extends StatefulWidget {
  @required
  final String contractId;

  CreateTicketFormScreen({this.contractId});

  @override
  _CreateTicketFormScreenState createState() => _CreateTicketFormScreenState();
}

class _CreateTicketFormScreenState extends State<CreateTicketFormScreen> {
  Future<ServiceType> svcTypeApiResult;
  List<Attachment> attachments = [];
  String _fileName;
  Ticket ticket = new Ticket();
  final format = DateFormat("dd-MM-yyyy");
  String _path;
  bool _loadingPath = false;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _currentSelectedValue = '00:00';

  // Variables for Service Type selection
  String dropdownError;
  String selectedSvcType;
  int svcTypeId;
  List<Svctypes> svcTypes;

  void selectAttachment() async {
    setState(() => _loadingPath = true);
    try {
      _path = await FilePicker.getFilePath(
          type: FileType.custom,
          allowedExtensions: ['doc', 'pdf', 'xlsx', 'jpg']);
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      if (_path != null) {
        _fileName = _path.split('/').last;
        attachments.add(Attachment(fileName: _fileName, filePath: _path));
      }
    });
  }

  void validateFormFields() {
    bool isValid = _formKey.currentState.validate();
    if (selectedSvcType == null) {
      setState(() {
        dropdownError = 'Please select an option';
        isValid = false;
      });
    }

    if (isValid) {
      /// Set Contract UUID
      Contract c = Contract();
      c.uuid = widget.contractId;
      ticket.contract = c;
      ticket.svcTypeId = svcTypeId;
      _formKey.currentState.save();
      if (_currentSelectedValue == '') {
        _currentSelectedValue = '00:00';
        String temp = ticket.srSdateTime.split(' ')[0];
        ticket.srSdateTime = temp + ' ' + _currentSelectedValue;
      } else {
        String temp = ticket.srSdateTime.split(' ')[0];
        print(temp);
        ticket.srSdateTime = temp + ' ' + _currentSelectedValue;
      }
      print('title : ${ticket.contract.uuid}');
      print('title : ${ticket.title}');
      print('description : ${ticket.description}');
      print('ref1 : ${ticket.clientRef1}');
      print('ref2 : ${ticket.clientRef2}');
      print('postal : ${ticket.dcAccessCode}');
      print('equipment loc : ${ticket.eqLoc}');
      print('equipment serialno : ${ticket.eqSerialNo}');
      print('Part no : ${ticket.partno}');
      print('brand model : ${ticket.brandModel}');
      print('contact details : ${ticket.locContact}');
      print('svc date : ${ticket.srSdateTime}');
      if (attachments.isNotEmpty) {
        ticket.attachments = attachments;
        for (var attachment in ticket.attachments) {
          print('filename: ${attachment.fileName}');
          print('filename: ${attachment.filePath}');
        }
      }
      Navigator.push(
        context,
        new MaterialPageRoute<String>(
          builder: (BuildContext context) =>
              CreateTicketStatusScreen(ticket: ticket),
          fullscreenDialog: true,
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    svcTypeApiResult = ApiService.getServiceType();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.contractId);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopBanner(
              isBack: true,
            ),
            FutureBuilder(
              future: svcTypeApiResult,
              builder: (context, snapshot) {
                ServiceType serviceType = snapshot.data;
                if (serviceType == null) {
                  return Container(
                    alignment: FractionalOffset.center,
                    child: CircularProgressIndicator(),
                  );
                }
                if (serviceType.httpCode == 201) {
                  return Expanded(
                    child: Form(
                      key: _formKey,
                      autovalidate: true,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //1. Serial Number
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
//                                  suffixIcon: Icon(Icons.search),
                                  labelText: 'Equipment Serial No',
                                  hintText: 'Key in equipment serial no',
                                  labelStyle: TextStyle(color: kTextPrimary),
                                  errorStyle: kErrorTextStyle,
                                ),
                                validator: (val) => val.isEmpty
                                    ? 'Please add equipment serial no'
                                    : null,
                                onSaved: (val) => val.isEmpty
                                    ? ticket.eqSerialNo = null
                                    : ticket.eqSerialNo = val,
                              ),
                            ),
                            //2. Service Type
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: DropdownButton<String>(
                                underline: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: dropdownError == null
                                              ? Colors.grey
                                              : Colors.red),
                                    ),
                                  ),
                                ),
                                isExpanded: true,
                                hint: selectedSvcType == null
                                    ? Text(
                                        'Please select service type',
                                        style: TextStyle(color: kTextPrimary),
                                      )
                                    : Text(
                                        selectedSvcType,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                items: serviceType.svctypes
                                    .map((Svctypes svcType) {
                                  return new DropdownMenuItem<String>(
                                    value: svcType.description,
                                    child: new Text(svcType.description),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedSvcType = value;
                                    dropdownError = null;
                                    //Set serviceTypeId based on selectedSvcType
                                    for (var svc in serviceType.svctypes) {
                                      if (selectedSvcType == svc.description) {
                                        svcTypeId = svc.id;
                                      }
                                    }
                                    print('service type: $selectedSvcType');
                                    print('service type id: $svcTypeId');
                                  });
                                },
                              ),
                            ),
                            dropdownError == null
                                ? SizedBox.shrink()
                                : Text(dropdownError ?? "",
                                    style: kErrorTextStyle),
                            //3. Service date
                            DateTimeField(
                              decoration: InputDecoration(
                                labelText: 'Service Date',
                                hintText: 'Pick a date today onwards',
                                labelStyle: TextStyle(color: kTextPrimary),
                                errorStyle: kErrorTextStyle,
                              ),
                              format: format,
                              onShowPicker: (context, currentValue) {
                                return showDatePicker(
                                    context: context,
                                    firstDate: DateTime(1900),
                                    initialDate: currentValue ?? DateTime.now(),
                                    lastDate: DateTime(2100));
                              },
                              validator: (value) {
                                /// Need to compare if picked date is earlier. Only validate selected current date onwards.
                                DateTime now = DateTime.now();
                                DateTime currentDate =
                                    DateTime(now.year, now.month, now.day);
                                if (value == null) {
                                  return 'Please pick a date';
                                } else if (value.isBefore(currentDate)) {
                                  return 'Please pick a date later than today';
                                }
                                return null;
                              },
                              onSaved: (val) =>
                                  ticket.srSdateTime = val.toString(),
                            ),
                            //4. Title
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Title',
                                  hintText: 'Key in a title to your ticket',
                                  labelStyle: TextStyle(color: kTextPrimary),
                                  errorStyle: kErrorTextStyle,
                                ),
                                validator: (val) =>
                                    val.isEmpty ? 'Please add a title' : null,
                                onSaved: (val) => ticket.title = val,
                              ),
                            ),
                            //5. Description
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Description',
                                hintText: 'Key in description of the issue',
                                labelStyle: TextStyle(color: kTextPrimary),
                                errorStyle: kErrorTextStyle,
                              ),
                              maxLines: 3,
                              validator: (val) => val.isEmpty
                                  ? 'Please add a description'
                                  : null,
                              onSaved: (val) => ticket.description = val,
                            ),
                            //6. Contact Details
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Contact Details',
                                hintText: 'Key in contact details',
                                labelStyle: TextStyle(color: kTextPrimary),
                                errorStyle: kErrorTextStyle,
                              ),
                              maxLines: 3,
                              validator: (val) => val.isEmpty
                                  ? 'Please add contact details'
                                  : null,
                              onSaved: (val) => ticket.locContact = val,
                            ),
                            //7. Equipment Location
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Equipment Location',
                                  hintText:
                                      'Key in equipment location (e.g 14 Robinson Road #08-01A)',
                                  labelStyle: TextStyle(color: kTextPrimary),
                                  errorStyle: kErrorTextStyle,
                                ),
                                validator: (val) => val.isEmpty
                                    ? 'Please add equipment lcoation (e.g 14 Robinson Road #08-01A)'
                                    : null,
                                onSaved: (val) => ticket.eqLoc = val,
                              ),
                            ),
                            //8. Postal Code
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Postal code',
                                  hintText:
                                      'Key in your postal code (e.g 53100)',
                                  labelStyle: TextStyle(color: kTextPrimary),
                                  errorStyle: kErrorTextStyle,
                                ),
//                        validator: (val) => val.isEmpty
//                            ? 'Please add a postal code (e.g 53100)'
//                            : null,
                                onSaved: (val) => val.isEmpty
                                    ? ticket.dcAccessCode = null
                                    : ticket.dcAccessCode = val,
                              ),
                            ),
                            //9. Brand Model
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Brand Model',
                                  hintText: 'Key in brand model',
                                  labelStyle: TextStyle(color: kTextPrimary),
                                  errorStyle: kErrorTextStyle,
                                ),
//                        validator: (val) =>
//                        val.isEmpty ? 'Please add brand model' : null,
                                onSaved: (val) => val.isEmpty
                                    ? ticket.brandModel = null
                                    : ticket.brandModel = val,
                              ),
                            ),
                            //10. Equipment No
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Equipment No',
                                  hintText: 'Key in equipment no',
                                  labelStyle: TextStyle(color: kTextPrimary),
                                  errorStyle: kErrorTextStyle,
                                ),
                                validator: (val) =>
                                    val.isEmpty ? 'Please add part no' : null,
                                onSaved: (val) => ticket.partno = val,
                              ),
                            ),
                            //11. Remarks
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Remarks',
                                  hintText: 'Key in remarks',
                                  labelStyle: TextStyle(color: kTextPrimary),
                                  errorStyle: kErrorTextStyle,
                                ),
//                        validator: (val) =>
//                        val.isEmpty ? 'Please add a reference' : null,
                                onSaved: (val) => val.isEmpty
                                    ? ticket.remarks = null
                                    : ticket.remarks = val,
                              ),
                            ),
                            //12. Reference 1
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Client Reference 1',
                                  hintText: 'Key in a reference',
                                  labelStyle: TextStyle(color: kTextPrimary),
                                  errorStyle: kErrorTextStyle,
                                ),
//                        validator: (val) =>
//                        val.isEmpty ? 'Please add a reference' : null,
                                onSaved: (val) => val.isEmpty
                                    ? ticket.clientRef1 = null
                                    : ticket.clientRef1 = val,
                              ),
                            ),
                            // 12. Reference 2
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Client Reference 2',
                                  hintText: 'Key in a reference',
                                  labelStyle: TextStyle(color: kTextPrimary),
                                  errorStyle: kErrorTextStyle,
                                ),
//                        validator: (val) =>
//                        val.isEmpty ? 'Please add a reference' : null,
                                onSaved: (val) => val.isEmpty
                                    ? ticket.clientRef2 = null
                                    : ticket.clientRef2 = val,
                              ),
                            ),
//                            FormField<String>(
//                              builder: (FormFieldState<String> state) {
//                                return InputDecorator(
//                                  decoration: InputDecoration(
//                                    labelText: 'Pick a time slot',
//                                    hintText: 'Pick a time slot',
//                                    labelStyle: TextStyle(color: kTextPrimary),
//                                    errorStyle: kErrorTextStyle,
//                                  ),
////                            isEmpty: _currentSelectedValue == '',
//                                  child: DropdownButtonHideUnderline(
//                                    child: DropdownButton<String>(
//                                      value: _currentSelectedValue,
//                                      isDense: true,
//                                      onChanged: (String newValue) {
//                                        setState(() {
//                                          _currentSelectedValue = newValue;
//                                          state.didChange(newValue);
//                                        });
//                                      },
//                                      items: timeSlot.map((String value) {
//                                        return DropdownMenuItem<String>(
//                                          value: value,
//                                          child: Text(value),
//                                        );
//                                      }).toList(),
//                                    ),
//                                  ),
//                                );
//                              },
//                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: RaisedButton(
                                color: kSubmitButton,
                                textColor: kTextButton,
                                onPressed: () => selectAttachment(),
                                child: Text('Attach files'),
                              ),
                            ),
                            attachments.isNotEmpty
                                ? Text(
                                    'Swipe to right to remove attachment in the list',
                                    style: kErrorTextStyle)
                                : Container(),
                            Builder(
                              builder: (BuildContext context) => _loadingPath
                                  ? Center(
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child:
                                              const CircularProgressIndicator()),
                                    )
                                  : attachments != null
                                      ? Container(
                                          padding: const EdgeInsets.only(
                                              bottom: 30.0),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.30,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: kSubmitButton),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Scrollbar(
                                            child: ListView.builder(
                                              itemCount: attachments.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Dismissible(
                                                  key: Key(attachments[index]
                                                      .fileName),
                                                  onDismissed: (direction) {
                                                    setState(() {
                                                      attachments
                                                          .removeAt(index);
                                                    });
                                                  },
                                                  direction: DismissDirection
                                                      .startToEnd,
                                                  child: ListTile(
                                                    title: Text(
                                                      attachments[index]
                                                          .fileName,
                                                      style: TextStyle(
                                                          fontSize: 12.0),
                                                    ),
//                                      trailing: Icon(Icons.close),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      : new Container(),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: RaisedButton(
                                color: kSubmitButton,
                                textColor: kTextButton,
                                onPressed: () {
                                  validateFormFields();
                                },
                                child: Text('Submit'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return RedirectToLogin();
              },
            )
          ],
        ),
      ),
    );
  }
}
