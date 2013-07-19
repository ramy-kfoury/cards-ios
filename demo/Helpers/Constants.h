//
//  Constants.h
//  demo
//
//  Created by Ramy Kfoury on 6/10/13.
//  Copyright (c) 2013 Ramy Kfoury. All rights reserved.
//

#ifndef demo_Constants_h
#define demo_Constants_h

#import "PortraitViewController.h"

#define CustomColor [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]

// Helpers
#import "RKRequestData.h"
#import "Networking.h"
#import "SMXMLDocument.h"
#import "SBJSON.h"
#import "ODRefreshControl.h"
#import "SDWebImageManager.h"
#import "SDImageCache.h"
#import "DLog.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
#import "UIImageAddons.h"
#import "NSStringAddons.h"
#import "RKTextField.h"
#import "CustomButton.h"
#import "GAI.h"

// Views
#import "SectionFooterView.h"
#import "SectionHeaderView.h"
#import "MainView.h"
#import "LeftView.h"
#import "HeaderView.h"

// Models

// Cells
#import "MenuCell.h"

// Defaults
#define USER_OBJECT @"USER_OBJECT"
#define IOS_VERSION  @"IOS_VERSION"
#define USER_DEVICE_TOKEN  @"USER_DEVICE_TOKEN"
#define APP_VERSION  @"APP_VERSION"
#define LANGUAGE  @"LANGUAGE"
#define PHONELANGUAGE  @"PHONELANGUAGE"
#define PHONEID  @"PHONEID"
#define SANDBOX  @"SANDBOX"
#define CLIENT  @"IPHONE"

#define FONT_SIZE @"FONT_SIZE"
#define DEFAULT_FONT_SIZE 14

 // should be added in info http://www.daveallanson.com/index.php?option=com_content&view=article&id=56:adding-custom-fonts-ios-4&catid=38:blog&Itemid=56
#define FONT_NAME_REGULAR @"TimesNewRomanPSMT"
#define FONT_NAME_BOLD @"TimesNewRomanPS-BoldMT"

// Config
#define SERVER_URL @"http://util.trademob.com:5000"

#define SUCCESS @"SUCCESS"
#define PARSING_XML  @"XML"
#define PARSING_JSON  @"JSON"
#define REQUEST_GET  @"GET"
#define REQUEST_POST  @"POST"

#define SAMPLE_SCRIPT @"cards"
#define USERNAME @"tester"
#define PASSWORD @"tm-sdktest"

#define MENU_OPTION1 @"MENU_OPTION1"
#define MENU_OPTION2 @"MENU_OPTION2"

#define NAME_DEFAULT @"Ramy Kfoury"
#define EMAIL_DEFAULT @"ramy@trademob.com"
#define HOMEPAGE_DEFAULT @"http://ramy.trademob.com"

// Notifications

#endif
