import 'package:flutter/material.dart';

class UnaerpAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey; // Chave necessária para abrir o Drawer

  const UnaerpAppBar({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 3, 37, 101),
      elevation: 0,
      centerTitle: false,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Image.asset(
          'lib/assets/logo-branca.png',
          height: 30,
          fit: BoxFit.contain,
          alignment: Alignment.centerLeft,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset('lib/assets/mensagem.png', width: 26, height: 26),
        ),
        IconButton(
          onPressed: () {
            // Abre o menu lateral direito
            scaffoldKey.currentState?.openEndDrawer();
          },
          icon: Image.asset('lib/assets/menu.png', width: 24, height: 24),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}