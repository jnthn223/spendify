import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendify/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:spendify/core/init_dependencies.dart';
import 'package:spendify/core/layout/page.layout.dart';
import 'package:spendify/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:spendify/core/theme/theme.dart';
import 'package:spendify/features/auth/presentation/pages/login_page.dart';
import 'package:spendify/features/budget/presentation/pages/budget.page.dart';
import 'package:spendify/features/categories/presentation/pages/categories.page.dart';
import 'package:spendify/features/dashboard/presentation/pages/dashboard.page.dart';
import 'package:spendify/features/expenses/presentation/pages/expenses.page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AppUserCubit>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      ),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late AppPage activePage;
  late List<AppPage> pages;
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserSignedIn());
    pages = [
      const DashboardPage(),
      const CategoriesPage(),
      const BudgetPage(),
      const ExpensesPage(),
    ];
    activePage = pages[0];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spendify',
      theme: AppTheme.getTheme(context),
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserSignedIn;
        },
        builder: (context, isSignedIn) {
          if (isSignedIn) {
            return PageLayout(
              pages: pages,
              setActivePage: (page) {
                setState(() {
                  activePage = page;
                });
              },
              activePage: activePage,
            );
          }
          return const LoginPage();
        },
      ),
    );
  }
}
