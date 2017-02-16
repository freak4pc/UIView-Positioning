# Changelog for UIView+Positioning

### 1.5
- Swift 3 version is now the master branch.
- Swift 2.3 version (deprecated) is on its own swift-2.3 branch
- Minor fixes and formatting issues.

Thanks for the previous PRs @cameronehrlich, @abuassar, @vinnyt ! :-)

### 1.3
- Swift version has been moved to the 'master' branch
- Swift 3 compatible version is now at the 'swift3' branch
- Podspecs finally properly updated

### 1.1

- Swift version is now available in the ['swift' branch]
- Added **left** and **top** properties (aliases for x and y) - Issue #7
- Added bounds-related properties - **boundsX**, **boundsY**, **boundsWidth**, **boundsHeight** - Issue #6
- Fixed center-related properties to be Pixel Integral
- Optimized setting x and y together by directly setting origin in **centerToParent**
- Added default handling for UIInterfaceOrientationUnkown in **centerToParent**
- Code cleanup and optimization for setters
- Added this changelog
- Added a new example in README.md showing usage of **centerToParent** with fibonacci series

### 1.0.1

- Calculations are now Pixel Integral and take the Device's Screen Scale into consideration (Thanks to @smileybord and @harlanhaskins)

### 1.0

- Category was renamed from UIView+QuickRect to UIView+Positioning
- Fixed up the README file to include