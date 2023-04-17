import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:syncrolife/controllers/profile_page_controller.dart';
import 'package:syncrolife/services/auth_service.dart';

import '../../../styles.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfilePageController>();
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const Divider(),
          controller.auth.isDoctor.value
              ? Column(
                  children: [
                    ListTile(
                      onTap: () {
                        controller.selectMainImage();
                      },
                      title: const Text('Atualizar imagem principal'),
                    ),
                    const Divider(),
                  ],
                )
              : SizedBox(),
          ListTile(
            onTap: () {
              controller.selectCoverImage();
            },
            title: const Text('Atualizar imagem da capa'),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            title: const Text('Atualizar dados pessoais'),
          ),
          const Divider(),
          ListTile(
            onTap: () => controller.auth.logout(),
            leading: const Icon(
              Icons.exit_to_app,
              color: lightRed,
            ),
            title: const Text(
              'Sair',
              style: TextStyle(color: lightRed),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
