
// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
win.add(label);
win.open();


var Localytics = require('com.localytics');
Ti.API.info("module is => " + Localytics);
Localytics.setLoggingEnabled(true);
Localytics.setOptIn(true);
Localytics.setEnableHTTPs(false);

// Put yor Localytics appkey in the startSession method
Localytics.startSession("201ebe7260948ea6c6b2ade-7237dbfe-f147-11e1-4fe8-00ef75f326674");
Localytics.setCustomDimension(0, "Free User");
Localytics.setEmail("test@testuser.com");
Localytics.setValueForIdentifier("FakeCompany Special ID", "5252525");
Localytics.tagEvent("Test Event");
Localytics.tagEvent("Test Event", {"animal":"cat"}, {"age":5});
Localytics.tagEvent("Test Event", {"animal":"cat"}, {"age":5}, 50);
Localytics.tagScreen("Screen1");
Localytics.tagScreen("Screen2");
Localytics.handleURL("amp201ebe7260948ea6c6b2ade-7237dbfe-f147-11e1-4fe8-00ef75f326674://testMode/enabled");
Localytics.handleURL("amp201ebe7260948ea6c6b2ade-7237dbfe-f147-11e1-4fe8-00ef75f326674://testMode/enabled");
