import 'package:bolc_persons/data/models/persons.dart';
import 'package:bolc_persons/data/webservers/person.dart';

class PersonRepo{
  WbServers wbServers=WbServers();

  Future <List<PersonModel>> getAllPersons()async{
    final persons=await wbServers.getAllPersons();
    return persons.map((toElement)=>PersonModel.fromJson(toElement)).toList();
  }
}