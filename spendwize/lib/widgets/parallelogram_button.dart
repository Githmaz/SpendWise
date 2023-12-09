import 'package:flutter/material.dart';

class ParallelogramButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final String shape;
  final double width;
  final Color buttonColor;
  final double fontSize;

  const ParallelogramButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.shape,
    required this.width,
    required this.buttonColor,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ClipPath(
        clipper:
            ParallelogramClipper(shape: shape, width: width),
        child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ParallelogramClipper extends CustomClipper<Path> {
  final String shape;
  final double width;

  ParallelogramClipper(
      {required this.shape, required this.width});

  @override
  Path getClip(Size size) {
    Map<String, List<double>> shapes = {
      'left-parallelogram': [0, width * 0.9, width, width * 0.1],
      'right-parallelogram': [width * 0.1, width, width * 0.9, 0],
      'left-trapezoid': [0, width * 0.9, width, 0],
      'bottom-right-trapezoid': [width * 0.1, width, width, 0],
      'top-right-trapezoid': [0 , width, width, width*0.1],
      'Square': [0, width, width, 0]
    };

    final path = Path()
      ..moveTo(shapes[shape]![0], 0)
      ..lineTo(shapes[shape]![1], 0)
      ..lineTo(shapes[shape]![2], size.height)
      ..lineTo(shapes[shape]![3], size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
