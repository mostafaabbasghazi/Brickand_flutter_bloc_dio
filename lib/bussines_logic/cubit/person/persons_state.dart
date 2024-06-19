part of 'persons_cubit.dart';

@immutable
sealed class PersonsState {}

final class PersonsInitial extends PersonsState {}

final class PersonLoaded extends PersonsState{
  final List<PersonModel> persons;

  PersonLoaded(this.persons);
}
