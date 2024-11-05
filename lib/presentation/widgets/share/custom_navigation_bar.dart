import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return NavigationBar(
      backgroundColor: colors.surface,
      onDestinationSelected: (int index) {},
      indicatorColor: colors.primary,
      destinations: <Widget>[
        NavigationDestination(
          selectedIcon: Icon(
            Icons.home_max,
            color: colors.onPrimary,
          ),
          icon: const Icon(
            Icons.home_max_outlined,
          ),
          label: 'Inicio',
        ),
        const NavigationDestination(
          icon: Badge(child: Icon(Icons.label_outline)),
          label: 'Categorias',
        ),
        const NavigationDestination(
          icon: Badge(
            label: Text('2'),
            child: Icon(Icons.favorite_outline),
          ),
          label: 'Favoritos',
        ),
      ],
    );
  }
}
