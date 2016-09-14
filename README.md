# WalmartLabs
View all products from WalmartLabs! Project was built using Swift and following the MVC design pattern.

![alt tag](https://github.com/charleshkang/WalmartLabs/blob/master/walmartlabs_demo.gif)

## Pods
- SDWebImage (caching and asynchronous image downloading)
- SwiftyJSON (handle JSON data better and more easily)
- HCSStarRatingView (represent product ratings in a UX-friendly way)

## Requirements
- Xcode 7.3.1
- iOS 9.0

## Installation
- Install [Cocoapods](http://guides.cocoapods.org/using/getting-started.html#installation).
- cd to directory and use `pod init` to create a Podfile

```swift
open Podfile
```
- Add the following to Podfile
  ```swift
  source 'https://github.com/CocoaPods/Specs.git'
  platform :ios, '9.0'
  use_frameworks!

  pod 'SDWebImage', '~>3.8'
  pod 'SwiftyJSON'
  pod 'HCSStarRatingView', '~> 1.4.5'
  ```
- Save and install pods
```swift
pod install
```
- Open WalmartLabs.xcworkspace

## Features
- See all products from WalmartLabs in a table view
- More products lazily load in the background
- Swipe through products smoothly

## Future Improvements and Features
- Unit Tests
- Find solution for  unicode replacement characters
- Implement lazy loading for swipeable collection view cells
