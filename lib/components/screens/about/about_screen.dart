import 'dart:ui';

import 'package:elecar/app_colors.dart';
import 'package:elecar/app_resources.dart';
import 'package:elecar/components/screens/bloc/navigation_menu_bloc.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24.0, 56.0, 24.0, 56.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildAboutImage(),
            const SizedBox(height: 96.0),
            const _Title(),
            const SizedBox(height: 16.0),
            const _Description(),
            const SizedBox(height: 32.0),
            Align(
              alignment: Alignment.centerLeft,
              child: _buildKnowMoreButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutImage() {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            AppResources.about,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 0.0,
          bottom: -50.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                width: 200.0,
                height: 100.0,
                color: AppColors.white.withOpacity(0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      '2.500+',
                      style: TextStyle(
                        height: 1.4,
                        fontSize: 16.0,
                        fontFamily: 'Exo',
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Supercharges placed along\npopular routes',
                      style: TextStyle(
                        height: 1.4,
                        fontSize: 12.0,
                        fontFamily: 'Exo',
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildKnowMoreButton(BuildContext context) {
    return GestureDetector(
      onTap: Feedback.wrapForTap(
        () => context.navigationMenuBloc.jumpToPage(NavigationMenuPage.home),
        context,
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: AppColors.primaryColor,
        ),
        child: const Text(
          'Know more',
          style: TextStyle(
            height: 1.4,
            fontSize: 15.0,
            fontFamily: 'Exo',
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Machines With\nFuture Technology',
      style: TextStyle(
        height: 1.4,
        fontSize: 20.0,
        fontFamily: 'Exo',
        fontWeight: FontWeight.w600,
        color: AppColors.titleColor,
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'See the future with high-performance electric cars produced by renowned brands. They feature futuristic builds and designs with new and innovative platforms that last a long time.',
      style: TextStyle(
        height: 1.4,
        fontSize: 15.0,
        fontFamily: 'Exo',
        fontWeight: FontWeight.w400,
        color: AppColors.textColor,
      ),
    );
  }
}
