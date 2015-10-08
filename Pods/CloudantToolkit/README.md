MobileFirst Platform for iOS beta SDK for IBM Bluemix
===

This package contains the required native components to interact with the IBM
Bluemix Mobile Cloud Services.  The SDK manages all the communication and security integration between 
the client and with the MobileFirst Platform for iOS beta in Bluemix.

When you use Bluemix to create a MobileFirst application, BlueMix provisions 
multiple services under a single application context. Your mobile application is given 
access to the following mobile services: Mobile Application Security and Analytics (together known as Advanced Mobile Access, or AMA), Push, and Mobile Data.

Version: 0.10

###Installation
The SDK may be installed either by downloading a [zip file](https://imf-catalog.ng.bluemix.net/sdk/IMF-iOSClientSDK.zip) 
or by installing desired frameworks from [CocoaPods](http://cocoapods.org/). Using CocoaPods 
can significantly shorten the startup time for new projects and lessen the burden of managing 
library version requirements as well as the dependencies between them.

To install CocoaPods, please see [CocoaPods Getting Started](http://guides.cocoapods.org/using/getting-started.html#getting-started).  If you
are using one of our [samples](https://hub.jazz.net/user/mobilecloud),
a [pod](http://guides.cocoapods.org/using/the-podfile.html)
file has been included for you.

###Contents
The complete SDK consists of a core, plus a collection of pods that correspond to functions exposed
by the MobileFirst Platform for iOS beta.  The downloaded zip file
contains all of them. However, each piece of the iOS SDK is also available as a separate pod
through CocoaPods, 
that you can add to your project individually. This allows maximum flexibility, as the developer is able to 
pick and choose the pods required for a given application. The MobileFirst Platform for iOS beta SDK contains the following 
pods, any of which may be added to your project:

- IMFCore - This module implements core services such as networking, logging and analytics and security and authorization.
- CloudantToolkit - This is the module for data support
- IMFPush - This is the module for push notification support
- IMFFacebookAuthentication - This is the AMA module for using Facebook as an identity provider
- IMFGoogleAuthentication - This is the AMA module for using Google as an identity provider
- IMFURLProtocol - This is the module that enables use of IMFURLProtocol (NSURLRequest) 

###Supported iOS Levels
- iOS 7
- iOS 8

###Getting Started
Services are associated with a Mobile iOS 8 Cloud application. Connectivity and interaction with
these services depends on the application id, application secret, and application route associated
with a Mobile iOS 8 Cloud Application.

IBMBluemix is the entry point for interacting with the Mobile Cloud Services SDKs.  The method initialize 
must be invoked before any other API calls.  IBMBluemix provides information about the current SDK level 
and access to service SDKs.

Below is an example of initializing the Mobile Cloud Services SDK.
```Objective-c
// Initialize SDK with IBM Bluemix application ID and route
IMFClient *imfClient = [IMFClient sharedInstance];
[imfClient initializeWithBackendRoute:<app route> backendGUID:appId];
```

```Swift
// Initialize SDK with IBM Bluemix application ID and route
IMFClient.sharedInstance().initializeWithBackendRoute(applicationRoute, backendGUID: applicationId);
```

###Learning More
Visit the **[Bluemix Developers Community](https://developer.ibm.com/bluemix/)**.

###Connect with Bluemix 

[Twitter](https://twitter.com/ibmbluemix) |
[YouTube](https://www.youtube.com/playlist?list=PLzpeuWUENMK2d3L5qCITo2GQEt-7r0oqm) |
[Blog](https://developer.ibm.com/bluemix/blog/) |
[Facebook](https://www.facebook.com/ibmbluemix) |
[Meetup](http://www.meetup.com/bluemix/)

*Licensed Materials - Property of IBM
(C) Copyright IBM Corp. 2013, 2014. All Rights Reserved.
US Government Users Restricted Rights - Use, duplication or
disclosure restricted by GSA ADP Schedule Contract with IBM Corp.*

[Terms of Use](https://hub.jazz.net/gerrit/plugins/gerritfs/contents/bluemixmobilesdk%2Fimf-ios-sdk/refs%2Fheads%2Fmaster/License.txt)