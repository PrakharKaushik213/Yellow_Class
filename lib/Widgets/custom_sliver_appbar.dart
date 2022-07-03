import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.yellow,
      shadowColor: Colors.black,
      floating: true,
      leadingWidth: 100.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: Image.asset(
          'lib/images/yc.png',
          fit: BoxFit.fill,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.cast),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          iconSize: 40.0,
          icon: const CircleAvatar(
            foregroundImage: NetworkImage(
                "https://media-exp2.licdn.com/dms/image/C4D03AQG8FqzZebU-PQ/profile-displayphoto-shrink_400_400/0/1654248153036?e=1662595200&v=beta&t=w-ugoS7fvpG2GtQgcN8j3hRnbtHlCKXmO_Ilpnk5O1Q"),
          ),
          onPressed: () {
            final snackBar = SnackBar(
              content: const Text(
                  'Made by Prakhar Kaushik - RA1911003010504 SRM KTR'),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ],
    );
  }
}
