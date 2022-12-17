import 'dart:async';

import 'package:bloc_project_1/blocs/internet_bloc/internet_event.dart';
import 'package:bloc_project_1/blocs/internet_bloc/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InterentState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  InternetBloc() : super(InternetInitialState()) {
    on<InternetLossEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      print(result);
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLossEvent());
      }
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    connectivitySubscription?.cancel();
    return super.close();
  }
}
