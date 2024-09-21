import 'package:flutter/material.dart';
import 'package:lead_flow/features/funnel_builder/widgets/components_view.dart';
import 'package:lead_flow/features/funnel_builder/widgets/pages_view.dart';

class FunnelBuilderPage extends StatelessWidget {
  const FunnelBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      body: Padding(
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
                  const Text('NAME', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Image.asset(
                      'assets/images/phone_corpse.png',
                      width: 433,
                    ),
                  ),
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
                        const Text(
                          'Components',
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
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
