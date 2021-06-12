/* Create a new list of all ChangeNotifer Provider */
import 'package:baseapp/core/notifers/mockapi.notifer.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> provider = [
  // ChangeNotifierProvider(create: (_) => CacheNotifer()),
  // ChangeNotifierProvider(create: (_) => CounterNotifer()),
  ChangeNotifierProvider(create: (_) => MockAPINotifier()),
];
