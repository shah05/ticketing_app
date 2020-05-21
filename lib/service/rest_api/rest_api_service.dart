import 'package:ticketing_app/model/contract_detail.dart';
import 'package:ticketing_app/model/create_ticket.dart';
import 'package:ticketing_app/model/customer.dart';
import 'package:ticketing_app/model/equipment.dart';
import 'package:ticketing_app/model/list_ticket.dart';
import 'package:ticketing_app/model/service_type.dart';
import 'package:ticketing_app/model/ticket.dart';

abstract class RestApiService {
  Future<String> doAuthentication(userEmail, userPass);
//  Future<Customer> getContracts();
  Future<List<Contractdetail>> getContracts();
  Future<Equipment> getEquipmentInfo(String contractID, String serialNo);
  Future<List<Ticketlist>> getListTicketStatus();
  Future<Ticket> getTicketDetail(String uuid);
  Future<CreateTicket> createTicket(Ticket ticket);
  Future<List<Svctypes>> getServiceType();
}
