import 'package:flutter/material.dart';
import 'package:rick_and_morty/infrastructure/persistence/database/db_provider.dart';
import 'package:rick_and_morty/presentation/favorite_tab.dart';
import 'package:rick_and_morty/presentation/home_tab.dart';
import 'package:rick_and_morty/presentation/models/characters_data_model.dart';
import 'package:rick_and_morty/presentation/settings_tab.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DbProvider.db.initDb();
  runApp(TabPanel());
}

class TabPanel extends StatelessWidget{
  TabPanel({super.key});
  
  final CharactersDataModel _model = CharactersDataModel();
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _notifier,
      builder: (_, mode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: _notifier.value,
          home: DefaultTabController(
            length: 3, 
            child: Scaffold(
              bottomNavigationBar: TabBar(tabs: [
                Tab(icon: Icon(Icons.home_outlined),),
                Tab(icon: Icon(Icons.favorite_outlined),),
                Tab(icon: Icon(Icons.settings_outlined),)
              ]),
              body: TabBarView(children: [
                HomeTab(dataModel: _model),
                FavoriteTab(dataModel: _model),
                SettingsTab(themeMode: _notifier)
              ]),
            ) 
          ) 
        );
      },
    );
  }

}