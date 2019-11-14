import 'package:flutter/material.dart';
import 'package:flutter_hw/gallery/demo/shrine_demo.dart';
import 'package:flutter_hw/gallery/icons.dart';

class GalleryDemoCategory {
  final String name;
  final IconData iconData;

  const GalleryDemoCategory._({@required this.name, @required this.iconData});

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) {
      return false;
    }
    if (runtimeType != other.runtimeType) {
      return false;
    }
    final GalleryDemoCategory typedOther = other;
    return typedOther.name == name && typedOther.iconData == iconData;
  }

  @override
  int get hashCode => hashValues(name, iconData);

  @override
  String toString() {
    return '$runtimeType($name)';
  }
}

const GalleryDemoCategory _kDemos = GalleryDemoCategory._(name: 'Studies', iconData: GalleryIcons.animation);

const GalleryDemoCategory _kStyle = GalleryDemoCategory._(name: 'Style', iconData: GalleryIcons.custom_typography);

const GalleryDemoCategory _kMaterialComponents =
    GalleryDemoCategory._(name: 'Material', iconData: GalleryIcons.category_mdc);

const GalleryDemoCategory _kCupertinoComponents =
    GalleryDemoCategory._(name: 'Cupertino', iconData: GalleryIcons.phone_iphone);

const GalleryDemoCategory _kMedia = GalleryDemoCategory._(name: 'Media', iconData: GalleryIcons.drive_video);

class GalleryDemo {
  final String title;
  final IconData iconData;
  final String subtitle;
  final GalleryDemoCategory category;
  final String routeName;
  final WidgetBuilder builder;
  final String documentationUrl;

  const GalleryDemo(
      {@required this.title,
      @required this.iconData,
      this.subtitle,
      @required this.category,
      this.routeName,
      // @required this.routeName,
      this.builder,
      // @required this.builder,
      this.documentationUrl})
      : assert(title != null),
        assert(category != null)
  // assert(routeName != null)
  // assert(builder != null)
  ;

  @override
  String toString() {
    return '$runtimeType($title - $routeName)';
  }
}

