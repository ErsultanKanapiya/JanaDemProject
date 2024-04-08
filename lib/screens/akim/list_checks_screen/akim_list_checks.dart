import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janadem/constants/assets.dart';

final akimTabBarIndexControllerProvider = StateProvider.autoDispose<int>((ref) => 0);

class AkimListChecks extends ConsumerStatefulWidget {
  const AkimListChecks({super.key});

  @override
  ConsumerState<AkimListChecks> createState() => _AkimListChecksState();
}

class _AkimListChecksState extends ConsumerState<AkimListChecks> with SingleTickerProviderStateMixin {

  TextEditingController searchController = TextEditingController();

  late TabController _tabController;

  @override
  void didChangeDependencies() {
    _tabController = TabController(initialIndex: ref.read(akimTabBarIndexControllerProvider), length: 3, vsync: this);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Problem location',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 19,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.text,
                controller: searchController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFFE3E5E5))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFFE3E5E5))
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: SvgPicture.asset('${Assets().icn}search.svg', height: 20, width: 20, fit: BoxFit.scaleDown),
                    hintText: 'Search here',
                    hintStyle: GoogleFonts.inter(
                        color: const Color(0xff64748B),
                        fontWeight: FontWeight.w400,
                        fontSize: 16
                    )

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TabBar(
                isScrollable: true,
                splashFactory: NoSplash.splashFactory,
                controller: _tabController,
                labelColor: Colors.black,
                tabAlignment: TabAlignment.start,
                unselectedLabelColor: const Color(0xff64748B),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 5,
                      color: Color(0xff056C5F),
                    )
                ),
                tabs: [
                  Tab(
                    child: Text(
                      'All',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Progress',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Success',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: [

                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
}