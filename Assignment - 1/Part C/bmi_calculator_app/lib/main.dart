import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
          primary: Colors.deepPurple,
          secondary: Colors.indigo,
        ),
        useMaterial3: true,
        cardTheme: CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white.withOpacity(0.12),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withOpacity(0.08),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.redAccent),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
      home: const BMICalculatorPage(),
    );
  }
}

class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({super.key});

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _feetController = TextEditingController();
  final _inchesController = TextEditingController();
  final _lbsController = TextEditingController();

  bool _isMetric = true;
  double? _bmiResult;
  String? _category;
  Color? _categoryColor;
  bool _showResult = false;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _feetController.dispose();
    _inchesController.dispose();
    _lbsController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _toggleUnit() {
    setState(() {
      _isMetric = !_isMetric;
      _showResult = false;
      _bmiResult = null;
      _category = null;
    });
  }

  void _calculateBMI() {
    if (!_formKey.currentState!.validate()) return;

    double heightM;
    double weightKg;

    if (_isMetric) {
      heightM = double.parse(_heightController.text) / 100;
      weightKg = double.parse(_weightController.text);
    } else {
      final feet = int.parse(_feetController.text);
      final inches = int.parse(_inchesController.text);
      final totalInches = feet * 12 + inches;
      heightM = (totalInches * 2.54) / 100;
      weightKg = double.parse(_lbsController.text) / 2.205;
    }

    final bmi = weightKg / (heightM * heightM);
    String category;
    Color color;

    if (bmi < 18.5) {
      category = 'Underweight';
      color = Colors.blue;
    } else if (bmi < 25) {
      category = 'Normal';
      color = Colors.green;
    } else if (bmi < 30) {
      category = 'Overweight';
      color = Colors.orange;
    } else {
      category = 'Obese';
      color = Colors.red;
    }

    setState(() {
      _bmiResult = bmi;
      _category = category;
      _categoryColor = color;
      _showResult = true;
      _animationController.forward(from: 0.0);
    });
  }

  void _reset() {
    setState(() {
      _heightController.clear();
      _weightController.clear();
      _feetController.clear();
      _inchesController.clear();
      _lbsController.clear();
      _bmiResult = null;
      _category = null;
      _showResult = false;
      _animationController.reset();
    });
  }

  void _showFormulaDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.info_outline, color: Colors.deepPurpleAccent),
            SizedBox(width: 8),
            Text('BMI Formula'),
          ],
        ),
        content: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Metric (kg & cm):',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 4),
              Text('BMI = weight (kg) ÷ height² (m²)'),
              Text('Height in meters = height in cm ÷ 100'),
              SizedBox(height: 16),
              Text(
                'Imperial (lbs & feet/inches):',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 4),
              Text('1. Convert height to inches: (feet × 12) + inches'),
              Text('2. Convert to meters: inches × 0.0254'),
              Text('3. Convert weight: lbs ÷ 2.205 = kg'),
              Text('4. Then use: BMI = weight (kg) ÷ height² (m²)'),
              SizedBox(height: 16),
              Text(
                'Categories:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 4),
              Text('• Underweight: BMI < 18.5', style: TextStyle(color: Colors.blue)),
              Text('• Normal: 18.5 – 24.9', style: TextStyle(color: Colors.green)),
              Text('• Overweight: 25 – 29.9', style: TextStyle(color: Colors.orange)),
              Text('• Obese: BMI ≥ 30', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }

  String? _validatePositive(String? value, [String fieldName = 'This field']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    final num? parsed = num.tryParse(value.trim());
    if (parsed == null) return 'Enter a valid number';
    if (parsed <= 0) return 'Must be greater than 0';
    return null;
  }

  String? _validateFeet(String? value) {
    final err = _validatePositive(value, 'Feet');
    if (err != null) return err;
    final v = int.tryParse(value!.trim());
    if (v == null || v < 0 || v > 8) return 'Enter 0–8';
    return null;
  }

  String? _validateInches(String? value) {
    final err = _validatePositive(value, 'Inches');
    if (err != null) return err;
    final v = int.tryParse(value!.trim());
    if (v == null || v < 0 || v > 11) return 'Enter 0–11';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4A148C),
              Color(0xFF311B92),
              Color(0xFF1A237E),
              Color(0xFF0D47A1),
            ],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  'BMI Calculator',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.info_outline),
                    onPressed: _showFormulaDialog,
                    tooltip: 'BMI Formula',
                  ),
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Unit',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Metric',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: _isMetric
                                                  ? Colors.white
                                                  : Colors.white54,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Switch(
                                            value: _isMetric,
                                            onChanged: (_) => _toggleUnit(),
                                            activeColor: Colors.deepPurpleAccent,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Imperial',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: _isMetric
                                                  ? Colors.white54
                                                  : Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: _isMetric ? _buildMetricInputs() : _buildImperialInputs(),
                            ),
                          ),
                          const SizedBox(height: 24),
                          FilledButton.icon(
                            onPressed: _calculateBMI,
                            icon: const Icon(Icons.calculate, size: 24),
                            label: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                'Calculate BMI',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          OutlinedButton.icon(
                            onPressed: _reset,
                            icon: const Icon(Icons.refresh, size: 20),
                            label: const Text('Clear / Reset'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white70,
                              side: BorderSide(color: Colors.white.withOpacity(0.4)),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          if (_showResult && _bmiResult != null) ...[
                            const SizedBox(height: 28),
                            AnimatedBuilder(
                              animation: _animationController,
                              builder: (context, child) {
                                return Opacity(
                                  opacity: _fadeAnimation.value,
                                  child: Transform.scale(
                                    scale: _scaleAnimation.value,
                                    child: child,
                                  ),
                                );
                              },
                              child: Card(
                                color: _categoryColor!.withOpacity(0.25),
                                child: Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Your BMI',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white.withOpacity(0.9),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        _bmiResult!.toStringAsFixed(1),
                                        style: const TextStyle(
                                          fontSize: 48,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: _categoryColor!.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          _category!,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricInputs() {
    return Column(
      children: [
        TextFormField(
          controller: _heightController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Height (cm)',
            prefixIcon: Icon(Icons.height),
            hintText: 'e.g. 170',
          ),
          validator: (v) => _validatePositive(v, 'Height'),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _weightController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Weight (kg)',
            prefixIcon: Icon(Icons.monitor_weight_outlined),
            hintText: 'e.g. 70',
          ),
          validator: (v) => _validatePositive(v, 'Weight'),
        ),
      ],
    );
  }

  Widget _buildImperialInputs() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _feetController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Feet',
                  prefixIcon: Icon(Icons.straighten),
                  hintText: '5',
                ),
                validator: _validateFeet,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                controller: _inchesController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Inches',
                  hintText: '10',
                ),
                validator: _validateInches,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _lbsController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Weight (lbs)',
            prefixIcon: Icon(Icons.monitor_weight_outlined),
            hintText: 'e.g. 154',
          ),
          validator: (v) => _validatePositive(v, 'Weight'),
        ),
      ],
    );
  }
}
