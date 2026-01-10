import 'package:flutter/material.dart';

// จุดเริ่มต้นของแอป เรียกใช้ MyApp
void main() => runApp(const MyApp());

// คลาสหลักของแอปพลิเคชัน
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // กำหนดธีมสีของแอป
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // กำหนดหน้าแรกที่เปิดขึ้นมา
      initialRoute: '/',
      // กำหนด routes สำหรับการนำทาง
      routes: {
        '/': (context) => const MyHomePage(), // หน้าแรก
        '/second': (context) => const SecondPage() // หน้าที่สอง (TikTok Style)
      },
    );
  }
}

// ========================================
// หน้าแรก - MyHomePage (หน้าข้อมูลส่วนตัว)
// ========================================
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // สีพื้นหลังของหน้า
      body: SafeArea( // ป้องกันการทับบนส่วน status bar
        child: SingleChildScrollView( // ทำให้หน้าสามารถเลื่อนได้
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ส่วนหัวของหน้า (Header) - สีฟ้า
              _buildHeader(context),

              // ส่วนเนื้อหาข้อมูลส่วนตัว
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // หัวข้อ "ข้อมูลส่วนตัว"
                    const Text(
                        "ข้อมูลส่วนตัว",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                    ),
                    const SizedBox(height: 16),

                    // การ์ดแสดงเบอร์โทรศัพท์
                    _buildInfoCard(Icons.phone, Colors.green, "เบอร์โทรศัพท์", "0934870274"),
                    const SizedBox(height: 12),

                    // การ์ดแสดงวันเกิด
                    _buildInfoCard(Icons.cake, Colors.pink, "วันเกิด", "12 พฤษภาคม 2548"),
                    const SizedBox(height: 12),

                    // การ์ดแสดงที่อยู่
                    _buildInfoCard(Icons.location_on, Colors.orange, "ที่อยู่", "ชลบุรี"),
                    const SizedBox(height: 12),

                    // การ์ดแสดงการศึกษา
                    _buildInfoCard(Icons.school, Colors.purple, "การศึกษา", "วิทยาลัยเทคโนโลยีภาคตะวันออก (อี.เทค)"),
                    const SizedBox(height: 24),

                    // ปุ่มสำหรับไปยังหน้าที่ 2
                    SizedBox(
                      width: double.infinity, // ให้ปุ่มกว้างเต็มที่
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/second'), // นำทางไปหน้าที่ 2
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

  // ฟังก์ชันสร้างส่วนหัว (Header) - มีรูปโปรไฟล์และชื่อ
  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.blue), // พื้นหลังสีฟ้า
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          // หัวข้อ "ข้อมูลส่วนตัว"
          const Text(
              "ข้อมูลส่วนตัว",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white)
          ),
          const SizedBox(height: 15),

          // รูปโปรไฟล์ - กดได้เพื่อซูมดูรูป
          GestureDetector(
            onTap: () {
              // เมื่อกดรูปจะเปิด Dialog แสดงรูปใหญ่
              _showImageDialog(context, "http://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721610169235.jpg");
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.white, // กรอบสีขาว
                  borderRadius: BorderRadius.circular(80) // ทำให้เป็นวงกลม
              ),
              child: ClipOval( // ตัดรูปให้เป็นวงกลม
                child: Image.network(
                  "http://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721610169235.jpg",
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                  // กรณีโหลดรูปไม่สำเร็จ จะแสดงไอคอน person แทน
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

          // ชื่อ
          const Text(
              "Siripong Thuantee",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 26)
          ),

          // อีเมล
          const Text(
              "siripong.thuantee@e-tech.ac.th",
              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 14)
          ),
        ],
      ),
    );
  }

  // ฟังก์ชันสร้างการ์ดข้อมูล (เบอร์โทร, วันเกิด, ที่อยู่, การศึกษา)
  Widget _buildInfoCard(IconData icon, Color color, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // เงาของการ์ด
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
          // ไอคอนด้านซ้าย
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: color.withOpacity(0.2), // สีพื้นหลังของไอคอน
                borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(icon, size: 28, color: color),
          ),
          const SizedBox(width: 12),

          // ข้อความด้านขวา
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // หัวข้อ (label) เช่น "เบอร์โทรศัพท์"
                Text(
                    label,
                    style: const TextStyle(fontSize: 12, color: Colors.grey)
                ),
                const SizedBox(height: 2),
                // ค่า (value) เช่น "0934870274"
                Text(
                    value,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis // ตัดข้อความที่ยาวเกิน
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ฟังก์ชันแสดง Dialog สำหรับซูมรูป (แบบ Instagram)
  static void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      barrierColor: Colors.black87, // พื้นหลังสีดำโปร่งแสง
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20), // ระยะห่างจากขอบจอ
          child: Stack(
            children: [
              // ส่วนแสดงรูป - กดที่รูปเพื่อปิด Dialog
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Center(
                  child: InteractiveViewer( // รองรับการ pinch to zoom
                    minScale: 0.5,
                    maxScale: 4.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12), // มุมโค้งมน
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
              // ปุ่มปิด (X) มุมบนขวา
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

// ========================================
// หน้าที่สอง - SecondPage (TikTok Profile Style)
// ========================================
class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // ตัวแปรเก็บสถานะการติดตาม
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // ขนาดความกว้างของหน้าจอ

    return Scaffold(
      backgroundColor: Colors.black, // พื้นหลังสีดำ (TikTok Style)
      // AppBar ด้านบน
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        // ปุ่มย้อนกลับ
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context)
        ),
        // ปุ่ม 3 จุด (เมนูเพิ่มเติม)
        actions: [
          IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {
                _showOptionsMenu(context); // เปิดเมนูตัวเลือก
              }
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ส่วนบนของโปรไฟล์
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // แถวแสดงรูปโปรไฟล์และสถิติ
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildProfileImage(context), // รูปโปรไฟล์
                    SizedBox(width: screenWidth * 0.05),
                    _buildStats(), // สถิติ (ติดตาม, ผู้ติดตาม, ถูกใจ)
                  ],
                ),
                const SizedBox(height: 12),

                // ชื่อผู้ใช้พร้อม verified badge
                Row(
                  children: [
                    const Text(
                        "Siripong_Thuantee",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.verified, color: Colors.blue[400], size: 16), // ติ๊กน้ำเงิน
                  ],
                ),
                const SizedBox(height: 4),

                // ข้อมูลเพลง/ดนตรี
                Row(
                  children: [
                    Icon(Icons.music_note, size: 12, color: Colors.grey[400]),
                    const SizedBox(width: 4),
                    Text("_is_bdg_x", style: TextStyle(fontSize: 12, color: Colors.grey[400])),
                  ],
                ),
                const SizedBox(height: 12),

                // แถวปุ่มติดตามและแชร์
                Row(
                  children: [
                    // ปุ่มติดตาม (กดได้)
                    Expanded(
                      flex: 5,
                      child: ElevatedButton(
                        onPressed: () {
                          // เปลี่ยนสถานะการติดตาม
                          setState(() {
                            isFollowing = !isFollowing;
                          });
                          // แสดง Snackbar แจ้งเตือน
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(isFollowing ? "กำลังติดตามแล้ว" : "เลิกติดตามแล้ว"),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          // เปลี่ยนสีตามสถานะ
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
                    // ปุ่มแชร์ (แค่ตกแต่ง กดไม่ได้)
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () {}, // ไม่มีการทำงาน
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

          // แถบ Tab (กริด, วิดีโอ, แท็ก)
          _buildTabs(),

          // กริดแสดงรูปภาพ
          _buildImageGrid(context),
        ],
      ),
    );
  }

  // ฟังก์ชันแสดงเมนูตัวเลือก (ตั้งค่า, บล็อก, รายงาน)
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
              // เมนูตั้งค่า
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text("ตั้งค่า", style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pop(context),
              ),
              // เมนูบล็อก
              ListTile(
                leading: const Icon(Icons.block, color: Colors.white),
                title: const Text("บล็อก", style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pop(context),
              ),
              // เมนูรายงาน
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

  // ฟังก์ชันสร้างรูปโปรไฟล์ - กดได้เพื่อซูม
  Widget _buildProfileImage(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // เปิด Dialog แสดงรูปใหญ่
        MyHomePage._showImageDialog(
            context,
            "http://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721610169235.jpg"
        );
      },
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.pink, width: 2) // กรอบสีชมพู
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

  // ฟังก์ชันสร้างส่วนสถิติ (ติดตาม, ผู้ติดตาม, ถูกใจ) พร้อมเส้นคั่น
  Widget _buildStats() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatColumn("232", "ติดตาม"),
          // เส้นคั่นแนวตั้ง
          Container(
            height: 30,
            width: 1,
            color: Colors.grey[700],
          ),
          _buildStatColumn("315", "ผู้ติดตาม"),
          // เส้นคั่นแนวตั้ง
          Container(
            height: 30,
            width: 1,
            color: Colors.grey[700],
          ),
          _buildStatColumn("965.5 K", "ถูกใจ"),
        ],
      ),
    );
  }

  // ฟังก์ชันสร้างคอลัมน์สถิติแต่ละตัว
  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        // ตัวเลข
        Text(
          count,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 4),
        // ข้อความอธิบาย
        Text(
          label,
          style: TextStyle(fontSize: 11, color: Colors.grey[400]),
        ),
      ],
    );
  }

  // ฟังก์ชันสร้างแถบ Tab (กริด, วิดีโอ, แท็ก)
  Widget _buildTabs() {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[800]!, width: 0.5))
      ),
      child: Row(
        children: [
          // Tab กริด (กำลังแสดงอยู่)
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.white, width: 1)) // ขีดเส้นใต้สีขาว
              ),
              child: const Icon(Icons.grid_on, size: 24, color: Colors.white),
            ),
          ),
          // Tab วิดีโอ
          Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Icon(Icons.video_collection_outlined, size: 24, color: Colors.grey[600])
              )
          ),
          // Tab แท็ก
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

  // ฟังก์ชันสร้างกริดรูปภาพ - กดได้เพื่อซูม
  Widget _buildImageGrid(BuildContext context) {
    // ลิสต์รูปภาพ
    final images = [
      "https://images.pexels.com/photos/1424687/pexels-photo-1424687.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "https://s.widget-club.com/images/YyiR86zpwIMIfrCZoSs4ulVD9RF3/ac8deb555a6c546571fccac6a4824f89/6604ec759db77ed7f2457e0463a17b8e.jpg?q=70&w=500",
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // ปิดการเลื่อนของ GridView
      crossAxisCount: 2, // 2 คอลัมน์
      mainAxisSpacing: 2, // ระยะห่างระหว่างแถว
      crossAxisSpacing: 2, // ระยะห่างระหว่างคอลัมน์
      padding: EdgeInsets.zero,
      children: images.map((url) => GestureDetector(
        onTap: () {
          // กดรูปเพื่อเปิด Dialog ซูมรูป
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