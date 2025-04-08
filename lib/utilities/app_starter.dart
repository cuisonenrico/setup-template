import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setup/setup_app.dart';
import 'package:setup/state/app_state.dart';
import 'package:setup/state/cubits/cubit.dart';

Future<void> startApp() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // TODO(cuisonenrico): remove if using Bloc
      final store = Store<AppState>(
        initialState: AppState.init(),
        actionObservers: [if (kDebugMode) Log.printer(formatter: Log.multiLineFormatter)],
      );

      // TODO(cuisonenrico): remove one or the other depending on what you will use
      runApp(
        StoreProvider<AppState>(
          store: store,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<CounterBloc>(
                create: (_) => CounterBloc(),
              ),
            ],
            child: SetupApp(),
          ),
        ),
      );
    },
    (error, stack) async => {},
  );
}
