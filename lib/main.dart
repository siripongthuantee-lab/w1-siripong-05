import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/second': (context) => const SecondPage()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        "ข้อมูลส่วนตัว",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                    ),
                    const SizedBox(height: 16),

                    _buildInfoCard(Icons.phone, Colors.green, "เบอร์โทรศัพท์", "0934870274"),
                    const SizedBox(height: 12),

                    _buildInfoCard(Icons.cake, Colors.pink, "วันเกิด", "12 พฤษภาคม 2548"),
                    const SizedBox(height: 12),

                    _buildInfoCard(Icons.location_on, Colors.orange, "ที่อยู่", "ชลบุรี"),
                    const SizedBox(height: 12),

                    _buildInfoCard(Icons.school, Colors.purple, "การศึกษา", "วิทยาลัยเทคโนโลยีภาคตะวันออก (อี.เทค)"),
                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/second'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 2,
                        ),
                        child: const Text("ไปยังหน้า 2", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.blue),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Text(
              "ข้อมูลส่วนตัว",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white)
          ),
          const SizedBox(height: 15),

          GestureDetector(
            onTap: () {
              _showImageDialog(context, "http://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721610169235.jpg");
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(80)
              ),
              child: ClipOval(
                child: Image.network(
                  "http://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721610169235.jpg",
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 150,
                    height: 150,
                    color: Colors.grey[300],
                    child: Icon(Icons.person, size: 80, color: Colors.grey[600]),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),

          const Text(
              "Siripong Thuantee",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 26)
          ),

          const Text(
              "siripong.thuantee@e-tech.ac.th",
              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 14)
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, Color color, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2)
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(icon, size: 28, color: color),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    label,
                    style: const TextStyle(fontSize: 12, color: Colors.grey)
                ),
                const SizedBox(height: 2),
                Text(
                    value,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Center(
                  child: InteractiveViewer(
                    minScale: 0.5,
                    maxScale: 4.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => const Icon(
                          Icons.error,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context)
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {
                _showOptionsMenu(context);
              }
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildProfileImage(context),
                    SizedBox(width: screenWidth * 0.05),
                    _buildStats(),
                  ],
                ),
                const SizedBox(height: 12),

                Row(
                  children: [
                    const Text(
                        "Siripong_Thuantee",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.verified, color: Colors.blue[400], size: 16),
                  ],
                ),
                const SizedBox(height: 4),

                Row(
                  children: [
                    Icon(Icons.music_note, size: 12, color: Colors.grey[400]),
                    const SizedBox(width: 4),
                    Text("_is_bdg_x", style: TextStyle(fontSize: 12, color: Colors.grey[400])),
                  ],
                ),
                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isFollowing = !isFollowing;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(isFollowing ? "กำลังติดตามแล้ว" : "เลิกติดตามแล้ว"),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isFollowing ? Colors.grey[800] : Colors.yellow,
                          foregroundColor: isFollowing ? Colors.white : Colors.black,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        ),
                        child: Text(
                          isFollowing ? "กำลังติดตาม" : "ติดตาม",
                          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () {
                          _showShareDialog(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey[700]!),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        ),
                        child: const Icon(Icons.share, size: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          _buildTabs(),

          _buildImageGrid(context),
        ],
      ),
    );
  }

  void _showOptionsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text("ตั้งค่า", style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.block, color: Colors.white),
                title: const Text("บล็อก", style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.report, color: Colors.white),
                title: const Text("รายงาน", style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showShareDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text("แชร์โปรไฟล์", style: TextStyle(color: Colors.white)),
          content: const Text(
            "คัดลอกลิงก์โปรไฟล์",
            style: TextStyle(color: Colors.grey),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("คัดลอกลิงก์แล้ว"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: const Text("คัดลอก", style: TextStyle(color: Colors.yellow)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("ยกเลิก", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MyHomePage._showImageDialog(
            context,
            "http://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721610169235.jpg"
        );
      },
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.pink, width: 2)
        ),
        child: ClipOval(
          child: Image.network(
            "http://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721610169235.jpg",
            width: 75,
            height: 75,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 75,
              height: 75,
              color: Colors.grey[800],
              child: const Icon(Icons.person, size: 40, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStats() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatColumn("232", "ติดตาม"),
          _buildStatColumn("315", "ผู้ติดตาม"),
          _buildStatColumn("965.5 K", "ถูกใจ"),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: Colors.grey[400]),
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[800]!, width: 0.5))
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.white, width: 1))
              ),
              child: const Icon(Icons.grid_on, size: 24, color: Colors.white),
            ),
          ),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Icon(Icons.video_collection_outlined, size: 24, color: Colors.grey[600])
              )
          ),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Icon(Icons.person_pin_outlined, size: 24, color: Colors.grey[600])
              )
          ),
        ],
      ),
    );
  }

  Widget _buildImageGrid(BuildContext context) {
    final images = [
      "https://images.pexels.com/photos/1424687/pexels-photo-1424687.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "https://s.widget-club.com/images/YyiR86zpwIMIfrCZoSs4ulVD9RF3/ac8deb555a6c546571fccac6a4824f89/6604ec759db77ed7f2457e0463a17b8e.jpg?q=70&w=500",
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      padding: EdgeInsets.zero,
      children: images.map((url) => GestureDetector(
        onTap: () {
          MyHomePage._showImageDialog(context, url);
        },
        child: Image.network(
          url,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.grey[800],
              child: const Icon(Icons.image, color: Colors.grey)
          ),
        ),
      )).toList(),
    );
  }
}