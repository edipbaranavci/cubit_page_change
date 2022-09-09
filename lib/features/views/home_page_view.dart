import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/enums/cubit/home_cubit/home_page_cubit.dart';
import '../../core/constants/enums/home_page_enums.dart';
import '../screens/screen1.dart';
import '../screens/screen2.dart';
import '../screens/screen3.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedPage = context.select<HomePageCubit, HomePageEnums>(
      (cubit) => cubit.state.pageEnums,
    );
    return Scaffold(
      body: IndexedStack(
        index: selectedPage.index,
        children: const [
          Screen1(),
          Screen2(),
          Screen3(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _HomePageChangeButton(
              buttonTitle: 'Screen1',
              goPage: HomePageEnums.page1,
              selectedPage: selectedPage,
            ),
            _HomePageChangeButton(
              buttonTitle: 'Screen2',
              goPage: HomePageEnums.page2,
              selectedPage: selectedPage,
            ),
            _HomePageChangeButton(
              buttonTitle: 'Screen3',
              goPage: HomePageEnums.page3,
              selectedPage: selectedPage,
            ),
          ],
        ),
      ),
    );
  }
}

class _HomePageChangeButton extends StatelessWidget {
  const _HomePageChangeButton({
    Key? key,
    required this.goPage,
    required this.selectedPage,
    required this.buttonTitle,
  }) : super(key: key);

  final HomePageEnums goPage;
  final HomePageEnums selectedPage;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (contextState) {
        return TextButton(
          onPressed: () {
            contextState.read<HomePageCubit>().setPage(goPage);
          },
          child: Text(
            buttonTitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: selectedPage == goPage
                      ? Theme.of(context).primaryColor
                      : null,
                ),
          ),
        );
      },
    );
  }
}
