# Changelog for UIView+Positioning

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

['swift' branch]:https://github.com/freak4pc/UIView-Positioning/tree/swift
