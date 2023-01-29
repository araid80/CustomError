# CustomError


[![Swift 5.0](https://img.shields.io/badge/swift-5.0-orange.svg?style=flat)](https://swift.org)
![Languages](https://img.shields.io/badge/Language-Objective--C%20%7C%20Swift-orange.svg)
[![CocoaPods](https://img.shields.io/badge/CocoaPods-compatible-green.svg)](https://github.com/araid80/CustomError)
[![License Badge](https://img.shields.io/badge/License-MIT-lightgrey)](LICENSE)
![Plaforms](https://img.shields.io/badge/Platform-macOS_iOS_tvOS_watchOS-lightgrey.svg)

##Installation

###CocoaPods

```
pod 'CustomError'
```

##Example

###Swift
```swift
let customError1 = CustomError()    // empty parameter -> UnknownError
let customError2 = CustomError(domain: "CustomErrorExample", code: -1)  // Is the same as NSError.
let customError3 = CustomError(domain: "CustomErrorExample", code: -1, userInfo: [NSLocalizedDescriptionKey : "custom error"])  // Is the same as NSError.
```

###Objective-C
```objective-c
NSError *customError1 = [[CustomError alloc] init];
NSError *customError2 = [[CustomError alloc] initWithDomain:@"CustomErrorExample" code:-1 userInfo:nil];
```


##Extension
Create an enumeration of Int types and expand using CustomErrorType protocol.


