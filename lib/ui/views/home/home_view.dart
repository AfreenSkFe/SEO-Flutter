import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/link_renderer/link_renderer_web.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';
import 'package:stacked/stacked.dart';
import 'package:starter_project/ui/common/app_colors.dart';
import 'package:starter_project/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                verticalSpaceLarge,
                Column(
                  children: [
                    // const Text(
                    //   'Hello, STACKED!',
                    //   style: TextStyle(
                    //     fontSize: 35,
                    //     fontWeight: FontWeight.w900,
                    //   ),
                    // ),
                    TextRenderer(
                        text: 'CRM Demo site',
                        style: TextRendererStyle.header1,
                        child: Text('CRM Demo')),
                    verticalSpaceMedium,
                    TextRenderer(child: Text('This is a paragraph'),
                    style: TextRendererStyle.paragraph,text: '',),
                    verticalSpaceMedium,
                    LinkRenderer(
                      text: '',
                      href: 'https://www.flutter.dev',
                      child: InkWell(
                        onTap: () =>
                            viewModel.launch('https://www.flutter.dev'),
                        child: Text(
                          'Click here',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                    verticalSpaceMedium,
                    MaterialButton(
                      color: Colors.black,
                      onPressed: viewModel.incrementCounter,
                      child: Text(
                        viewModel.counterLabel,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      color: kcDarkGreyColor,
                      onPressed: viewModel.showDialog,
                      child: const Text(
                        'Show Dialog',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    MaterialButton(
                      color: kcDarkGreyColor,
                      onPressed: viewModel.showBottomSheet,
                      child: const Text(
                        'Show Bottom Sheet',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