List<GalleryDemo> _buildGalleryDemos() {
  final List<GalleryDemo> galleryDemos = <GalleryDemo>[
    // Demos
    GalleryDemo(
      title: 'Shrine',
      subtitle: 'Basic shopping app',
      iconData: GalleryIcons.shrine,
      category: _kDemos,
      routeName: ShrineDemo.routeName,
      builder: (BuildContext context) => const ShrineDemo(),
    ),
    GalleryDemo(
      title: 'Fortnightly',
      subtitle: 'Newspaper typography app',
      iconData: GalleryIcons.custom_typography,
      category: _kDemos,
      // routeName: FortnightlyDemo.routeName,
      // builder: (BuildContext context) => FortnightlyDemo(),
    ),
    GalleryDemo(
      title: 'Contact profile',
      subtitle: 'Address book entry with a flexible appbar',
      iconData: GalleryIcons.account_box,
      category: _kDemos,
      // routeName: ContactsDemo.routeName,
      // builder: (BuildContext context) => ContactsDemo(),
    ),
    GalleryDemo(
      title: 'Animation',
      subtitle: 'Section organizer',
      iconData: GalleryIcons.animation,
      category: _kDemos,
      // routeName: AnimationDemo.routeName,
      // builder: (BuildContext context) => const AnimationDemo(),
    ),
    GalleryDemo(
      title: '2D Transformations',
      subtitle: 'Pan, Zoom, Rotate',
      iconData: GalleryIcons.grid_on,
      category: _kDemos,
      // routeName: TransformationsDemo.routeName,
      // builder: (BuildContext context) => const TransformationsDemo(),
    ),

    // Style
    GalleryDemo(
      title: 'Colors',
      subtitle: 'All of the predefined colors',
      iconData: GalleryIcons.colors,
      category: _kStyle,
      // routeName: ColorsDemo.routeName,
      // builder: (BuildContext context) => ColorsDemo(),
    ),
    GalleryDemo(
      title: 'Typography',
      subtitle: 'All of the predefined text styles',
      iconData: GalleryIcons.custom_typography,
      category: _kStyle,
      // routeName: TypographyDemo.routeName,
      // builder: (BuildContext context) => TypographyDemo(),
    ),

    // Material Components
    GalleryDemo(
      title: 'Backdrop',
      subtitle: 'Select a front layer from back layer',
      iconData: GalleryIcons.backdrop,
      category: _kMaterialComponents,
      // routeName: BackdropDemo.routeName,
      // builder: (BuildContext context) => BackdropDemo(),
    ),
    GalleryDemo(
      title: 'Banner',
      subtitle: 'Displaying a banner within a list',
      iconData: GalleryIcons.lists_leave_behind,
      category: _kMaterialComponents,
      // routeName: BannerDemo.routeName,
      documentationUrl: 'https://api.flutter.dev/flutter/material/MaterialBanner-class.html',
      // builder: (BuildContext context) => const BannerDemo(),
    ),
    GalleryDemo(
      title: 'Bottom app bar',
      subtitle: 'Optional floating action button notch',
      iconData: GalleryIcons.bottom_app_bar,
      category: _kMaterialComponents,
      // routeName: BottomAppBarDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/BottomAppBar-class.html',
      // builder: (BuildContext context) => BottomAppBarDemo(),
    ),
    GalleryDemo(
      title: 'Bottom navigation',
      subtitle: 'Bottom navigation with cross-fading views',
      iconData: GalleryIcons.bottom_navigation,
      category: _kMaterialComponents,
      // routeName: BottomNavigationDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/BottomNavigationBar-class.html',
      // builder: (BuildContext context) => BottomNavigationDemo(),
    ),
    GalleryDemo(
      title: 'Bottom sheet: Modal',
      subtitle: 'A dismissible bottom sheet',
      iconData: GalleryIcons.bottom_sheets,
      category: _kMaterialComponents,
      // routeName: ModalBottomSheetDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/showModalBottomSheet.html',
      // builder: (BuildContext context) => ModalBottomSheetDemo(),
    ),
    GalleryDemo(
      title: 'Bottom sheet: Persistent',
      subtitle: 'A bottom sheet that sticks around',
      iconData: GalleryIcons.bottom_sheet_persistent,
      category: _kMaterialComponents,
      // routeName: PersistentBottomSheetDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/ScaffoldState/showBottomSheet.html',
      // builder: (BuildContext context) => PersistentBottomSheetDemo(),
    ),
    GalleryDemo(
      title: 'Buttons',
      subtitle: 'Flat, raised, dropdown, and more',
      iconData: GalleryIcons.generic_buttons,
      category: _kMaterialComponents,
      // routeName: ButtonsDemo.routeName,
      // builder: (BuildContext context) => ButtonsDemo(),
    ),
    GalleryDemo(
      title: 'Buttons: Floating Action Button',
      subtitle: 'FAB with transitions',
      iconData: GalleryIcons.buttons,
      category: _kMaterialComponents,
      // routeName: TabsFabDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/FloatingActionButton-class.html',
      // builder: (BuildContext context) => TabsFabDemo(),
    ),
    GalleryDemo(
      title: 'Cards',
      subtitle: 'Baseline cards with rounded corners',
      iconData: GalleryIcons.cards,
      category: _kMaterialComponents,
      // routeName: CardsDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/Card-class.html',
      // builder: (BuildContext context) => CardsDemo(),
    ),
    GalleryDemo(
      title: 'Chips',
      subtitle: 'Labeled with delete buttons and avatars',
      iconData: GalleryIcons.chips,
      category: _kMaterialComponents,
      // routeName: ChipDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/Chip-class.html',
      // builder: (BuildContext context) => ChipDemo(),
    ),
    GalleryDemo(
      title: 'Data tables',
      subtitle: 'Rows and columns',
      iconData: GalleryIcons.data_table,
      category: _kMaterialComponents,
      // routeName: DataTableDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/PaginatedDataTable-class.html',
      // builder: (BuildContext context) => DataTableDemo(),
    ),
    GalleryDemo(
      title: 'Dialogs',
      subtitle: 'Simple, alert, and fullscreen',
      iconData: GalleryIcons.dialogs,
      category: _kMaterialComponents,
      // routeName: DialogDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/showDialog.html',
      // builder: (BuildContext context) => DialogDemo(),
    ),
    GalleryDemo(
      title: 'Elevations',
      subtitle: 'Shadow values on cards',
      // TODO(larche): Change to custom icon for elevations when one exists.
      iconData: GalleryIcons.cupertino_progress,
      category: _kMaterialComponents,
      // routeName: ElevationDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/Material/elevation.html',
      // builder: (BuildContext context) => ElevationDemo(),
    ),
    GalleryDemo(
      title: 'Expand/collapse list control',
      subtitle: 'A list with one sub-list level',
      iconData: GalleryIcons.expand_all,
      category: _kMaterialComponents,
      // routeName: ExpansionTileListDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/ExpansionTile-class.html',
      // builder: (BuildContext context) => ExpansionTileListDemo(),
    ),
    GalleryDemo(
      title: 'Expansion panels',
      subtitle: 'List of expanding panels',
      iconData: GalleryIcons.expand_all,
      category: _kMaterialComponents,
      // routeName: ExpansionPanelsDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/ExpansionPanel-class.html',
      // builder: (BuildContext context) => ExpansionPanelsDemo(),
    ),
    GalleryDemo(
      title: 'Grid',
      subtitle: 'Row and column layout',
      iconData: GalleryIcons.grid_on,
      category: _kMaterialComponents,
      // routeName: GridListDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/widgets/GridView-class.html',
      // builder: (BuildContext context) => const GridListDemo(),
    ),
    GalleryDemo(
      title: 'Icons',
      subtitle: 'Enabled and disabled icons with opacity',
      iconData: GalleryIcons.sentiment_very_satisfied,
      category: _kMaterialComponents,
      // routeName: IconsDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/IconButton-class.html',
      // builder: (BuildContext context) => IconsDemo(),
    ),
    GalleryDemo(
      title: 'Lists',
      subtitle: 'Scrolling list layouts',
      iconData: GalleryIcons.list_alt,
      category: _kMaterialComponents,
      // routeName: ListDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/ListTile-class.html',
      // builder: (BuildContext context) => const ListDemo(),
    ),
    GalleryDemo(
      title: 'Lists: leave-behind list items',
      subtitle: 'List items with hidden actions',
      iconData: GalleryIcons.lists_leave_behind,
      category: _kMaterialComponents,
      // routeName: LeaveBehindDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/widgets/Dismissible-class.html',
      // builder: (BuildContext context) => const LeaveBehindDemo(),
    ),
    GalleryDemo(
      title: 'Lists: reorderable',
      subtitle: 'Reorderable lists',
      iconData: GalleryIcons.list_alt,
      category: _kMaterialComponents,
      // routeName: ReorderableListDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/ReorderableListView-class.html',
      // builder: (BuildContext context) => const ReorderableListDemo(),
    ),
    GalleryDemo(
      title: 'Menus',
      subtitle: 'Menu buttons and simple menus',
      iconData: GalleryIcons.more_vert,
      category: _kMaterialComponents,
      // routeName: MenuDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/PopupMenuButton-class.html',
      // builder: (BuildContext context) => const MenuDemo(),
    ),
    GalleryDemo(
      title: 'Navigation drawer',
      subtitle: 'Navigation drawer with standard header',
      iconData: GalleryIcons.menu,
      category: _kMaterialComponents,
      // routeName: DrawerDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/Drawer-class.html',
      // builder: (BuildContext context) => DrawerDemo(),
    ),
    GalleryDemo(
      title: 'Pagination',
      subtitle: 'PageView with indicator',
      iconData: GalleryIcons.page_control,
      category: _kMaterialComponents,
      // routeName: PageSelectorDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/TabBarView-class.html',
      // builder: (BuildContext context) => PageSelectorDemo(),
    ),
    GalleryDemo(
      title: 'Pickers',
      subtitle: 'Date and time selection widgets',
      iconData: GalleryIcons.event,
      category: _kMaterialComponents,
      // routeName: DateAndTimePickerDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/showDatePicker.html',
      // builder: (BuildContext context) => DateAndTimePickerDemo(),
    ),
    GalleryDemo(
      title: 'Progress indicators',
      subtitle: 'Linear, circular, indeterminate',
      iconData: GalleryIcons.progress_activity,
      category: _kMaterialComponents,
      // routeName: ProgressIndicatorDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/LinearProgressIndicator-class.html',
      // builder: (BuildContext context) => ProgressIndicatorDemo(),
    ),
    GalleryDemo(
      title: 'Pull to refresh',
      subtitle: 'Refresh indicators',
      iconData: GalleryIcons.refresh,
      category: _kMaterialComponents,
      // routeName: OverscrollDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/RefreshIndicator-class.html',
      // builder: (BuildContext context) => const OverscrollDemo(),
    ),
    GalleryDemo(
      title: 'Search',
      subtitle: 'Expandable search',
      iconData: Icons.search,
      category: _kMaterialComponents,
      // routeName: SearchDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/showSearch.html',
      // builder: (BuildContext context) => SearchDemo(),
    ),
    GalleryDemo(
      title: 'Selection controls',
      subtitle: 'Checkboxes, radio buttons, and switches',
      iconData: GalleryIcons.check_box,
      category: _kMaterialComponents,
      // routeName: SelectionControlsDemo.routeName,
      // builder: (BuildContext context) => SelectionControlsDemo(),
    ),
    GalleryDemo(
      title: 'Sliders',
      subtitle: 'Widgets for selecting a value by swiping',
      iconData: GalleryIcons.sliders,
      category: _kMaterialComponents,
      // routeName: SliderDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/Slider-class.html',
      // builder: (BuildContext context) => SliderDemo(),
    ),
    GalleryDemo(
      title: 'Snackbar',
      subtitle: 'Temporary messaging',
      iconData: GalleryIcons.snackbar,
      category: _kMaterialComponents,
      // routeName: SnackBarDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/ScaffoldState/showSnackBar.html',
      // builder: (BuildContext context) => const SnackBarDemo(),
    ),
    GalleryDemo(
      title: 'Tabs',
      subtitle: 'Tabs with independently scrollable views',
      iconData: GalleryIcons.tabs,
      category: _kMaterialComponents,
      // routeName: TabsDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/TabBarView-class.html',
      // builder: (BuildContext context) => TabsDemo(),
    ),
    GalleryDemo(
      title: 'Tabs: Scrolling',
      subtitle: 'Tab bar that scrolls',
      category: _kMaterialComponents,
      iconData: GalleryIcons.tabs,
      // routeName: ScrollableTabsDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/TabBar-class.html',
      // builder: (BuildContext context) => ScrollableTabsDemo(),
    ),
    GalleryDemo(
      title: 'Text fields',
      subtitle: 'Single line of editable text and numbers',
      iconData: GalleryIcons.text_fields_alt,
      category: _kMaterialComponents,
      // routeName: TextFormFieldDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/TextFormField-class.html',
      // builder: (BuildContext context) => const TextFormFieldDemo(),
    ),
    GalleryDemo(
      title: 'Tooltips',
      subtitle: 'Short message displayed on long-press',
      iconData: GalleryIcons.tooltip,
      category: _kMaterialComponents,
      // routeName: TooltipDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/material/Tooltip-class.html',
      // builder: (BuildContext context) => TooltipDemo(),
    ),

    // Cupertino Components
    GalleryDemo(
      title: 'Activity Indicator',
      iconData: GalleryIcons.cupertino_progress,
      category: _kCupertinoComponents,
      // routeName: CupertinoProgressIndicatorDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoActivityIndicator-class.html',
      // builder: (BuildContext context) => CupertinoProgressIndicatorDemo(),
    ),
    GalleryDemo(
      title: 'Alerts',
      iconData: GalleryIcons.dialogs,
      category: _kCupertinoComponents,
      // routeName: CupertinoAlertDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/cupertino/showCupertinoDialog.html',
      // builder: (BuildContext context) => CupertinoAlertDemo(),
    ),
    GalleryDemo(
      title: 'Buttons',
      iconData: GalleryIcons.generic_buttons,
      category: _kCupertinoComponents,
      // routeName: CupertinoButtonsDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoButton-class.html',
      // builder: (BuildContext context) => CupertinoButtonsDemo(),
    ),
    GalleryDemo(
      title: 'Navigation',
      iconData: GalleryIcons.bottom_navigation,
      category: _kCupertinoComponents,
      // routeName: CupertinoNavigationDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoTabScaffold-class.html',
      // builder: (BuildContext context) => CupertinoNavigationDemo(),
    ),
    GalleryDemo(
      title: 'Pickers',
      iconData: GalleryIcons.event,
      category: _kCupertinoComponents,
      // routeName: CupertinoPickerDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoPicker-class.html',
      // builder: (BuildContext context) => CupertinoPickerDemo(),
    ),
    GalleryDemo(
      title: 'Pull to refresh',
      iconData: GalleryIcons.cupertino_pull_to_refresh,
      category: _kCupertinoComponents,
      // routeName: CupertinoRefreshControlDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoSliverRefreshControl-class.html',
      // builder: (BuildContext context) => CupertinoRefreshControlDemo(),
    ),
    GalleryDemo(
      title: 'Segmented Control',
      iconData: GalleryIcons.tabs,
      category: _kCupertinoComponents,
      // routeName: CupertinoSegmentedControlDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoSegmentedControl-class.html',
      // builder: (BuildContext context) => CupertinoSegmentedControlDemo(),
    ),
    GalleryDemo(
      title: 'Sliders',
      iconData: GalleryIcons.sliders,
      category: _kCupertinoComponents,
      // routeName: CupertinoSliderDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoSlider-class.html',
      // builder: (BuildContext context) => CupertinoSliderDemo(),
    ),
    GalleryDemo(
      title: 'Switches',
      iconData: GalleryIcons.cupertino_switch,
      category: _kCupertinoComponents,
      // routeName: CupertinoSwitchDemo.routeName,
      documentationUrl: 'https://docs.flutter.io/flutter/cupertino/CupertinoSwitch-class.html',
      // builder: (BuildContext context) => CupertinoSwitchDemo(),
    ),
    GalleryDemo(
      title: 'Text Fields',
      iconData: GalleryIcons.text_fields_alt,
      category: _kCupertinoComponents,
      // routeName: CupertinoTextFieldDemo.routeName,
      // builder: (BuildContext context) => CupertinoTextFieldDemo(),
    ),

    // Media
    GalleryDemo(
      title: 'Animated images',
      subtitle: 'GIF and WebP animations',
      iconData: GalleryIcons.animation,
      category: _kMedia,
      // routeName: ImagesDemo.routeName,
      // builder: (BuildContext context) => ImagesDemo(),
    ),
    GalleryDemo(
      title: 'Video',
      subtitle: 'Video playback',
      iconData: GalleryIcons.drive_video,
      category: _kMedia,
      // routeName: VideoDemo.routeName,
      // builder: (BuildContext context) => const VideoDemo(),
    ),
  ];

  assert(() {
    galleryDemos.insert(
      0,
      GalleryDemo(
        title: 'Pesto',
        subtitle: 'Simple recipe browser',
        iconData: Icons.adjust,
        category: _kDemos,
        // routeName: ,
        // builder: ,
      ),
    );
    return true;
  }());

  return galleryDemos;
  // return [galleryDemos[0]];
}

final List<GalleryDemo> kAllGalleryDemos = _buildGalleryDemos();

final Set<GalleryDemoCategory> kAllGalleryDemoCategories = kAllGalleryDemos.map((t) => t.category).toSet();

final Map<GalleryDemoCategory, List<GalleryDemo>> kGalleryCategoryToDemos =
    Map<GalleryDemoCategory, List<GalleryDemo>>.fromIterable(kAllGalleryDemoCategories, value: (dynamic category) {
  return kAllGalleryDemos.where((t) => t.category == category).toList();
});

final Map<String, String> kDemoDocumentationUrl = Map<String, String>.fromIterable(
  kAllGalleryDemos.where((t) => t.documentationUrl != null),
  key: (dynamic k) => k.routeName,
  value: (dynamic v) => v.documentationUrl,
);
