# Facebook Login with Kinvey

*Before you run the project:*

Remeber to:

* Run [CocoaPods](https://cocoapods.org) in Terminal with the command `pod install`
* Change the `AppDelegate.swift` file with your own `appKey` and `appSecret`, for example:

```
Kinvey.sharedClient.initialize(appKey: "my app key", appSecret: "my app secret")
```

* Change the `AppDelegate.swift` and `Info.plist` files with your own values for `FacebookAppID`, `FacebookDisplayName` and `URL Schemes`

This project is using the [FacebookLogin](https://github.com/facebook/facebook-sdk-swift) framework provided by `Facebook`. The version tested was the `0.2.0` of the `FacebookLogin` framework.