//
//  RKRequestData.h
//  idbox
//
//  Created by Ramy Kfoury on 3/23/12.
//  Copyright (c) 2012 __FOO__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Networking.h"
@class AppDelegate;
@class ASIFormDataRequest;
@class RKRequestData;

// delegate to parse the response data returned by request
@protocol RequestDataDelegate
@optional - (void) handleError:(NSError *)error fromRequest:(RKRequestData *)request;
@end

@interface RKRequestData : NSObject
{
    // Variables       
    NSUserDefaults *defaults;  
}

@property (nonatomic, strong) NSString *requestid;
@property (nonatomic, strong) NSString *parsingType;
@property (nonatomic, strong) NSString *requestType;
@property (nonatomic, assign) BOOL shouldAutenticate;
@property (nonatomic, assign) BOOL shouldBuildPostBody;
@property (nonatomic, strong) NSDictionary *authenticationDict;
@property (nonatomic, assign) NetworkRequestType type;

@property (nonatomic, strong) ASIFormDataRequest *request;

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSMutableDictionary *requestValues;

@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) BOOL aSynchronous;
@property (nonatomic, strong) NSString *serverURL;
@property (nonatomic, strong) NSString *script;

- (void) parseXML:(NSData *)responseData;
- (void) parseJSON:(NSString *)responseString;

- (void) requestStart;

@end
