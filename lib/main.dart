import 'package:flutter/material.dart';
import 'sharedwidget/shared_widgets.dart';

void main() {
  runApp(const ReusableWidgetsApp());
}

class ReusableWidgetsApp extends StatelessWidget {
  const ReusableWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reusable Widgets Library',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WidgetCatalogScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WidgetCatalogScreen extends StatelessWidget {
  const WidgetCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      WidgetCategory(
        name: 'Basic',
        icon: Icons.widgets,
        color: Colors.blue,
        builder: (context) => const BasicWidgetsDemo(),
      ),
      WidgetCategory(
        name: 'Buttons',
        icon: Icons.touch_app,
        color: Colors.green,
        builder: (context) => const ButtonWidgetsDemo(),
      ),
      WidgetCategory(
        name: 'Forms',
        icon: Icons.edit_note,
        color: Colors.cyan,
        builder: (context) => const FormWidgetsDemo(),
      ),
      WidgetCategory(
        name: 'Cards',
        icon: Icons.credit_card,
        color: Colors.orange,
        builder: (context) => const CardWidgetsDemo(),
      ),
      WidgetCategory(
        name: 'Dialogs',
        icon: Icons.open_in_new,
        color: Colors.indigo,
        builder: (context) => const DialogWidgetsDemo(),
      ),
      WidgetCategory(
        name: 'Effects',
        icon: Icons.blur_on,
        color: Colors.pink,
        builder: (context) => const EffectWidgetsDemo(),
      ),
      WidgetCategory(
        name: 'Feedback',
        icon: Icons.feedback,
        color: Colors.amber,
        builder: (context) => const FeedbackWidgetsDemo(),
      ),
      WidgetCategory(
        name: 'Layout',
        icon: Icons.view_quilt,
        color: Colors.deepPurple,
        builder: (context) => const LayoutWidgetsDemo(),
      ),
      WidgetCategory(
        name: 'Media',
        icon: Icons.perm_media,
        color: Colors.deepOrange,
        builder: (context) => const MediaWidgetsDemo(),
      ),
      WidgetCategory(
        name: 'Navigation',
        icon: Icons.navigation,
        color: Colors.lightBlue,
        builder: (context) => const NavigationWidgetsDemo(),
      ),
    ];

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reusable Widgets Catalog'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: TabBar(
            isScrollable: true,
            tabs: categories
                .map((cat) => Tab(
                      icon: Icon(cat.icon),
                      text: cat.name,
                    ))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: categories.map((cat) => cat.builder(context)).toList(),
        ),
      ),
    );
  }
}

class WidgetCategory {
  final String name;
  final IconData icon;
  final Color color;
  final Widget Function(BuildContext) builder;

  WidgetCategory({
    required this.name,
    required this.icon,
    required this.color,
    required this.builder,
  });
}

// Demo sections for each category
class BasicWidgetsDemo extends StatelessWidget {
  const BasicWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'ReusableBadge',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ReusableBadge(
                count: 5,
                child: Icon(Icons.shopping_cart, size: 40),
              ),
              ReusableBadge(
                label: 'NEW',
                badgeColor: Colors.green,
                child: Icon(Icons.mail, size: 40),
              ),
              ReusableBadge(
                count: 99,
                child: Icon(Icons.notifications, size: 40),
              ),
            ],
          ),
        ),
        _buildDemoSection(
          title: 'ReusableAvatar',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ReusableAvatar(
                name: 'John Doe',
                size: 50,
                backgroundColor: Colors.blue,
              ),
              ReusableAvatar(
                name: 'Jane Smith',
                size: 50,
                backgroundColor: Colors.purple,
              ),
              ReusableAvatar(
                name: 'Bob Wilson',
                size: 50,
                backgroundColor: Colors.orange,
              ),
            ],
          ),
        ),
        _buildDemoSection(
          title: 'ReusableDivider',
          child: Column(
            children: [
              Text('Section 1'),
              ReusableDivider(thickness: 2, color: Colors.grey),
              SizedBox(height: 8),
              Text('Section 2'),
              ReusableDivider(thickness: 2, color: Colors.blue),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDemoSection({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class ButtonWidgetsDemo extends StatelessWidget {
  const ButtonWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'ReusableElevatedButton',
          child: Column(
            children: [
              ReusableElevatedButton(
                label: 'Primary Button',
                onPressed: () {},
              ),
              SizedBox(height: 8),
              ReusableElevatedButton(
                label: 'Disabled Button',
                enabled: false,
              ),
            ],
          ),
        ),
        _buildDemoSection(
          title: 'ReusableIconButton',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ReusableIconButton(
                icon: Icons.favorite,
                onPressed: () {},
              ),
              ReusableIconButton(
                icon: Icons.share,
                onPressed: () {},
              ),
              ReusableIconButton(
                icon: Icons.download,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDemoSection({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class FormWidgetsDemo extends StatefulWidget {
  const FormWidgetsDemo({super.key});

  @override
  State<FormWidgetsDemo> createState() => _FormWidgetsDemoState();
}

class _FormWidgetsDemoState extends State<FormWidgetsDemo> {
  String? selectedValue;
  double sliderValue = 50;
  double ratingValue = 3.0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'ReusableTextFormField',
          child: ReusableTextFormField(
            label: 'Email Address',
            hintText: 'Enter your email',
            prefixIcon: Icons.email,
          ),
        ),
        _buildDemoSection(
          title: 'ReusableDropdown',
          child: ReusableDropdown<String>(
            label: 'Select Country',
            value: selectedValue,
            items: ['USA', 'Canada', 'UK', 'Australia'],
            onChanged: (value) => setState(() => selectedValue = value),
          ),
        ),
        _buildDemoSection(
          title: 'ReusableSliderInput',
          child: ReusableSliderInput(
            label: 'Volume',
            value: sliderValue,
            min: 0,
            max: 100,
            onChanged: (value) => setState(() => sliderValue = value),
          ),
        ),
        _buildDemoSection(
          title: 'ReusableRating',
          child: ReusableRating(
            rating: ratingValue,
            onRatingChanged: (value) => setState(() => ratingValue = value),
          ),
        ),
      ],
    );
  }

  Widget _buildDemoSection({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
              ),
            ),
            SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

// Placeholder demo widgets for other categories
class CardWidgetsDemo extends StatelessWidget {
  const CardWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Card Widgets - Coming Soon'));
  }
}

class DialogWidgetsDemo extends StatelessWidget {
  const DialogWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Dialog Widgets - Coming Soon'));
  }
}

class EffectWidgetsDemo extends StatelessWidget {
  const EffectWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Effect Widgets - Coming Soon'));
  }
}

class FeedbackWidgetsDemo extends StatelessWidget {
  const FeedbackWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Feedback Widgets - Coming Soon'));
  }
}

class LayoutWidgetsDemo extends StatelessWidget {
  const LayoutWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Layout Widgets - Coming Soon'));
  }
}

class MediaWidgetsDemo extends StatelessWidget {
  const MediaWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Media Widgets - Coming Soon'));
  }
}

class NavigationWidgetsDemo extends StatelessWidget {
  const NavigationWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Navigation Widgets - Coming Soon'));
  }
}
