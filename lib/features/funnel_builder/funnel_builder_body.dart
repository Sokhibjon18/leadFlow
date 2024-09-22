import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_flow/features/funnel_builder/domain/funnel_builder_cubit.dart';
import 'package:lead_flow/features/funnel_builder/widgets/components_view.dart';
import 'package:lead_flow/features/funnel_builder/widgets/pages_view.dart';
import 'package:lead_flow/features/funnel_builder/widgets/phone_param_builder.dart';

class FunnelBuilderBody extends StatelessWidget {
  const FunnelBuilderBody({super.key, required this.projectName});

  final String projectName;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FunnelBuilderCubit, FunnelBuilderState>(
      listener: (context, state) {
        state.mapOrNull(
          publishing: (_) {
            showDialog(
              context: context,
              builder: (_) => Container(
                color: Colors.white,
                height: 100,
                width: 100,
                child: Center(child: CircularProgressIndicator()),
              ),
              barrierDismissible: false,
            );
          },
          published: (links) {
            context.router.maybePop();
            showDialog(
              context: context,
              builder: (_) => Container(
                color: Colors.white,
                height: 100,
                width: 400,
                child: Column(
                  children: [
                    SelectableText('Facebook: ' + links.facebookLink),
                    SelectableText('Telegram: ' + links.teleLink),
                    SelectableText('Instagram: '+links.intaLink),
                    SelectableText("Twitter: "+links.twitterLink)
                  ]
                ),
              ),
              barrierDismissible: false,
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 36,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Pages',
                            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 16),
                        Expanded(
                          child: Container(
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: const PagesView(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(projectName, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 16),
                  Expanded(child: const PhoneParamBuilder()),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 36,
                    width: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Components',
                              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                onPressed: () {
                                  context.read<FunnelBuilderCubit>().publish(projectName);
                                },
                                child: const Text(
                                  'Publish',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: Container(
                            width: 450,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: const SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: ComponentsView(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
