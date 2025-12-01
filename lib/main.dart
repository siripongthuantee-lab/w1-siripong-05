import 'package:flutter/material.dart';

// ============================================
// ฟังก์ชันหลักในการรันแอปพลิเคชัน
// ============================================
void main() => runApp(const MyApp());

// ============================================
// คลาสหลักของแอปพลิเคชัน
// ใช้สำหรับกำหนดธีมและเส้นทางการนำทาง
// ============================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // กำหนดธีมสีของแอปพลิเคชัน
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // กำหนดหน้าเริ่มต้นและเส้นทางการนำทาง
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),        // หน้าแรก (หน้าข้อมูลส่วนตัว)
        '/second': (context) => const SecondPage()    // หน้าที่สอง (หน้าโปรไฟล์ธีมมืด)
      },
    );
  }
}

// ============================================
// หน้าแรก: หน้าข้อมูลส่วนตัว (Profile Page)
// แสดงข้อมูลส่วนตัวของผู้ใช้พร้อมรูปโปรไฟล์
// ============================================
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // สีพื้นหลังของหน้า
      body: SafeArea(
        child: SingleChildScrollView( // ทำให้เลื่อนหน้าจอได้
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ============================================
              // ส่วนที่ 1: ส่วนหัวสีน้ำเงิน
              // แสดงรูปโปรไฟล์, ชื่อ, และอีเมล
              // ============================================
              _buildHeader(),

              // ============================================
              // ส่วนที่ 2: ข้อมูลส่วนตัว
              // แสดงเบอร์โทร, วันเกิด, ที่อยู่, การศึกษา
              // ============================================
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

                    // กล่องข้อมูลเบอร์โทรศัพท์
                    _buildInfoCard(Icons.phone, Colors.green, "เบอร์โทรศัพท์", "0934870274"),
                    const SizedBox(height: 12),

                    // กล่องข้อมูลวันเกิด
                    _buildInfoCard(Icons.cake, Colors.pink, "วันเกิด", "12 พฤษภาคม 2548"),
                    const SizedBox(height: 12),

                    // กล่องข้อมูลที่อยู่
                    _buildInfoCard(Icons.location_on, Colors.orange, "ที่อยู่", "ชลบุรี"),
                    const SizedBox(height: 12),

                    // กล่องข้อมูลการศึกษา
                    _buildInfoCard(Icons.school, Colors.purple, "การศึกษา", "วิทยาลัยเทคโนโลยีภาคตะวันออก (อี.เทค)"),
                    const SizedBox(height: 24),

                    // ============================================
                    // ปุ่มสำหรับไปยังหน้าที่ 2
                    // เมื่อกดจะนำทางไปหน้า SecondPage
                    // ============================================
                    SizedBox(
                      width: double.infinity, // ทำให้ปุ่มกว้างเต็มหน้าจอ
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/second'), // นำทางไปหน้า 2
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

  // ============================================
  // ฟังก์ชันสร้างส่วนหัว (Header)
  // แสดงพื้นหลังสีน้ำเงิน, รูปโปรไฟล์, ชื่อ, และอีเมล
  // ============================================
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.blue), // พื้นหลังสีน้ำเงิน
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          // ข้อความหัวข้อ
          const Text(
              "ข้อมูลส่วนตัว",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white)
          ),
          const SizedBox(height: 15),

          // รูปโปรไฟล์แบบวงกลมพร้อมขอบสีขาว
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Colors.white, // ขอบสีขาว
                borderRadius: BorderRadius.circular(80)
            ),
            child: ClipOval(
              child: Image.network(
                "http://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721610169235.jpg",
                width: 150,
                height: 150,
                fit: BoxFit.cover,
                // แสดงไอคอนทดแทนถ้าโหลดรูปไม่สำเร็จ
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 150,
                  height: 150,
                  color: Colors.grey[300],
                  child: Icon(Icons.person, size: 80, color: Colors.grey[600]),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),

          // ชื่อผู้ใช้
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

  // ============================================
  // ฟังก์ชันสร้างกล่องข้อมูล (Info Card)
  // รับพารามิเตอร์: ไอคอน, สี, ป้ายชื่อ, และค่าข้อมูล
  // ใช้แสดงข้อมูลต่างๆ เช่น เบอร์โทร, วันเกิด, ที่อยู่, การศึกษา
  // ============================================
  Widget _buildInfoCard(IconData icon, Color color, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white, // พื้นหลังสีขาว
        borderRadius: BorderRadius.circular(12), // มุมโค้งมน
        // เงาด้านล่างกล่อง
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
          // ============================================
          // ไอคอนด้านซ้ายพร้อมพื้นหลังสีอ่อน
          // ============================================
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: color.withOpacity(0.2), // สีอ่อนของไอคอน
                borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(icon, size: 28, color: color),
          ),
          const SizedBox(width: 12),

          // ============================================
          // ข้อความด้านขวา: ป้ายชื่อและค่าข้อมูล
          // ============================================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ป้ายชื่อ (เช่น "เบอร์โทรศัพท์")
                Text(
                    label,
                    style: const TextStyle(fontSize: 12, color: Colors.grey)
                ),
                const SizedBox(height: 2),
                // ค่าข้อมูล (เช่น "0934870274")
                Text(
                    value,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis // ตัดข้อความยาวเกินด้วย ...
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================
// หน้าที่ 2: หน้าโปรไฟล์ธีมมืด (Dark Theme Profile)
// จำลองหน้าโปรไฟล์แบบ Social Media (เช่น Instagram/TikTok)
// ============================================
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // ขนาดความกว้างหน้าจอ

    return Scaffold(
      backgroundColor: Colors.black, // พื้นหลังสีดำ
      // ============================================
      // AppBar: แถบด้านบนพร้อมปุ่มย้อนกลับและเมนู
      // ============================================
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context) // กลับไปหน้าแรก
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {} // ปุ่มเมนู 3 จุด (ยังไม่มีฟังก์ชัน)
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ============================================
          // ส่วนที่ 1: ส่วนโปรไฟล์ด้านบน
          // แสดงรูปโปรไฟล์, สถิติ, ชื่อผู้ใช้, และปุ่มต่างๆ
          // ============================================
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ============================================
                // แถวที่ 1: รูปโปรไฟล์และสถิติ
                // ============================================
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildProfileImage(), // รูปโปรไฟล์วงกลม
                    SizedBox(width: screenWidth * 0.05), // ระยะห่าง
                    _buildStats(), // สถิติ (ติดตาม, ผู้ติดตาม, ถูกใจ)
                  ],
                ),
                const SizedBox(height: 12),

                // ============================================
                // แถวที่ 2: ชื่อผู้ใช้พร้อมเครื่องหมายยืนยัน
                // ============================================
                Row(
                  children: [
                    const Text(
                        "Siripong_Thuantee",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.verified, color: Colors.blue[400], size: 16), // เครื่องหมายติ๊กถูกสีน้ำเงิน
                  ],
                ),
                const SizedBox(height: 4),

                // ============================================
                // แถวที่ 3: TikTok ID หรือ Username รอง
                // ============================================
                Row(
                  children: [
                    Icon(Icons.music_note, size: 12, color: Colors.grey[400]), // ไอคอนโน้ตเพลง
                    const SizedBox(width: 4),
                    Text("_is_bdg_x", style: TextStyle(fontSize: 12, color: Colors.grey[400])),
                  ],
                ),
                const SizedBox(height: 12),

                // ============================================
                // แถวที่ 4: ปุ่มติดตามและปุ่มแชร์
                // ============================================
                Row(
                  children: [
                    // ปุ่มติดตาม (สีเหลือง)
                    Expanded(
                      flex: 5,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          foregroundColor: Colors.black,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        ),
                        child: const Text("ติดตาม", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                      ),
                    ),
                    const SizedBox(width: 6),
                    // ปุ่มแชร์ (ขอบเทา)
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () {},
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

          // ============================================
          // ส่วนที่ 2: แถบแท็บ (กริด, วิดีโอ, แท็กคน)
          // ============================================
          _buildTabs(),

          // ============================================
          // ส่วนที่ 3: กริดรูปภาพ 2 คอลัมน์
          // ============================================
          _buildImageGrid(),
        ],
      ),
    );
  }

  // ============================================
  // ฟังก์ชันสร้างรูปโปรไฟล์วงกลมพร้อมขอบสีชมพู
  // ============================================
  Widget _buildProfileImage() {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.pink, width: 2) // ขอบสีชมพู
      ),
      child: ClipOval(
        child: Image.network(
          "http://e-sis.e-tech.ac.th/etech/Moduls/studentPhotos/photo/2567/6721610169235.jpg",
          width: 75,
          height: 75,
          fit: BoxFit.cover,
          // แสดงไอคอนทดแทนถ้าโหลดรูปไม่สำเร็จ
          errorBuilder: (context, error, stackTrace) => Container(
            width: 75,
            height: 75,
            color: Colors.grey[800],
            child: const Icon(Icons.person, size: 40, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  // ============================================
  // ฟังก์ชันสร้างส่วนสถิติ (ติดตาม, ผู้ติดตาม, ถูกใจ)
  // แสดงตัวเลขและป้ายกำกับในแนวนอน
  // ============================================
  Widget _buildStats() {
    return Expanded(
      child: Column(
        children: [
          // แถวตัวเลขสถิติ
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("232", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)),
              Text("316", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)),
              Text("965.5 K", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
          const SizedBox(height: 4),
          // แถวป้ายกำกับ
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("ติดตาม", style: TextStyle(fontSize: 11, color: Colors.grey[400])),
              Text("ผู้ติดตาม", style: TextStyle(fontSize: 11, color: Colors.grey[400])),
              Text("ถูกใจ", style: TextStyle(fontSize: 11, color: Colors.grey[400])),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================
  // ฟังก์ชันสร้างแถบแท็บ 3 ช่อง (กริด, วิดีโอ, แท็กคน)
  // แท็บแรกถูกเลือกอยู่ (มีขีดเส้นใต้สีขาว)
  // ============================================
  Widget _buildTabs() {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[800]!, width: 0.5))
      ),
      child: Row(
        children: [
          // แท็บกริด (ถูกเลือก)
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.white, width: 1)) // เส้นใต้สีขาว
              ),
              child: const Icon(Icons.grid_on, size: 24, color: Colors.white),
            ),
          ),
          // แท็บวิดีโอ
          Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Icon(Icons.video_collection_outlined, size: 24, color: Colors.grey[600])
              )
          ),
          // แท็บแท็กคน
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

  // ============================================
  // ฟังก์ชันสร้างกริดรูปภาพ 2 คอลัมน์
  // แสดงรูปภาพจาก URL ในรูปแบบตาราง
  // ============================================
  Widget _buildImageGrid() {
    // รายการ URL ของรูปภาพ
    final images = [
      "https://images.pexels.com/photos/1424687/pexels-photo-1424687.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "https://s.widget-club.com/images/YyiR86zpwIMIfrCZoSs4ulVD9RF3/ac8deb555a6c546571fccac6a4824f89/6604ec759db77ed7f2457e0463a17b8e.jpg?q=70&w=500",
    ];

    return GridView.count(
      shrinkWrap: true, // ให้ GridView ปรับขนาดตามเนื้อหา
      physics: const NeverScrollableScrollPhysics(), // ปิดการเลื่อนของ GridView (ใช้ ListView ข้างนอกแทน)
      crossAxisCount: 2, // 2 คอลัมน์
      mainAxisSpacing: 2, // ระยะห่างระหว่างแถว
      crossAxisSpacing: 2, // ระยะห่างระหว่างคอลัมน์
      padding: EdgeInsets.zero,
      children: images.map((url) => Image.network(
        url,
        fit: BoxFit.cover, // ให้รูปเต็มพื้นที่
        // แสดงไอคอนทดแทนถ้าโหลดรูปไม่สำเร็จ
        errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey[800],
            child: const Icon(Icons.image, color: Colors.grey)
        ),
      )).toList(),
    );
  }
}