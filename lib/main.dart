import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/* ======================
   アプリ全体
 ====================== */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 右上のdebugみたいな文字を消す
      home: const InstagramLikePage(),
    );
  }
}

/* ======================
   メイン画面
 ====================== */
class InstagramLikePage extends StatelessWidget {
  const InstagramLikePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1, // 影の濃さを定義する
        title: const Text(
          'Instagram',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        // actionsはAppBarのプロパティで、タイトルの右に配置するアイコンを定義する
        actions: [
          Icon(Icons.favorite_border, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.send, color: Colors.black),
          SizedBox(width: 8)
        ],
      ),
      body: ListView(
        children: [StoryList(), Divider(), PostList()],
      ),
    );
  }
}

/* ======================
   ストーリー一覧
 ====================== */
class StoryList extends StatelessWidget {
  const StoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return StoryItem(username: 'user$index');
        },
      ),
    );
  }
}

/* ======================
   ストーリー1件
 ====================== */
class StoryItem extends StatelessWidget {
  final String username;

  const StoryItem({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          /// 大枠はグラデーションで装飾したいのでContainer
          Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Color(0xFFF58529),
                  Color(0xFFDD2A7B),
                  Color(0xFF8134AF)
                ])),

            /// 子要素としてCircleAvatarを仕込む
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 26,
                backgroundColor: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(username, style: const TextStyle(fontSize: 10))
        ],
      ),
    );
  }
}

/* ======================
   投稿一覧
 ====================== */
class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children:

            /// childrenでListViewを置くのではNG
            /// List.generateでListの子要素を全て展開する
            /// これにより、chilrenの要素はpost,post,post,post.postになる
            List.generate(5, (index) => PostItem(username: 'user$index')));
  }
}

/* ======================
   投稿1件
 ====================== */
class PostItem extends StatelessWidget {
  final String username;

  const PostItem({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 投稿ヘッダー
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.grey,
          ),
          title: Text(username),
          trailing: const Icon(Icons.more_vert),
        ),

        // 投稿画像(ダミー)
        Container(
          height: 250,
          color: Colors.grey[300],
          child: const Center(
            child: Icon(
              Icons.image,
              size: 100,
              color: Colors.white,
            ),
          ),
        ),

        // 投稿に対するアクション欄(いいね、リプなど)
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.favorite_border),
              SizedBox(width: 12),
              Icon(Icons.comment_bank_outlined),
              SizedBox(width: 12),
              Icon(Icons.send)
            ],
          ),
        ),

        // テキスト
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('いいね! : user1、他',
                style: TextStyle(fontWeight: FontWeight.bold))),

        const SizedBox(height: 16)
      ],
    );
  }
}
