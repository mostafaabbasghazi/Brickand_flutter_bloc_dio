import 'package:bloc/bloc.dart';
import 'package:bolc_persons/data/models/persons.dart';
import 'package:bolc_persons/data/repository/person.dart';
import 'package:meta/meta.dart';

part 'persons_state.dart';

class PersonsCubit extends Cubit<PersonsState> {
  final PersonRepo persons;
  List<PersonModel> personList=[];
  PersonsCubit(this.persons) : super(PersonsInitial());

  List<PersonModel> getAllPersons(){
    persons.getAllPersons().then((onValue){
      emit(PersonLoaded(onValue));
      this.personList.addAll(onValue);
    });
    return personList;
  }

}
