import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class OnboardingThirdScreen extends StatelessWidget {
  const OnboardingThirdScreen({super.key});

  static const Color primary = Color(0xFF5A54D2);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.40,
              width: double.infinity,
              child: ClipPath(
                clipper: _HeaderCurveClipper3(),
                child: Container(
                  color: primary,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.local_shipping, color: Colors.white),
                          SizedBox(width: 8),
                          Icon(Icons.public, color: Colors.white),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Handicrafts Shop',
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 6),
                      Container(
                        width: 160,
                        height: 2,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Find what inspires you',
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: 16/9,
                      child: Image.asset(
                        'images/pic2.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Unique Designs. Endless\nVariety. Pure Art',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 20 + 8),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const WelcomeScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Explore',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Page indicator dots now at the bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                _Dot(active: false, color: primary, dim: true),
                SizedBox(width: 8),
                _Dot(active: false, color: primary, dim: true),
                SizedBox(width: 8),
                _Dot(active: true, color: primary),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class _HeaderCurveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.85);
    final controlPoint = Offset(size.width * 0.45, size.height * 0.95);
    final endPoint = Offset(size.width, size.height * 0.70);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _Dot extends StatelessWidget {
  final bool active;
  final Color color;
  final bool dim;
  const _Dot({required this.active, required this.color, this.dim = false});

  @override
  Widget build(BuildContext context) {
    final base = dim ? color.withOpacity(0.4) : color;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: active ? 10 : 8,
      height: active ? 10 : 8,
      decoration: BoxDecoration(
        color: base,
        shape: BoxShape.circle,
      ),
    );
  }
}
