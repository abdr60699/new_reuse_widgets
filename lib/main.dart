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
                initials: 'JD',
                radius: 30,
                backgroundColor: Colors.blue,
                status: AvatarStatus.online,
              ),
              ReusableAvatar(
                initials: 'JS',
                radius: 30,
                backgroundColor: Colors.purple,
                status: AvatarStatus.away,
              ),
              ReusableAvatar(
                initials: 'BW',
                radius: 30,
                backgroundColor: Colors.orange,
                status: AvatarStatus.offline,
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
              ReusableDivider(thickness: 2, color: Colors.blue, isDashed: true),
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
                backgroundColor: Colors.red.shade50,
                iconColor: Colors.red,
              ),
              ReusableIconButton(
                icon: Icons.share,
                onPressed: () {},
                backgroundColor: Colors.blue.shade50,
                iconColor: Colors.blue,
              ),
              ReusableIconButton(
                icon: Icons.download,
                onPressed: () {},
                backgroundColor: Colors.green.shade50,
                iconColor: Colors.green,
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
            prefixIcon: Icon(Icons.email),
          ),
        ),
        _buildDemoSection(
          title: 'ReuabelDropdown',
          child: ReuabelDropdown<String>(
            labelText: 'Select Country',
            initialValue: selectedValue,
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
            readOnly: false,
            onChanged: (value) => setState(() => ratingValue = value),
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

class CardWidgetsDemo extends StatelessWidget {
  const CardWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'ReusableInfoCard',
          child: ReusableInfoCard(
            title: 'Information',
            description: 'This is an informational card',
            icon: Icons.info,
          ),
        ),
        _buildDemoSection(
          title: 'ReusableStatCard',
          child: Row(
            children: [
              Expanded(
                child: ReusableStatCard(
                  title: 'Users',
                  value: '1,234',
                  icon: Icons.people,
                  color: Colors.blue,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: ReusableStatCard(
                  title: 'Sales',
                  value: '\$45K',
                  icon: Icons.shopping_bag,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
        _buildDemoSection(
          title: 'ReusableProgressCard',
          child: ReusableProgressCard(
            title: 'Project Progress',
            progress: 0.65,
            subtitle: '65% Complete',
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
                color: Colors.orange,
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

class DialogWidgetsDemo extends StatelessWidget {
  const DialogWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'ReusableAlertDialog',
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => ReusableAlertDialog(
                  title: 'Alert',
                  content: 'This is an alert dialog',
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: Text('Show Alert Dialog'),
          ),
        ),
        _buildDemoSection(
          title: 'ReusableConfirmationDialog',
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => ReusableConfirmationDialog(
                  title: 'Confirm Action',
                  message: 'Are you sure you want to proceed?',
                  onConfirm: () {
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    Navigator.pop(context);
                  },
                ),
              );
            },
            child: Text('Show Confirmation Dialog'),
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
                color: Colors.indigo,
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

class EffectWidgetsDemo extends StatelessWidget {
  const EffectWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'GlassMorphism',
          child: SizedBox(
            height: 150,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.blue],
                    ),
                  ),
                ),
                Center(
                  child: GlassMorphism(
                    blur: 10,
                    opacity: 0.2,
                    borderRadius: 20,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Glass Effect',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _buildDemoSection(
          title: 'GradientContainer',
          child: GradientContainer(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.red],
            ),
            padding: EdgeInsets.all(20),
            child: Text(
              'Gradient Background',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        _buildDemoSection(
          title: 'NeuMorphism',
          child: Center(
            child: NeuMorphism(
              child: Container(
                width: 100,
                height: 100,
                child: Center(child: Text('Neumorphic')),
              ),
            ),
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
                color: Colors.pink,
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

class FeedbackWidgetsDemo extends StatelessWidget {
  const FeedbackWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'ReusableProgressIndicator',
          child: Column(
            children: [
              ReusableProgressIndicator(size: 50),
              SizedBox(height: 16),
              ReusableProgressIndicator(size: 50, color: Colors.green),
            ],
          ),
        ),
        _buildDemoSection(
          title: 'ReusableEmptyState',
          child: ReusableEmptyState(
            icon: Icons.inbox,
            message: 'No items found',
            description: 'Try adding some items',
          ),
        ),
        _buildDemoSection(
          title: 'ReusableErrorView',
          child: ReusableErrorView(
            message: 'Something went wrong',
            onRetry: () {},
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
                color: Colors.amber,
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

class LayoutWidgetsDemo extends StatelessWidget {
  const LayoutWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'ReusableStepperWidget',
          child: ReusableStepperWidget(
            currentStep: 1,
            steps: ['Step 1', 'Step 2', 'Step 3'],
          ),
        ),
        _buildDemoSection(
          title: 'ReusableExpansionPanel',
          child: ReusableExpansionPanel(
            title: 'Expandable Panel',
            children: [
              ListTile(title: Text('Item 1')),
              ListTile(title: Text('Item 2')),
              ListTile(title: Text('Item 3')),
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
                color: Colors.deepPurple,
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

class MediaWidgetsDemo extends StatelessWidget {
  const MediaWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'ReusableImage',
          child: ReusableImage(
            imageUrl: 'https://picsum.photos/300/200',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        _buildDemoSection(
          title: 'ReusableAudioPlayer',
          child: ReusableAudioPlayer(
            audioUrl: 'https://example.com/audio.mp3',
          ),
        ),
        _buildDemoSection(
          title: 'ReusableQRCode',
          child: Center(
            child: ReusableQRCode(
              data: 'https://flutter.dev',
              size: 200,
            ),
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
                color: Colors.deepOrange,
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

class NavigationWidgetsDemo extends StatelessWidget {
  const NavigationWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'ReusableAppBar',
          child: Container(
            height: 60,
            color: Colors.blue,
            child: ReusableAppBar(
              title: 'App Bar Demo',
              leading: Icon(Icons.menu, color: Colors.white),
              actions: [
                Icon(Icons.search, color: Colors.white),
                SizedBox(width: 16),
                Icon(Icons.more_vert, color: Colors.white),
              ],
            ),
          ),
        ),
        _buildDemoSection(
          title: 'ReusableBottomNavBar',
          child: ReusableBottomNavBar(
            currentIndex: 0,
            items: [
              BottomNavItem(icon: Icons.home, label: 'Home'),
              BottomNavItem(icon: Icons.search, label: 'Search'),
              BottomNavItem(icon: Icons.person, label: 'Profile'),
            ],
            onTap: (index) {},
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
                color: Colors.lightBlue,
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
