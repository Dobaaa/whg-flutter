// ignore_for_file: must_be_immutable

part of 'details_bloc.dart';

@immutable
abstract class DetailsEvent extends Equatable {}

class DetailsInitialEvent extends DetailsEvent {
  @override
  List<Object?> get props => [];
}
