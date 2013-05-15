# Localytics Android Module

## Description

This is the Android Titanium plugin for version 2.5 of the Localytics Android SDK

## Accessing the Localytics Module

Before starting, you will need to enter your localytics application key in the localytics.properties file located in your assets folder.

Then, to access this module from JavaScript, you would do the following:

  var localytics = require("ti.localytics");

The localytics variable is a reference to the Module object.

## Sessions

This plugin manages the session lifecycle on its own. There is no need to directly call 'open', 'close', or 'upload', although these methods are exposed.

## Custom Dimensions

Because developers do not directly call session lifecycle events, it is impossible for developers to include "Custom Dimension" information with these calls as they would typically do. 

We have therefore changed the way custom dimensions work for this module. Instead of including custom dimensions on each open, close, and tagEvent call, developers may just use the setCustomDimensions setter to make "sticky" dimensions which will be uploaded on your behalf until they are updated again.

#### Example usage:

// Custom dimenion 0 is set to "Subscriber", custom dimension 1 is set to "Cat"

localytics.setCustomDimensions(["Subscriber", "Cat"]);

// Custom dimensions are cleared

localytics.setCustomDimensions(null);

More information about custom dimensions is located here:
http://www.localytics.com/docs/advanced-features-implementation/#cd

## Event Tagging

Event tagging works the same as the normal Android SDK.

You may call tagEvent with just a name, or you may optionally include an attributes dictionary. 

#### Example usage:

localytics.tagEvent("Test");

localytics.tagEvent("Test", {"Gold": "50"});

localytics.tagEvent("Test", {"Gold": localytics.createRangedAttribute(6, [5, 10, 15, 20])});


## Screen Tagging

Screen tagging works the same as the normal Android SDK.

#### Example usage:

localytics.tagScreen("Screen 1");

## Identifiers

Identifiers work the same as the normal Android SDK.

#### Example usage:

localytics.setCustomerEmail("testing@localytics.com");

localytics.setCustomerName("John Doe");

localytics.setCustomerId("124525");

localytics.setCustomerData("super special id", "1242444");

## Opt-out

Opt-out works the same as the normal Android SDK

#### Example usage:

localytics.setOptOut(true);

localytics.setOptOut(false);

## More Information

Android Integration Guide: http://www.localytics.com/docs/android-integration/

Also check out the in-line comments in the Android SDK for a wealth of information. The Android SDK is available here:

http://downloads.localytics.com/SDKs/Android/Localytics-Android-latest.src.zip


## Author

Randall Dailey

support@localytics.com

## License

Copyright (c) 2013, Char Software, Inc. d/b/a Localytics
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Neither the name of Char Software, Inc., Localytics nor the names of its 
      contributors may be used to endorse or promote products derived from this
      software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY CHAR SOFTWARE, INC. D/B/A LOCALYTICS ''AS IS'' AND 
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
DISCLAIMED. IN NO EVENT SHALL CHAR SOFTWARE, INC. D/B/A LOCALYTICS BE LIABLE 
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL 
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR 
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
