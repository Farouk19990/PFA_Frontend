import 'package:mall/model/client.dart';

class Command {
  final int id;
  final int prixTotal;
  final int qteTotal;
  final String reference;
  final String date;
  //final Client clientId;
  Command({
    required this.id,
    required this.prixTotal,
    required this.qteTotal,
    required this.reference,
    required this.date,
    //required this.clientId,
  });
  factory Command.fromjson(Map<String, dynamic> json) {
    return Command(
      id: json['id'],
      prixTotal: json['prixTotal'],
      qteTotal: json['qteTotal'],
      reference: json['reference'],
      date: json['date'],
      //clientId: Client.fromjson(json['client']),
    );
  }
}
