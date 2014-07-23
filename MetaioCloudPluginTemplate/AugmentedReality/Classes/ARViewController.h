//
//  ARViewController.h
//
//  Created by Stefan Misslinger on 3/1/11.
// Copyright 2007-2013 metaio GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <metaioSDK/MetaioCloudPlugin/MetaioCloudPluginViewController.h>

/** This class represents the AR view. Implement the JunaioPluginDelegate protocol to define the channel ID to use */
@interface ARViewController : MetaioCloudPluginViewController
{
	bool	m_useLocationAtStartup;	//!< Flag to indicate if we should use the location at startup
}

- (IBAction)onBtnClosePushed:(id)sender;


@end
