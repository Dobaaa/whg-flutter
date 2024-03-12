// ignore_for_file: must_be_immutable

part of 'details_bloc.dart';

class DetailsState extends Equatable {
  DetailsState({this.detailsPageModel});

  DetailsPageModel? detailsPageModel;

  @override
  List<Object?> get props => [
        detailsPageModel,
      ];
  DetailsState copyWith({DetailsPageModel? detailsPageModel}) {
    return DetailsState(
      detailsPageModel: detailsPageModel ?? this.detailsPageModel,
    );
  }
}
