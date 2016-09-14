![alt tag](https://github.com/charleshkang/WalmartLabs/blob/master/walmartlabs_demo.gif)
# Walmart Labs
View all products from Walmart Labs! Project was built using Swift and following the MVC design pattern.

## Installation
- Install [Cocoapods](http://guides.cocoapods.org/using/getting-started.html#installation).
- cd to directory and use `pod init` to create a Podfile
```swift
pod install
```
```swift
open Podfile
```
- Add the following to Podfile
  ```swift
  source 'https://github.com/CocoaPods/Specs.git'
  platform :ios, '8.0'
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
- See all products from WalmartLabs
- More products lazily load in the background
- Swipe through products smoothly

## What's Next
- Unit Tests
- Find solution to unicode replacement characters
- Implement lazy loading for swipe-able collection view cells 
