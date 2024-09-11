# Le Tonneau

Le Tonneau is a cocktail recipe application for iOS that provides users with a comprehensive collection of cocktail recipes. The app features three main views: Welcome View, Navigation List View, and Detailed Recipe View. Additionally, users can customize the app's theme based on their preferences.

## Demo
- Link to Demo: https://www.youtube.com/watch?v=F6Q92KNmWDY&feature=youtu.be
![letonneau](https://github.com/user-attachments/assets/81125e49-6858-4bfb-81de-d9743a0f20b2)
![listview](https://github.com/user-attachments/assets/99fe8daa-8171-4008-9dc6-69c50ab83c31)


## Project Setup

### Prerequisites

- Xcode 14.0 or later
- iOS 17.5 or later

### Installation

1. **Clone the Repository**

   ```sh
   git clone https://github.com/RMIT-Vietnam-Teaching/cosc2659-cosc2813-ios-assignment-1-2024b-xian-94.git
   cd le-tonneau
   ```

2. **Open the Project**

   Open the `LeTonneau.xcodeproj` file in Xcode.

3. **Install Dependencies**

   Le Tonneau uses Swift Package Manager (SPM) for dependency management. Open the project in Xcode and navigate to `File > Swift Packages > Update to Latest Package Versions` to install any required packages.

4. **Build and Run**

   Select the target device or simulator, then click the `Run` button in Xcode to build and run the application.

### Usage

1. **Welcome View**
   - Launch the app to see the welcome view with the application logo, title, slogan, and author's information.

2. **Navigation List View**
   - Browse through different categories to find cocktail recipes.
   - Use the search bar to find specific cocktails.
   - Apply filters to narrow down the recipe list based on your preferences.

3. **Detailed Recipe View**
   - Tap on a cocktail from the list to see detailed information about it.
   - View images for decoration ideas.
   - View ingredient list and sort by name or quantity.
   - View instruction or watch video tutorials.
   - Navigate to Facebook or Shopee for online shop, or view the physical store location. 

4. **Theme Customization**
   - Navigate to the settings to change the app's theme.
   - Choose between system default, light mode, or dark mode.

### Detailed Description and Implementation

#### Welcome View
- **UI Components**: Logo, Title Label, Slogan Label, Author Information pop-up diaglog 
- **Implementation**: The welcome view is implemented using SwiftUI and consists of a VStack containing the app logo, title, slogan, and author information.

#### Navigation List View
- **UI Components**: List, Search Bar, Filter Buttons, Theme changer 
- **Implementation**: The navigation list view uses a SwiftUI List to display categories and a search bar to filter the recipes. Filters are implemented as buttons that modify the list's state.

#### Detailed Recipe View
- **UI Components**: Text Labels, Image Views, Scroll Views, Tab Views, Map View, Video View, clickable social icons 
- **Implementation**: The detailed recipe view is a SwiftUI ScrollView that includes text labels for the cocktail's information and image views for decoration ideas.

#### Theme Customization
- **UI Components**: Toggle Switches
- **Implementation**: The theme customization is handled using SwiftUI's AppStorage to manage the app's theme state. Users can change the theme through a settings view that provides toggle switches for light and dark modes.


## Author

- **Truong Hong Van** - xian-94 (https://github.com/xian-94)
