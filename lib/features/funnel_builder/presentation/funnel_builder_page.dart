import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lead_flow/features/funnel_builder/presentation/widgets/components_view.dart';
import 'package:lead_flow/features/funnel_builder/presentation/widgets/pages_view.dart';

@RoutePage()
class FunnelBuilderPage extends StatelessWidget {
  final String projectName;
  const FunnelBuilderPage({super.key, required this.projectName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 16),
        child: Column(
          children: [
            Text(projectName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: const PagesView(),
                  ),
                  Image.asset(
                    'assets/images/phone_corpse.png',
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: 433,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: 300,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
