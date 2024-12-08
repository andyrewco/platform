import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local/components/buttons/core_button.dart';
import 'package:local/theme/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: SvgPicture.string(
              kIconVert,
              theme: SvgTheme(
                currentColor: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            16.0,
            16.0,
            16.0,
            0.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: _buildProfileMeta(context),
              ),
              SizedBox(
                height: 16,
              ),
              _buildDescription(),
              SizedBox(
                height: 16,
              ),
              _buildSocialsBar(),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: CoreButton(
                      click: () {},
                      text: "Settings",
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildSocialsBar() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.purple,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text("Andrew")
        ],
      ),
    );
  }

  Text _buildDescription() {
    return Text(
      "This is some description text, This is some description text This is some description text",
    );
  }

  Row _buildProfileMeta(BuildContext context) {
    return Row(
      children: [
        _buildAvatar(),
        const SizedBox(
          width: 16,
        ),
        _buildProfileDetails(context),
      ],
    );
  }

  Column _buildProfileDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Andrew",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Text(
          "@andrewcohen",
        ),
        const Row(
          children: [
            Text("24"),
            SizedBox(
              width: 4,
            ),
            Text("v's"),
            SizedBox(
              width: 8,
            ),
            Text("48"),
            SizedBox(
              width: 4,
            ),
            Text("vo's"),
          ],
        ),
      ],
    );
  }

  Container _buildAvatar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.blue,
      ),
      width: 100,
      height: 100,
    );
  }
}
