//  Copyright (C) 2013 Char Software Inc., DBA Localytics
//
//  This code is provided under the Localytics Modified BSD License.
//  A copy of this license has been distributed in a file called LICENSE
//  with this source code.
//
// Please visit www.localytics.com for more information.

#import "ComLocalyticsModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "LocalyticsSession.h"
#import "LocalyticsAmpSession.h"

@implementation ComLocalyticsModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"291210bd-4296-49f0-a80a-661b1d3843af";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.localytics";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
	
	NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self
                           selector:@selector(applicationWillResign:)
                               name:UIApplicationWillTerminateNotification
                             object:nil];
    [notificationCenter addObserver:self
                           selector:@selector(applicationWillResign:)
                               name:UIApplicationWillResignActiveNotification
                             object:nil];
    [notificationCenter addObserver:self
                           selector:@selector(applicationDidBecomeActive:)
                               name:UIApplicationDidBecomeActiveNotification
                             object:nil];
}

-(void)shutdown:(id)sender
{
	[super shutdown:sender];
}

-(void)applicationWillResign:(id)arg
{
	[[LocalyticsSession shared] close];
	[[LocalyticsSession shared] upload];
}

-(void)applicationDidBecomeActive:(id)arg
{
	[[LocalyticsSession shared] open];
	[[LocalyticsSession shared] upload];
}

#pragma mark Cleanup

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}


#pragma Public APIs


-(void)startSession:(id)arg
{
	ENSURE_ARG_COUNT(arg, 1);
	[[LocalyticsSession shared] startSession:[TiUtils stringValue:[arg objectAtIndex:0]]];
}

-(void)open:(id)args
{
	[[LocalyticsSession shared] open];
}

-(void)close:(id)args
{
	[[LocalyticsSession shared] close];
}

-(void)upload:(id)args
{
	[[LocalyticsSession shared] upload];
}

-(void)tagEvent:(id)args
{
	NSString *eventName = nil;
	NSDictionary *attributes = nil;
	NSDictionary *reportAttributes = nil;
	NSNumber *customerValueIncrease = 0;
	
	int count = [args count];
	
	if (count > 0)
	{
		eventName = [args objectAtIndex:0];
		ENSURE_TYPE (eventName, NSString);
	}
	
	if (count > 1)
	{
		attributes = [args objectAtIndex:1];
		ENSURE_TYPE (attributes, NSDictionary);
	}
	
	if (count > 2)
	{
		reportAttributes = [args objectAtIndex:2];
		ENSURE_TYPE (reportAttributes, NSDictionary);
	}
	
	if (count > 3)
	{
		customerValueIncrease = [args objectAtIndex:3];
		ENSURE_TYPE (customerValueIncrease, NSNumber);
	}
	
	[[LocalyticsSession shared] tagEvent:eventName attributes:attributes reportAttributes:reportAttributes customerValueIncrease:customerValueIncrease];
}

-(void)tagScreen:(id)arg
{
	ENSURE_ARG_COUNT(arg, 1);
	[[LocalyticsSession shared] tagScreen:[TiUtils stringValue:[arg objectAtIndex:0]]];
}

-(void)setLoggingEnabled:(id)arg
{
	[[LocalyticsSession shared] setLoggingEnabled:[TiUtils boolValue:arg def:NO]];
}

-(void)setEnableHTTPs:(id)arg
{
	[[LocalyticsSession shared] setEnableHTTPS:[TiUtils boolValue:arg def:NO]];
}

-(void)setOptIn:(id)arg
{
	[[LocalyticsSession shared] setOptIn:[TiUtils boolValue:arg def:YES]];
}

-(void)setValueForIdentifier:(id)args
{
	[[LocalyticsSession shared] setValueForIdentifier:[TiUtils stringValue:[args objectAtIndex:0]] value:[TiUtils stringValue:[args objectAtIndex:1]]];
}


-(void)setCustomerName:(id)arg
{
	ENSURE_ARG_COUNT(arg, 1);
	[[LocalyticsSession shared] setCustomerName:[TiUtils stringValue:[arg objectAtIndex:0]]];
}

-(void)setCustomerEmail:(id)arg
{
	ENSURE_ARG_COUNT(arg, 1);
	[[LocalyticsSession shared] setCustomerEmail:[TiUtils stringValue:[arg objectAtIndex:0]]];
}

-(void)setCustomerId:(id)arg
{
	ENSURE_ARG_COUNT(arg, 1);
	[[LocalyticsSession shared] setCustomerId:[TiUtils stringValue:[arg objectAtIndex:0]]];
}

-(void)setCustomDimension:(id)args
{
	ENSURE_ARG_COUNT(args, 2);
	[[LocalyticsSession shared] setCustomDimension:[TiUtils intValue:[args objectAtIndex:0]]
											 value:[TiUtils stringValue:[args objectAtIndex:1]]];
	
}

-(BOOL)handleURL:(id)arg
{
    ENSURE_UI_THREAD_1_ARG(arg);
	return [[LocalyticsAmpSession shared] handleURL:[NSURL URLWithString:[TiUtils stringValue:[arg objectAtIndex:0]]]];
}

-(void)setTestMode:(id)arg
{
    ENSURE_UI_THREAD_1_ARG(arg);
    [[LocalyticsAmpSession shared] setTestModeEnabled: [TiUtils boolValue:arg def:NO]];
}


@end
