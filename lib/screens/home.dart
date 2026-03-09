import 'package:flutter/material.dart';
import 'package:unazin/services/student_controller.dart';
import 'package:unazin/components/accessibility_button.dart';
import 'package:unazin/components/app_footer.dart';
import 'package:unazin/components/change_course_button.dart';
import 'package:unazin/components/dashboard_stats_row.dart';
import 'package:unazin/components/exam_calendar_card.dart';
import 'package:unazin/components/finance_card.dart';
import 'package:unazin/components/last_grades_card.dart';
import 'package:unazin/components/notice_board_card.dart';
import 'package:unazin/components/section_header.dart';
import 'package:unazin/components/student_detail_card.dart';
import 'package:unazin/components/student_info_card.dart';
import 'package:unazin/components/today_classes_card.dart';
import 'package:unazin/components/welcome_banner.dart';
import '../components/unaerp_app_bar.dart';
import '../components/unaerp_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isDetailExpanded = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _studentName = 'Gabriel';
  String _studentCourse = 'Engenharia de Software';
  String _studentEmail = 'gabriel.lasilva@sou.unaerp.edu.br';
  String _studentYearSemester = '2024/2';
  final StudentController _studentController = StudentController();

  @override
  void initState() {
    super.initState();
    _loadStudentData();
  }

  Future<void> _loadStudentData() async {
    final data = await _studentController.loadStudentData();
    if (mounted) {
      setState(() {
        _studentName = data['name']!;
        _studentCourse = data['course']!;
        _studentEmail = data['email']!;
        _studentYearSemester = data['yearSemester']!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE0E0E0),
      child: Stack(
        children: [
          // Camada 1: Background
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: IgnorePointer(
              child: Opacity(
                opacity: 0.55,
                child: Image.asset(
                  'lib/assets/background.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),

          // Camada 2: Scaffold
          Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.transparent,
            appBar: UnaerpAppBar(scaffoldKey: _scaffoldKey),
            endDrawer: const UnaerpDrawer(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        WelcomeBanner(
                          studentName: _studentName,
                          isExpanded: _isDetailExpanded,
                          onTap: () => setState(
                            () => _isDetailExpanded = !_isDetailExpanded,
                          ),
                        ),
                        if (_isDetailExpanded) ...[
                          const SizedBox(height: 6),
                          StudentDetailCard(onSaved: () async => await _loadStudentData()),
                          const SizedBox(height: 10),
                        ] else ...[
                          const SizedBox(height: 8),
                        ],
                        StudentInfoCard(
                          course: _studentCourse,
                          email: _studentEmail,
                          yearSemester: _studentYearSemester,
                        ),
                        const SizedBox(height: 14),
                        const ChangeCourseButton(),
                        const SizedBox(height: 14),
                        const DashboardStatsRow(),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ),
                  const SectionHeader(title: 'Apresentação'),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        NoticeBoardCard(),
                        SizedBox(height: 16),
                        TodayClassesCard(),
                        SizedBox(height: 16),
                        LastGradesCard(),
                        SizedBox(height: 16),
                        FinanceCard(),
                        SizedBox(height: 16),
                        ExamCalendarCard(),
                        // Removido o SizedBox grande daqui para o footer assumir o papel
                      ],
                    ),
                  ),

                  // --- O FOOTER ENTRA AQUI ---
                  const UnaerpFooter(),
                ],
              ),
            ),
          ),

          // Camada 3: Acessibilidade
          Positioned(right: 0, top: 180, child: const AccessibilityButton()),
        ],
      ),
    );
  }
}
