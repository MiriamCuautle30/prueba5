//
//  ARViewController.m
//
//  Created by Stefan Misslinger
//  Copyright 2007-2013 metaio GmbH. All rights reserved.
//

#import "ARViewController.h"
#import "ASImageSharingViewController.h"

@implementation ARViewController

#pragma mark - View lifecycle


- (void) viewDidLoad
{
	[super viewDidLoad];
	
	// use this call to move the radar position
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		[self setRadarOffset:CGPointMake(-16, -20) scale:0.825f anchor:ANCHOR_TR];
	}
	else
	{
		[self setRadarOffset:CGPointMake(-4.5, -20) scale:0.55f anchor:ANCHOR_TR];
	}
	
	
	// add the popup view to the view hierarchy if it is not present there already.
	if( ![self.objectContextView  superview] )
	{
		// we add it to the screen
		[self.view addSubview:self.objectContextView];
		
		[self.objectContextView setHidden:YES];
	}
}




#pragma mark - react to UI events

// Close the UIViewcontroller on pushing the close button.
- (IBAction)onBtnClosePushed:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}


#pragma mark - @protocol MetaioCloudPluginDelegate

/** 
 * Provide the channel number that should be opened by the plugin 
 * In order to get your channel ID, please signup as a developer on http://www.junaio.com/developer
 * and create your own channel.
 *
 * If you want to use a location based channel, be sure to return 'YES' for (BOOL) shouldUseLocation,
 * otherwise 'NO'.
 */
- (NSInteger) getChannelID
{
    NSBundle* mainBundle = [NSBundle mainBundle];
    NSString *value = [mainBundle objectForInfoDictionaryKey:@"ChannelID"];
    return [value intValue];
}



/** Optional
 *
 * return YES if the application should support location
 * If you return NO here, your application will never access the location sensors.
 * Most scan channels don't need a location, so NO can be returned here.
 */
- (BOOL) shouldUseLocation
{
    return YES;
}



/** Optional
 *
 * return YES if the application should activate location sensors at startup
 * This will cause the application requesting permission at startup
 * Return YES here if you are using a location based channel that needs location at startup
 * Returning NO will cause the request to the server having no location
 */
- (BOOL) shouldUseLocationAtStartup
{
    return [self shouldUseLocation] && m_useLocationAtStartup;
}



///** Optional
// *
// * return YES to cache downloaded files
// * During the development phase it makes sense to return NO here,
// * if the channel content changes a lot.
// */
//- (BOOL) shouldUseCache
//{
//	return YES;
//}


#pragma mark - Extras


/** Default implementation for Sharing a screenshot
 * 
 * Feel free to adjust the source of ASImageSharingViewController to adjust its behavior or integrate the Facebook SDK
 */
- (void) openSharingViewController: (UIImage*) imageToShare
{
	ASImageSharingViewController* controller = [[ASImageSharingViewController alloc] initWithNibName:@"ASImageSharingViewController" bundle:nil];
	controller.imageToPost = imageToShare;
	[self presentModalViewController:controller animated:YES];
	[controller release];
}



@end
