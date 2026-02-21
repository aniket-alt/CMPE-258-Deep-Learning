# Part C: BMI Calculator - Cross-Platform Mobile App with Flutter

## 📋 Overview

A cross-platform BMI (Body Mass Index) Calculator mobile application built using **Flutter** framework with the help of **Cursor** - an AI-powered code editor. The app runs on Android, iOS, and Web from a single codebase.

## 🎯 Features

| Feature | Description |
|---------|-------------|
| 📏 Height Input | Enter height in cm or feet/inches |
| ⚖️ Weight Input | Enter weight in kg or lbs |
| 🔄 Unit Toggle | Switch between Metric and Imperial |
| 🧮 BMI Calculation | Accurate BMI formula implementation |
| 🎨 Color-Coded Results | Visual health category indication |
| 🔄 Reset Function | Clear all inputs and results |
| ℹ️ Info Dialog | BMI explanation and categories |

## 📊 BMI Categories

| Category | BMI Range | Color |
|----------|-----------|-------|
| Underweight | < 18.5 | 🔵 Blue |
| Normal | 18.5 - 24.9 | 🟢 Green |
| Overweight | 25 - 29.9 | 🟠 Orange |
| Obese | > 30 | 🔴 Red |

## 🛠️ Built With

| Tool | Purpose |
|------|---------|
| **Cursor** | AI-powered code editor for development |
| **Flutter** | Cross-platform UI framework |
| **Dart** | Programming language |
| **Material Design 3** | UI components and styling |

## 📁 Project Structure
```
bmi_calculator_app/
├── lib/
│   └── main.dart          # Main application code
├── pubspec.yaml           # Dependencies
├── android/               # Android-specific files
├── ios/                   # iOS-specific files
└── web/                   # Web-specific files
```

## 📹 Video Walkthrough

🎥 **[Video]([YOUR_VIDEO_LINK](https://drive.google.com/file/d/1GEA9usRQy7XnxmF7M3FmKzsBmgeH5tOT/view?usp=sharing))**

The video demonstrates:
1. Opening Cursor AI editor
2. Creating Flutter project
3. Using AI to generate code
4. Running and testing the app
5. Demonstrating all features

## 🚀 How to Run

### Prerequisites
- Flutter SDK installed ([Installation Guide](https://docs.flutter.dev/get-started/install))
- Chrome browser (for web) or Android/iOS emulator

### Steps

1. Clone the repository:
```bash
   git clone https://github.com/aniket-alt/CMPE-258-Deep-Learning.git
```

2. Navigate to the project:
```bash
   cd "Assignment - 1/Part C/bmi_calculator_app"
```

3. Get dependencies:
```bash
   flutter pub get
```

4. Run the app:
```bash
   # For Web
   flutter run -d chrome
   
   # For Android
   flutter run -d android
   
   # For iOS
   flutter run -d ios
```

## 🤖 How It Was Built (Using Cursor)

### Step 1: Project Setup
- Created Flutter project using `flutter create bmi_calculator_app`
- Opened project in Cursor AI editor

### Step 2: AI-Assisted Development
- Used Cursor's Composer (Ctrl+I) to generate code
- Provided detailed prompt specifying features and UI requirements
- AI generated complete `main.dart` with all functionality

### Step 3: Prompt Used
```
Create a BMI Calculator app with:
- Height/weight inputs with unit toggle (Metric/Imperial)
- Calculate button with BMI result display
- Color-coded health categories
- Modern Material Design 3 UI with gradient background
- Input validation and reset functionality
```

### Step 4: Testing & Refinement
- Ran app using `flutter run -d chrome`
- Tested all features and made refinements via Cursor chat

## 📱 Supported Platforms

| Platform | Status |
|----------|--------|
| ✅ Web | Tested |
| ✅ Android | Supported |
| ✅ iOS | Supported |
| ✅ Windows | Supported |
| ✅ macOS | Supported |
| ✅ Linux | Supported |

## 📚 References

- [Cursor AI Editor](https://cursor.sh/)
- [Flutter Documentation](https://docs.flutter.dev/)
- [BMI Information - WHO](https://www.who.int/health-topics/obesity)

## 👤 Author

**Aniket Anil Naik**  
MS in Software Engineering  
San José State University  
CMPE 258 - Deep Learning (Spring 2025)

---

*Part of Assignment 2: Learn Latest AI Coding Tools*
