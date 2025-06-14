import 'package:flutter/material.dart';
import 'package:rick_and_morty/infrastructure/persistence/database/db_provider.dart';
import 'package:rick_and_morty/presentation/tabs/favorite_tab.dart';
import 'package:rick_and_morty/presentation/tabs/home_tab.dart';
import 'package:rick_and_morty/presentation/models/characters_data_model.dart';
import 'package:rick_and_morty/presentation/tabs/settings_tab.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DbProvider.db.initDb();
  runApp(const TabPanel());
}

class TabPanel extends StatefulWidget{
  const TabPanel({super.key});

  @override
  State<StatefulWidget> createState() => _TabPanelState();

}

class _TabPanelState extends State<TabPanel>{

  final CharactersDataModel _charactersModel = CharactersDataModel();
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);
  
  @override
  Widget build(BuildContext context) {
    return TabPanelView(
      dataModel: _charactersModel,
      notifier: _notifier,
    );
  }
}

class TabPanelView extends StatelessWidget{
  final CharactersDataModel dataModel;
  final ValueNotifier<ThemeMode> notifier;

  const TabPanelView({super.key, required this.dataModel, required this.notifier, });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: notifier,
      builder: (_, mode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: notifier.value,
          home: DefaultTabController(
            length: 3, 
            child: Scaffold(
              bottomNavigationBar: const TabBar(tabs: [
                Tab(icon: Icon(Icons.home_outlined),),
                Tab(icon: Icon(Icons.favorite_outlined),),
                Tab(icon: Icon(Icons.settings_outlined),)
              ]),
              body: TabBarView(children: [
                CharactersDataProvider(
                  model: dataModel,
                  child: const HomeTab()
                ),
                CharactersDataProvider(
                  model: dataModel,
                  child: const FavoriteTab()
                ),
                SettingsTab(themeMode: notifier)
              ]),
            ) 
          ) 
        );
      },
    );
  }

}