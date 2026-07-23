import 'package:flutter/material.dart';

void main() {
  runApp(const CloserApp());
}

const Color kBackground = Color(0xFF090909);
const Color kSurface = Color(0xFF151515);
const Color kPurple = Color(0xFF9C4DFF);
const Color kPink = Color(0xFFFF4FA6);

class CloserApp extends StatelessWidget {
  const CloserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Closer",
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kBackground,
        fontFamily: "Roboto",
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final stories = [
    "Your Circle",
    "Creator Picks",
    "Closer Team",
    "Architecture",
    "City",
    "Photography",
    "Travel",
    "Music",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildHeader(),

            const SizedBox(height: 10),

            buildStories(),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 30),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return FeedCard(
                    user: "creator_$index",
                    caption:
                        "Good design isn't just about how it looks—it's about how it makes life feel a little better.",
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, color: Colors.white, size: 30),
          ),
          const Spacer(),
          ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [kPurple, kPink],
              ).createShader(bounds);
            },
            child: const Icon(
              Icons.chat_bubble,
              color: Colors.white,
              size: 36,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            "Closer",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none, size: 30),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: kPink,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildStories() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return StoryBubble(
            label: stories[index],
            onTap: () {},
          );
        },
      ),
    );
  }

  Widget buildBottomBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF101010),
        border: Border(
          top: BorderSide(
            color: Colors.white10,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomButton(
            icon: Icons.home_outlined,
            label: "Home",
            selected: selectedIndex == 0,
            onTap: () {
              setState(() => selectedIndex = 0);
            },
          ),
          BottomButton(
            icon: Icons.explore_outlined,
            label: "Explore",
            selected: selectedIndex == 1,
            onTap: () {
              setState(() => selectedIndex = 1);
            },
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [kPurple, kPink],
                ),
                boxShadow: [
                  BoxShadow(
                    color: kPurple.withOpacity(.35),
                    blurRadius: 15,
                  )
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: kBackground,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, size: 36),
              ),
            ),
          ),
          BottomButton(
            icon: Icons.chat_bubble_outline,
            label: "Chats",
            selected: selectedIndex == 3,
            onTap: () {
              setState(() => selectedIndex = 3);
            },
          ),
          BottomButton(
            icon: Icons.person_outline,
            label: "Profile",
            selected: selectedIndex == 4,
            onTap: () {
              setState(() => selectedIndex = 4);
            },
          ),
        ],
      ),
    );
  }
}

class StoryBubble extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const StoryBubble({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: 90,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [kPurple, kPink],
                  ),
                ),
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: const BoxDecoration(
                    color: kSurface,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 38,
                    color: Colors.white70,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FeedCard extends StatelessWidget {
  final String user;
  final String caption;
  final VoidCallback onTap;

  const FeedCard({
    super.key,
    required this.user,
    required this.caption,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: kSurface,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: kPurple,
                    child: Icon(Icons.person),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    user,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Container(
                height: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF41295a),
                      Color(0xFF2F0743),
                      kPink,
                    ],
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.image,
                    size: 90,
                    color: Colors.white30,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                caption,
                style: const TextStyle(
                  fontSize: 20,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chat_bubble_outline),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_border),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const BottomButton({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? kPurple : Colors.white70;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
