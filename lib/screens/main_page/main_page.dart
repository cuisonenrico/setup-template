import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setup/state/cubits/cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    required this.onTap,
    required this.counter,
    super.key,
  });

  final int counter;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.watch<CounterBloc>();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Setup App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                // TODO(cuisonenrico): revert when using AsyncRedux/MVC pattern
                // '$counter',
                '${counterBloc.state.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // TODO(cuisonenrico): revert when using AsyncRedux/MVC pattern
          // onPressed: () => onTap(1),
          onPressed: () => counterBloc.onCounterIncrementPressed(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
