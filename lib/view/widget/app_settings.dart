import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _isExpand = false;
  bool _isExpanded = false;
  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        title: const Text('App Settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      ),
      body: ListView(
        children: [
          _buildRestaurantCard(),
          _buildMenuCard(),
        ],
      ),
    );
  }

  Widget _buildRestaurantCard() {

    return Card(
      child: Column(
        children: [
          ListTile(
            title: const Text('My Account'),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            subtitle: const Text(
              'Theme, Favourites, Referrals, ',
              style: TextStyle(fontSize: 13),
            ),
          ),
          if (_isExpanded)
            const Column(
              children: [
                ListTile(
                  leading: Icon(Icons.color_lens),
                  title: Text(
                    'Theme',
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text(
                    'Favourites',
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text(
                    'Referrals',
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildMenuCard() {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: const Text('Help & Feedback'),
            onTap: () {
              setState(() {
                _isExpand = !_isExpand;
              });
            },
          ),
          if (_isExpand)
            Column(
              children: [
                const ListTile(
                  title: Text('Rate Our App'),
                ),
                const Divider(),
                ListTile(
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Here you can implement the logic for submitting the rating
                      print('Submitted rating: $_rating');
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
