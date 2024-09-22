import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lead_flow/core/router/app_router.gr.dart';
import 'package:lead_flow/core/widgets/common_text_filed.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> projectNames = [];
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recent projects',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 32),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 64),
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  _buildCreateProjectTile(context),
                  ...projectNames.map(_buildProjectTile),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCreateProjectTile(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showMyDialog(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 50),
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Color(0xFF071337),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 50, color: Colors.white),
            SizedBox(height: 8),
            Text(
              'Create a project',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProjectTile(String projectName) {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color(0xFF071337),
      ),
      child: Center(
        child: Text(
          projectName,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Funnel name'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                CommonTextField(
                  controller: nameController,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                context.router
                    .push(FunnelBuilderProviderRoute(appName: nameController.text));
              },
            ),
          ],
        );
      },
    );
  }
}
