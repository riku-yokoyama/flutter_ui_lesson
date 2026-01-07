import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/* ======================
   App
====================== */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: XProfilePage(),
    );
  }
}

/* ======================
   Xプロフィールページ
====================== */
class XProfilePage extends StatelessWidget {
  const XProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Name',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
            Text('234 posts',
                style: TextStyle(fontSize: 12, color: Colors.grey))
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        children: [ProfileHeader(), ProfileTabs(), Divider(), PostList()],
      ),
    );
  }
}

/* ======================
   ヘッダー部
====================== */
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // カバー画像
        Container(
          height: 150,
          color: Colors.blueGrey,
        )
      ],
    );
  }
}

/* ======================
   タブ
====================== */
class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/* ======================
   ポスト
====================== */
class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
