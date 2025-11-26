import 'dart:math';
import 'package:flutter/material.dart';

class DeltaApp extends StatefulWidget {
  const DeltaApp({super.key});

  @override
  State<DeltaApp> createState() => _DeltaAppState();
}

class _DeltaAppState extends State<DeltaApp> {
  double a = 0;
  double b = 0;
  double c = 0;
  String result = "";

  void updateA(String value) {
    setState(() => a = double.tryParse(value) ?? 0);
  }

  void updateB(String value) {
    setState(() => b = double.tryParse(value) ?? 0);
  }

  void updateC(String value) {
    setState(() => c = double.tryParse(value) ?? 0);
  }

  void calculate() {
    if (a == 0) {
      setState(() => result = "a cannot be 0.");
      return;
    }

    double delta = b * b - 4 * a * c;

    if (delta > 0) {
      double x1 = (-b + sqrt(delta)) / (2 * a);
      double x2 = (-b - sqrt(delta)) / (2 * a);
      setState(() =>
      result = "Δ = $delta > 0 → 2 real roots\nx₁ = $x1\nx₂ = $x2");
    } else if (delta == 0) {
      double x = -b / (2 * a);
      setState(() => result = "Δ = $delta → 1 real root\nx = $x");
    } else {
      setState(() => result = "Δ = $delta < 0 → No real roots.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delta Calculator"),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "A delta equation is a quadratic equation of the form:\nax² + bx + c = 0",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              const Text(
                "Enter first coefficient (a)",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 150,
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: updateA,
                  onSubmitted: (_) => calculate(),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Enter a",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Enter second coefficient (b)",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 150,
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: updateB,
                  onSubmitted: (_) => calculate(),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Enter b",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Enter third coefficient (c)",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 150,
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: updateC,
                  onSubmitted: (_) => calculate(),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Enter c",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculate,
                child: const Text("Calculate"),
              ),
              const SizedBox(height: 20),

              Text(
                result,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
