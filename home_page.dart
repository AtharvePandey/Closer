// lib/home_page.dart
import 'package:flutter/material.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            _buildHeader(),
            const SizedBox(height: 10),
            _buildStories(),
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
    );
  }

  Widget _buildHeader() {
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
            shaderCallback: (bounds) => kBrandGradient.createShader(bounds),
            child: const Icon(Icons.chat_bubble, color: Colors.white, size: 36),
          ),
          const SizedBox(width: 10),
          ShaderMask(
            shaderCallback: (bounds) => kBrandGradient.createShader(bounds),
            child: const Text(
              "Closer",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
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
                    color: Color(0xFFFB359A),
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

  Widget _buildStories() {
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: kBrandGradient,
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
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: kBrandGradient,
                    ),
                    padding: const EdgeInsets.all(2),
                    child: const CircleAvatar(
                      backgroundColor: kSurface,
                      child: Icon(Icons.person, color: Colors.white70),
                    ),
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
                  gradient: kBrandGradient,
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 90, color: Colors.white30),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                caption,
                style: const TextStyle(fontSize: 20, height: 1.5),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
