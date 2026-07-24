// lib/profile_page.dart
import 'package:flutter/material.dart';
import 'main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildProfileHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildActionButtons(),
                    const SizedBox(height: 16),
                    _buildQuickLinks(),
                    const SizedBox(height: 16),
                    _buildTabBar(),
                    const SizedBox(height: 12),
                    _buildContentGrid(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [kPurple, kPink],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kSurface,
                    ),
                    child: const Center(
                      child: Text(
                        "closer",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "closer",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: kPurple,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "@closer",
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Followed by athletes, creators, and fans",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [kPurple, kPink]),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  "Following",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white24),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  "Message",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickLinks() {
    final items = [
      {"icon": Icons.school, "label": "NIL Tips"},
      {"icon": Icons.mic, "label": "Live Q&A", "live": true},
      {"icon": Icons.people, "label": "Creator Help"},
      {"icon": Icons.badge, "label": "Fan Access"},
      {"icon": Icons.person, "label": "Athlete Spotlights"},
    ];

    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kPurple.withOpacity(0.3)),
                  ),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          item["icon"] as IconData,
                          size: 34,
                          color: Colors.white,
                        ),
                        if (item["live"] == true)
                          Positioned(
                            top: 4,
                            right: 4,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 1),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                "LIVE",
                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item["label"] as String,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.1))),
      ),
      child: DefaultTabController(
        length: 5,
        child: TabBar(
          isScrollable: true,
          indicatorColor: kPurple,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: "Feed"),
            Tab(text: "Live"),
            Tab(text: "Community"),
            Tab(text: "Vault"),
            Tab(text: "Events"),
          ],
        ),
      ),
    );
  }

  Widget _buildContentGrid() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          // Row 1
          Row(
            children: [
              Expanded(
                child: _ContentCard(
                  image: "assets/athlete_lifting.jpg", // replace with your images
                  label: "LEVEL UP\nYOUR NAME. YOUR BRAND. YOUR FUTURE.",
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ContentCard(
                  image: "assets/podcast.jpg",
                  label: "",
                  isPodcast: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Row 2
          Row(
            children: [
              Expanded(
                child: _ContentCard(
                  image: "assets/ask_anything.jpg",
                  label: "ASK US ANYTHING",
                  subtitle: "EVERY WEDNESDAY\n7PM ET / 4PM PT",
                  isLive: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ContentCard(
                  image: "assets/group.jpg",
                  label: "",
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Row 3
          Row(
            children: [
              Expanded(
                child: _ContentCard(
                  image: "assets/basketball.jpg",
                  label: "",
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ContentCard(
                  image: "assets/interview.jpg",
                  label: "",
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _ContentCard(
                  image: "assets/team.jpg",
                  label: "",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContentCard extends StatelessWidget {
  final String image;
  final String label;
  final String? subtitle;
  final bool isLive;
  final bool isPodcast;

  const _ContentCard({
    super.key,
    required this.image,
    required this.label,
    this.subtitle,
    this.isLive = false,
    this.isPodcast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kSurface,
        image: DecorationImage(
          image: const AssetImage("assets/placeholder.jpg"), // use real images later
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          if (isLive)
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("LIVE Q&A", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ),
          if (label.isNotEmpty)
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ),
          // Add more overlays as needed from the screenshot
        ],
      ),
    );
  }
}
