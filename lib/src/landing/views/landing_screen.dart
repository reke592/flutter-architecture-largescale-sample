import 'package:auth/auth.dart';
import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:largescale/src/landing/bloc/app_bar_nav_bloc.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with TickerProviderStateMixin {
  final List<Tab> _tabs = [];
  final List<Widget> _views = [];
  TabController? _tabController;

  @override
  void initState() {
    context.read<AppBarNavBloc>().add(InitializeLandingAppBar());
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBarNavBloc, AppBarNavState>(
      listener: (context, state) {
        if (state is AppBarNavRegistered) {
          setState(() {
            final curIndex = _tabController?.index;
            final tab = Tab(
              icon: state.icon,
              child: state.label,
            );
            final view = PersistentWidget(child: state.content);
            _tabController?.dispose();
            if (state.index > 0) {
              _tabs.insert(state.index, tab);
              _views.insert(state.index, view);
            } else {
              _tabs.add(tab);
              _views.add(view);
            }
            _tabController = TabController(
              initialIndex: curIndex ?? 0,
              length: _tabs.length,
              vsync: this,
            );
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Practice'),
          actions: [
            PopupMenuButton<void>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: const Row(
                    children: [
                      Text('Logout'),
                      Icon(Icons.logout),
                    ],
                  ),
                  onTap: () {
                    context.read<AuthProvider>().user = null;
                    context.router.goNamed(kLoginRouteName);
                  },
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              controller: _tabController,
              tabs: _tabs,
              onTap: (value) {
                _tabController?.animateTo(value);
              },
            ),
            Expanded(
              child: TabBarView(
                key: ValueKey(_tabs.length),
                controller: _tabController,
                children: _views,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
