# Localytics Module

## Description

Localytics iOS Plugin for Titanium, using Localytics SDK 2.17.2

Updated April 2013

## Accessing the Localytics Module

To initialize this module from JavaScript, you would do the following:

	var Localytics = require("com.localytics");
	Localytics.startSession("Your Localytics API Key Goes Here");

From here, Localytics will begin tracking all session lifetime data. 
There is no need to directly call the open/close or upload APIs.

## Reference


### Localytics.startSession(String)
Pass in your Localytics API Key to begin the session


TODO: This is an example of a module function.

### Localytics.tagEvent(String, Dictionary, Dictionary, Integer)
Allows a session to tag a particular event as having occurred.  For
example, if a view has three buttons, it might make sense to tag
each button click with the name of the button which was clicked.
For another example, in a game with many levels it might be valuable
to create a new tag every time the user gets to a new level in order
to determine how far the average user is progressing in the game.
<br>
<strong>Tagging Best Practices</strong>
<ul>
<li>DO NOT use tags to record personally identifiable information.</li>
<li>The best way to use tags is to create all the tag strings as predefined
constants and only use those.  This is more efficient and removes the risk of
collecting personal information.</li>
<li>Do not set tags inside loops or any other place which gets called
frequently.  This can cause a lot of data to be stored and uploaded.</li>
</ul>
<br>
See the tagging guide at: http://wiki.localytics.com/

@param event The name of the event which occurred.

@param attributes (Optional) An object/hash/dictionary of key-value pairs, contains 
contextual data specific to the event.

@param rerportAttributes (Optional) Additional attributes used for custom reporting.
Available to Enterprise customers, please contact services for more details.

@param customerValueIncrease (Optional) Numeric value, added to customer lifetime value.
Integer expected. Try to use lowest possible unit, such as cents for US currency.

### Localytics.tagScreen(String)
Allows tagging the flow of screens encountered during the session.

@param screen The name of the screen

### Localytics.setCustomDimension(Integer, String)
abstract Sets the value of a custom dimension. Custom dimensions are dimensions
which contain user defined data unlike the predefined dimensions such as carrier, model, and country.
Once a value for a custom dimension is set, the device it was set on will continue to upload that value
until the value is changed. To clear a value pass nil as the value.
The proper use of custom dimensions involves defining a dimension with less than ten distinct possible
values and assigning it to one of the four available custom dimensions. Once assigned this definition should
never be changed without changing the App Key otherwise old installs of the application will pollute new data.

### Localytics.setValueForIdentifier(String)
Sets the value of a custom identifier. Identifiers are a form of key/value storage
 which contain custom user data. Identifiers might include things like email addresses, customer IDs, twitter
 handles, and facebook IDs.
 Once a value is set, the device it was set on will continue to upload that value until the value is changed.
 To delete a property, pass in nil as the value.

### Localytics.setCustomerEmail(String)
Helper method to record the customer name using the identifiers framework described in setValueForIdentifier

### Localytics.setCustomerId(String)
Helper method to record the customer ID using the identifiers framework described in setValueForIdentifier

### Localytics.setCustomerName(String)
Helper method to record the customer name using the identifiers framework described in setValueForIdentifier


### Localytics.upload()
(Should not need to call directly) Force an upload of Localytics data

### Localytics.open()
(Should not need to call directly) Try to open the Localytics session

### Localytics.resume()
(Should not need to call directly) Try to resume a closed Localytics session

### Localytics.close()
(Should not need to call directly) Close the existing Localytics session

### Localytics.setLoggingEnabled(bool);
Turn logging on or off

### Localytics.setOptIn(bool);
Opt the customer out of analytics. User is opted in by default.

### Localytics.setEnableHTTPs(bool);
Force a secure connection when communicating with localytics servers. Default is not secured.

## Usage

var Localytics = require('com.localytics');

Ti.API.info("module is => " + Localytics);

Localytics.setLoggingEnabled(true);

Localytics.setOptIn(true);

Localytics.setEnableHTTPs(true);

// Put your Localytics appkey in the startSession method

Localytics.startSession("201ebe7260948ea6c6b2ade-7237dbfe-f147-11e1-4fe8-00ef75f326674");

Localytics.setCustomDimension(0, "Free User");

Localytics.setEmail("test@testuser.com");

Localytics.setValueForIdentifier("FakeCompany Special ID", "5252525");

Localytics.tagEvent("Test Event");

Localytics.tagEvent("Test Event", {"animal":"cat"}, {"age":5});

Localytics.tagEvent("Test Event", {"animal":"cat"}, {"age":5}, 50);

Localytics.tagScreen("Screen1");

Localytics.tagScreen("Screen2");

## Support

Please contact support@localytics.com with any questions.

