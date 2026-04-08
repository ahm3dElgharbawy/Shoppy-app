# 🛍️ Shoppy

A modern Flutter application for browsing products, managing a shopping cart, and searching items with a clean UI and smooth user experience.

---

## ✨ Features

* 🛒 **Products Listing**

  * Browse a wide range of products
  * View product details with images and ratings
  * Pagination support for efficient data loading

* 🔍 **Search**

  * Real-time product search
  * Recent searches history for quick access and reuse

* 🧺 **Cart Management**

  * Add/remove products easily
  * Persistent cart using local storage

* 🌗 **Light & Dark Theme**

  * Toggle between light and dark modes
  * Theme preference is saved locally

---

## 🌐 API

* Uses products data from **DummyJSON API**
* Endpoint example:

```id="a7l9dp"
https://dummyjson.com/products
```

* Supports pagination using:

```id="6c1v9k"
limit & skip parameters
```

---

## 🧱 Tech Stack

* **Flutter** (UI)
* **Dart**
* **Cubit (Bloc)** for state management
* **Hive** for local database
* **SharedPreferences** for caching theme
* **GetIt** for dependency injection
* **Dio** for api calls

---

## 📱 Screens

* Home (Products)
* Product Details
* Search
* Cart

---

## ⚙️ Architecture

The app follows a clean and scalable structure:

```id="z2w8yn"
lib/
│
├── core/
│   ├── common/
│   ├── constants/
│   ├── di/
│   ├── extensions/
│   ├── helpers/
│   ├── network/
│   └── theme/
│
├── features/
│   ├── products/
│   ├── cart/
│   └── search/
│
└── main.dart
```

---

## 🚀 Getting Started

### 1. Clone the repo

```id="r8c3lm"
git clone https://github.com/ahm3dElgharbawy/Shoppy-app.git
```

### 2. Install dependencies

```id="y6b2pk"
flutter pub get
```

### 3. Run the app

```id="n4t9qs"
flutter run
```

---

## 📦 Key Packages

* `flutter_bloc`
* `dio`
* `hive_flutter`
* `get_it`
* `cached_network_image`
* `shared_preferences`

---

## 💡 Highlights

* Clean UI with reusable components
* Optimized performance using `ValueListenableBuilder`
* Efficient pagination for smooth scrolling experience
* Smooth animations and transitions
* Scalable architecture for future features

