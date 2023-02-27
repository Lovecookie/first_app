// ignore_for_file: prefer_final_fields, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState extends Equatable {
  late bool _isBusy;
  late int _pageIndex;

  bool isBusy() => _isBusy;
  int getPageIndex() => _pageIndex;
  setBusy(bool isBusy) => _isBusy = isBusy;

  AppState({required isBusy, required pageIndex})
      : _isBusy = isBusy,
        _pageIndex = pageIndex;

  @override
  List<Object?> get props => [_isBusy, _pageIndex];

  AppState copyWith({
    bool? isBusy,
    int? pageIndex,
  }) {
    return AppState(
      isBusy: isBusy ?? _isBusy,
      pageIndex: pageIndex ?? _pageIndex,
    );
  }
}

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier(super.state);

  int getPageIndex() => state.getPageIndex();

  void isBusy() {
    state = state.copyWith(isBusy: true);
  }

  void isNotBusy() {
    state = state.copyWith(isBusy: false);
  }

  void setPageIndex(int pageIndex) {
    state = state.copyWith(pageIndex: pageIndex);
  }
}
