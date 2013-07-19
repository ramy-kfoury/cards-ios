//
//  Networking.h
//  demo
//
//  Created by Ramy Kfoury on 06/12013.
//  Copyright (c) 2013 FOO_. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASINetworkQueue.h"
@class RKRequestData;
@class ASIHTTPRequest;

typedef enum _NetworkRequestType {
    NetworkSampleRequest,
    
} NetworkRequestType;

@protocol NetworkingDelegate <NSObject>
@optional
- (void)receivedResponseSuccess:(BOOL)success responseDict:(NSDictionary *)responseDict RequestType:(NetworkRequestType)type;
@end

@interface Networking : NSObject

@property (nonatomic, strong) ASINetworkQueue *queue;
@property (nonatomic, strong) NSMutableDictionary *requestsDictionary;

+ (Networking *) sharedManager;
- (void) addRequestToQueue:(ASIHTTPRequest *)request;

- (NSString *) sendNetworkRequestWithDelegate:(id <NetworkingDelegate>)delegate withParams:(NSDictionary *)params;


- (void) configureTimeout:(NSInteger)ttl ForScript:(NSString *)script;
- (void) cancelForRequestID:(NSString *)requestid;
+ (void)parseResponseXML:(NSData *)responseData forRequest:(RKRequestData *)request;
+ (void)parseResponseJSON:(NSString *)responseString forRequest:(RKRequestData *)request;

@end
