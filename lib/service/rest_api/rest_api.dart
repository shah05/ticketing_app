//Method that is exposed by this service.
import 'package:ticketing_app/model/create_ticket.dart';
import 'package:ticketing_app/model/customer.dart';
import 'package:ticketing_app/model/equipment.dart';
import 'package:ticketing_app/model/list_ticket.dart';
import 'package:ticketing_app/model/ticket.dart';
import 'package:ticketing_app/model/ticket_by_id.dart';

abstract class RestApi {
  Future<String> doAuthentication(userEmail, userPass);
  Future<Customer> getContracts();
  Future<Equipment> getEquipmentInfo(String contractID, String serialNo);
  Future<ListTicket> getListTicketStatus();
  Future<TicketById> getTicketDetail(String uuid);
  Future<CreateTicket> createTicket(Ticket ticket);
}
