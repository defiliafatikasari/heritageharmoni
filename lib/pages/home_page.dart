import 'dart:async';
import 'package:flutter/material.dart';
import 'culture_page.dart';
import 'explore_page.dart';
import 'education_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    BerandaPage(),
    CulturePage(),
    ExplorePage(),
    EducationPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Budaya",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: "Jelajahi",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: "Edukasi",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}

// ====================== HALAMAN BERANDA ======================
class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  String selectedCategory = "Budaya";
  String selectedCity = "Semua";

  final List<Map<String, String>> banners = [
    {'image': 'assets/benner/Benner1.png'},
    {'image': 'assets/benner/Benner2.png'},
    {'image': 'assets/benner/Benner3.png'},
  ];

  final List<String> cities = ['Semua', 'Pamekasan', 'Sumenep', 'Bangkalan', 'Sampang'];

  final Map<String, List<Map<String, String>>> newsByCategory = {
    'Budaya': [
      {'title': 'Festival Batik Nusantara', 'image': 'https://cdn.antaranews.com/cache/1200x800/2018/10/karnival.jpg'},
      {'title': 'Upacara Adat Madura', 'image': 'https://asset.kompas.com/crops/hK5puGOvaI3mpFJZGo9m_h7W2sM=/0x0:589x393/1200x800/data/photo/2022/03/06/62242da869e3c.jpeg'},
    ],
    'Seni': [
      {'title': 'Pameran Seni Lukis Tradisional', 'image': 'https://img.antarafoto.com/cache/1200x765/2014/08/31/pameran-lukisan-tradisional-bali-98tq-dom.jpg'},
      {'title': 'Pagelaran Tari Madura', 'image': 'https://img.antarafoto.com/cache/1200x737/2009/08/09/tari-1j88-dom.jpg'},
    ],
    'Tradisi': [
      {'title': 'Pelatihan Anyaman Bambu', 'image': 'https://img.antarafoto.com/cache/1200x800/2021/08/22/pelatihan-kerajinan-anyaman-bambu-vdca-dom.jpg'},
      {'title': 'Festival Karapan Sapi', 'image': 'https://cdn.antaranews.com/cache/1200x800/2017/10/20171015Seleksi-Tingkat-Kabupaten-151017-sb-4.jpg'},
    ],
  };

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _currentPage = (_currentPage + 1) % banners.length;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final newsList = newsByCategory[selectedCategory]!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= Header Profil =================
              Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/images/heritage.png'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Selamat Datang,',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        'Defilia Fatikasari',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5D4037),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 14),

              // ================= Kolom Pencarian =================
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Cari berita dan informasi budaya...',
                  filled: true,
                  fillColor: const Color(0xFFF3EDE4),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              // ================= Banner Auto Slide =================
              SizedBox(
                height: 180,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: banners.length,
                      itemBuilder: (context, index) {
                        final banner = banners[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            banner['image']!,
                            fit: BoxFit.contain,
                            width: double.infinity,
                          ),
                        );
                      },
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                    ),

                    // Panah kiri
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: Container(
                          width: 32, 
                          height: 32, 
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.3),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero, // Hilangkan padding default
                            iconSize: 18, // Ukuran ikon
                            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                            onPressed: () {
                              int prevPage = (_currentPage - 1 + banners.length) % banners.length;
                              _pageController.animateToPage(
                                prevPage,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    // Panah kanan
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.3),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            iconSize: 18,
                            icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                            onPressed: () {
                              int nextPage = (_currentPage + 1) % banners.length;
                              _pageController.animateToPage(
                                nextPage,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    // Indikator titik
                    Positioned(
                      bottom: 8,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          banners.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: _currentPage == index ? 12 : 8,
                            height: _currentPage == index ? 12 : 8,
                            decoration: BoxDecoration(
                              color: _currentPage == index ? Colors.orange : Colors.grey[400],
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ================= Kategori =================
              const SizedBox(height: 16),
              const Text(
                'Kategori Budaya',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5D4037),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (var cat in ['Budaya', 'Seni', 'Tradisi'])
                    GestureDetector(
                      onTap: () => setState(() => selectedCategory = cat),
                      child: Chip(
                        label: Text(
                          cat,
                          style: TextStyle(
                            color: selectedCategory == cat ? Colors.white : Colors.brown,
                          ),
                        ),
                        backgroundColor: selectedCategory == cat
                            ? Colors.orange
                            : const Color(0xFFEBDAC4),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),

              // ================= Dropdown Filter Kota =================
              DropdownButtonFormField<String>(
                initialValue: selectedCity,
                items: cities
                    .map((city) => DropdownMenuItem(
                          value: city,
                          child: Text(city),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCity = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Filter Kota",
                  filled: true,
                  fillColor: const Color(0xFFF3EDE4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // ================= Daftar Berita =================
              const Text(
                'Berita dan Informasi Terkini',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5D4037),
                ),
              ),
              const SizedBox(height: 12),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: newsList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final item = newsList[index];
                  return _NewsCard(image: item['image']!, title: item['title']!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ====================== Widget Tambahan ======================
class _NewsCard extends StatelessWidget {
  final String image;
  final String title;
  const _NewsCard({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFDF6F0),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(2, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              image, // pakai network
              height: 90,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF5D4037),
              ),
            ),
          )
        ],
      ),
    );
  }
}