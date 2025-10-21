import 'package:flutter/material.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const Color primary = Color(0xFF5A54D2);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.48,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: _HeaderCurveClipper4(),
                    child: Container(
                      color: primary,
                      width: double.infinity,
                    ),
                  ),
                  // Logo + title
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                            child: const Icon(Icons.category, color: Colors.white, size: 40),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'HANDICRAFTS',
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Decorative floating panels (placeholders for illustration)
                  Positioned(
                    right: 24,
                    top: 90,
                    child: _MiniPanel(),
                  ),
                  Positioned(
                    right: 72,
                    top: 160,
                    child: _MiniPanel(active: true),
                  ),
                  Positioned(
                    right: 24,
                    top: 210,
                    child: _MiniPanel(),
                  ),
                  Positioned(
                    left: 24,
                    bottom: 8,
                    child: Row(
                      children: [
                        _PagerDot(active: true),
                        const SizedBox(width: 6),
                        _PagerDot(),
                        const SizedBox(width: 6),
                        _PagerDot(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Explore Beautiful\nCreations',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Explore handmade creations that\nmatch your interests.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.black54,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 20 + 8),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFFE8E8E8)),
                          ),
                          shadowColor: Colors.black12,
                          elevation: 4,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderCurveClipper4 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.78);
    final c1 = Offset(size.width * 0.45, size.height * 0.95);
    final p1 = Offset(size.width, size.height * 0.70);
    path.quadraticBezierTo(c1.dx, c1.dy, p1.dx, p1.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _MiniPanel extends StatelessWidget {
  final bool active;
  const _MiniPanel({this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      height: 66,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          )
        ],
        border: Border.all(color: active ? WelcomeScreen.primary : const Color(0xFFEDEDED)),
      ),
      padding: const EdgeInsets.all(10),
      child: Icon(
        active ? Icons.checkroom : Icons.shopping_bag_outlined,
        color: active ? WelcomeScreen.primary : Colors.black45,
      ),
    );
  }
}

class _PagerDot extends StatelessWidget {
  final bool active;
  const _PagerDot({this.active = false});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: active ? 8 : 6,
      height: active ? 8 : 6,
      decoration: BoxDecoration(
        color: active ? Colors.white : Colors.white70,
        shape: BoxShape.circle,
      ),
    );
  }
}
