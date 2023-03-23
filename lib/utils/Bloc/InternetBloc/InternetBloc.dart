import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/sockets/src/sockets_io.dart';
import '/utils/Bloc/InternetBloc/InternetEvent.dart';
import '/utils/Bloc/InternetBloc/InternetState.dart';
import 'package:connectivity/connectivity.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? _sp;
  InternetBloc() : super(InternetInitialState()) {
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    _sp = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    _sp?.cancel();
    return super.close();
  }
}
