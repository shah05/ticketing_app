class Ticket {
  String partNum;
  String serialNum;
  String problemDesc;
  String attachmentUrl;
  DateTime serviceDate;
  String contactName;
  String contactNum;
  bool isOpen;

  Ticket(
      {this.partNum,
      this.serialNum,
      this.problemDesc,
      this.attachmentUrl,
      this.serviceDate,
      this.contactName,
      this.contactNum,
      this.isOpen});

  List getTickets() {
    return [
      Ticket(
          partNum: 'abc123',
          serialNum: '123456',
          problemDesc : 'Feature A not working',
          attachmentUrl: 'assets/part-stuckdefect.png',
          serviceDate: DateTime.now(),
          contactName: 'Shahidan',
          contactNum: '0133990224',
          isOpen: true),
      Ticket(
          partNum: 'abc123',
          serialNum: '123456',
          problemDesc : 'Feature A not working',
          attachmentUrl: 'picture',
          serviceDate: DateTime.now(),
          contactName: 'Shahidan',
          contactNum: '0133990224',
          isOpen: true),
      Ticket(
          partNum: 'abc123',
          serialNum: '123456',
          problemDesc : 'Feature A not working',
          attachmentUrl: 'picture',
          serviceDate: DateTime.now(),
          contactName: 'Shahidan',
          contactNum: '0133990224',
          isOpen: false),
      Ticket(
          partNum: 'abc123',
          serialNum: '123456',
          problemDesc : 'Feature A not working',
          attachmentUrl: 'picture',
          serviceDate: DateTime.now(),
          contactName: 'Shahidan',
          contactNum: '0133990224',
          isOpen: false),
    ];
  }

}

