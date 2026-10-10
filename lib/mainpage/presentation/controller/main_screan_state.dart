part of 'main_screan_bloc.dart';

@immutable


class MainScreanState extends Equatable {
  final int ? selectedIndex;

  const MainScreanState({
    this.selectedIndex = 0,


  });

  MainScreanState copyWith({

    int ?selectedIndex,

  }) {
    return MainScreanState(
        selectedIndex: selectedIndex??this.selectedIndex
    );
  }

  @override
  List<Object?> get props => [
    selectedIndex,


  ];
}
