# Grocery App

A clean and modern grocery shopping mobile application built with Flutter. The app follows a strict feature-based architecture and clean code principles, designed to provide an intuitive shopping experience for users.

## Team Members

- **Dalia Ali**
- **Mohamed Magdy**
- **Hamed Ahmed**

## Project Description

Grocery App is a mobile application developed using Flutter that enables users to browse and shop for groceries seamlessly. The application emphasizes clean architecture, maintainability, and user experience. It implements modern design patterns and follows SOLID principles to ensure code quality and scalability.

## Features

The application includes the following core features:

- **Splash Screen** - Initial loading screen with first-time and login status check
- **Authentication** - User login and signup functionality
- **Home Screen** - Main dashboard displaying featured products and categories
- **Categories** - Browse products by different categories
- **Product List** - View all available products with filtering options
- **Product Details** - Detailed view of individual products with descriptions and pricing
- **Favorites** - Save and manage favorite products
- **Portfolio / Profile** - User profile management
- **Shopping Cart** - Add products to cart and manage quantities
- **Order Success Screen** - Confirmation screen after successful order placement

## Project Structure

The project follows a **feature-based architecture** that separates concerns and promotes code reusability:

```
lib/
├── core/
│   ├── constants/      # App-wide constants (colors, strings, etc.)
│   ├── routes.dart     # Navigation and routing configuration
│   └── ...             # Other core utilities and shared resources
│
├── features/
│   ├── splash/
│   │   ├── screens/    # Splash screen UI
│   │   └── widgets/    # Reusable widgets for splash feature
│   │
│   ├── auth/
│   │   ├── screens/    # Login and signup screens
│   │   └── widgets/    # Authentication-related widgets
│   │
│   ├── home/
│   │   ├── screens/    # Home screen UI
│   │   └── widgets/    # Home feature widgets
│   │
│   ├── categories/
│   │   ├── screens/    # Categories screen
│   │   └── widgets/    # Category-related widgets
│   │
│   ├── product_list/
│   │   ├── screens/    # Product listing screen
│   │   └── widgets/    # Product list widgets
│   │
│   ├── produce_details/
│   │   ├── screens/    # Product details screen
│   │   └── widgets/    # Product detail widgets
│   │
│   ├── favorites/
│   │   ├── screens/    # Favorites screen
│   │   └── widgets/    # Favorites widgets
│   │
│   ├── profile/
│   │   ├── screens/    # Profile/Portfolio screen
│   │   └── widgets/    # Profile widgets
│   │
│   ├── cart/
│   │   ├── screens/    # Shopping cart screen
│   │   └── widgets/    # Cart widgets
│   │
│   ├── order_success/
│   │   ├── screens/    # Order success screen
│   │   └── widgets/    # Order success widgets
│   │
│   └── main_layout/
│       ├── screens/    # Main layout with navigation
│       └── widgets/    # Layout widgets
│
└── main.dart           # Application entry point
```

### Architecture Highlights

- **Core Module**: Contains shared resources, constants, utilities, and routing logic used across all features
- **Features Module**: Each feature is self-contained with its own screens and widgets, promoting modularity and maintainability
- **Separation of Concerns**: UI components are organized logically, making the codebase easy to navigate and extend

## Technologies Used

The application is built using the following technologies and packages:

- **Flutter** - Cross-platform mobile application framework
- **Dart** - Programming language for Flutter development
- **flutter_screenutil** - Responsive UI design and screen adaptation
- **shared_preferences** - Local data persistence for user preferences
- **google_fonts** - Custom typography and font integration

## Architecture & Code Quality

The project adheres to industry best practices and software engineering principles:

- **Feature-based Architecture** - Modular structure where each feature is independent and self-contained
- **Clean Code** - Readable, maintainable, and well-documented code following naming conventions
- **SOLID Principles** - Design principles ensuring scalability and flexibility
- **Beginner-friendly** - Clear structure and organization making it easy to understand and maintain
- **Scalable Design** - Architecture supports easy addition of new features without affecting existing code

## How to Run the Project

Follow these steps to run the application on your local machine:

1. **Install Dependencies**
   ```bash
   flutter pub get
   ```

2. **Run the Application**
   ```bash
   flutter run
   ```

Make sure you have Flutter SDK installed and configured properly. You can verify your Flutter installation by running:
```bash
flutter doctor
```

## Notes

- **No Backend**: This application does not use any backend services. All data handling is performed locally on the device.
- **Local Data Storage**: User preferences and application state are managed using local storage mechanisms.
- **UI Design**: The user interface is implemented based on provided design specifications, ensuring consistency and visual appeal.
- **Academic Project**: This project was developed as part of a university graduation requirement, demonstrating practical application of software engineering principles and mobile development skills.

## License

This project is developed for academic purposes as part of a university graduation project.

---

**Developed by**: Dalia Ali, Mohamed Magdy, and Hamed Ahmed
