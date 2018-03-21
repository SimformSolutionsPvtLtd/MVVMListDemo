# MVVM list demo

## Features

- [x] Custom navigator for login mudule
- [x] Protocol base navigation for list module
- [x] Dynamic binding with generic type detail view model (Name and Price)
- [x] Advance API layer based on alamofire and object mapper
- [x] Common view models so we can prevent table view datasouce and delegate in each view controllers
- [x] Color assests
- [x] Use of IBDesignable and IBInspectables
- [x] Handy extentions for extend fucntionality of existing componets
- [x] High scalable user manager class
- [x] Custom controls to maintain app theme


## Requirements

- iOS 11.0+
- Xcode 9.0

## Installation

#### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```



To run this demo, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target 'MVVMListDemo' do
pod 'AlamofireObjectMapper', '~> 5.0'
pod 'Kingfisher', '~> 4.6'
end
```

Then, run the following command:

```bash
$ pod install
```




