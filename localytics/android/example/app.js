var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
win.add(label);
win.open();

var localytics = require('ti.localytics');
Ti.API.info("module is => " + localytics);

localytics.setCustomerEmail("testing@localytics.com");
localytics.setCustomerName("John Doe");
localytics.setCustomerId("124525");
localytics.setCustomerData("super special id", "1242444");

localytics.tagScreen("Screen 1");
localytics.tagScreen("Screen 2");

localytics.setCustomDimensions(["Subscriber", "Cat"]);

localytics.tagEvent("Test");
localytics.tagEvent("Test", {"Gold": "50"});

localytics.setCustomDimensions(null);

localytics.tagEvent("Test");
localytics.tagEvent("Test", {"Gold": "50"});
localytics.tagEvent("Test", {"Gold": localytics.createRangedAttribute(6, [5, 10, 15, 20])});

localytics.setOptOut(true);
localytics.setOptOut(false);

