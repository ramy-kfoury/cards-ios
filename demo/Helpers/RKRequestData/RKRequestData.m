//
//  RKRequestData.m
//  idbox
//
//  Created by MacMini on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RKRequestData.h"
#import "Constants.h"
#import "NSString+URLEncoding.h"
#import "NSObject+SBJSON.h"
#import "AppDelegate.h"

@implementation RKRequestData

@synthesize parsingType;
@synthesize requestType;
@synthesize request;
@synthesize type;
@synthesize url;
@synthesize requestValues;
@synthesize delegate;
@synthesize aSynchronous;
@synthesize serverURL;
@synthesize script;
@synthesize requestid;
@synthesize authenticationDict;
@synthesize shouldAutenticate;

- (void) dealloc
{
    [authenticationDict release];
    [requestid release];
    [serverURL release];
    [script release];
    [parsingType release];
    [requestType release];
    [url release];
    [requestValues release];
    [super dealloc];
}

- (void) createRequest
{    
    defaults = [NSUserDefaults standardUserDefaults];
    
    if (!requestValues)
    {
        requestValues = [[NSMutableDictionary alloc] init];
    }
    // Add standard key values to requests to own server
    
    if (serverURL.length > 0 && script.length > 0)
    {
        url = [NSString stringWithFormat:@"%@/%@", serverURL, script];
    }
    
    if ([requestType isEqualToString:REQUEST_GET])
    {
        //        NSLog(@"GET Request");
        NSArray *postValuesKeys = [requestValues allKeys];
        for (int i = 0; i < [requestValues count]; i++)
        {
            NSString *key = [postValuesKeys objectAtIndex:i];
            NSString *value = [requestValues objectForKey:key];
            
            url = [url stringByAppendingFormat:@"&%@=%@", [key urlEncodeUsingEncoding:NSUTF8StringEncoding], [value urlEncodeUsingEncoding:NSUTF8StringEncoding]];
        }
        DLog(@"url-get: %@", url);
        
        request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    }
    else if ([requestType isEqualToString:REQUEST_POST])
    {
        request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:url]];
        if (!_shouldBuildPostBody)
        {
            NSArray *postValuesKeys = [requestValues allKeys];
            for (int i = 0; i < postValuesKeys.count ; i++)
            {
                
                NSString *key = [postValuesKeys objectAtIndex:i];
                NSString *value = [requestValues objectForKey:key];
                [request setPostValue:value forKey:key];
            }
        }
        else
        {            
            NSString *string = [requestValues JSONRepresentation];
//            DLog(@"%@", string);
            NSMutableData *requestBody = [[NSMutableData alloc] initWithData:[string dataUsingEncoding:NSUTF8StringEncoding]];
            [request setRequestMethod:REQUEST_POST];
            [request setPostBody:requestBody];
            [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
            
        }
        DLog(@"url-post: %@", url);
    }
    
    [request setUseSessionPersistence:NO];
    [request setUseCookiePersistence:NO];
    [request setCacheStoragePolicy:ASICacheForSessionDurationCacheStoragePolicy];
    if (shouldAutenticate)
    {
        request.shouldPresentCredentialsBeforeChallenge = YES;
        [request addBasicAuthenticationHeaderWithUsername:[authenticationDict valueForKey:@"username"]
                                              andPassword:[authenticationDict valueForKey:@"password"]];
    }
    [request setDelegate:self];
    
    //    [request setValidatesSecureCertificate:NO];
}

- (void) requestStart
{
    [self createRequest];
    
    aSynchronous ? [request startAsynchronous] : [request startSynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)Request
{
    DLog(@"requestFinished");
    if ([self.parsingType isEqualToString:PARSING_JSON]) 
    {
        // Use when fetching text data for JSON parsing
        if ([requestType isEqualToString:REQUEST_GET]) 
        {
            if ([[Request responseString] length] > 0) 
            {
                [self parseJSON:[Request responseString]];
            }
            
        } else if ([requestType isEqualToString:REQUEST_POST])
        {
            if ([[Request responseString] length] > 0) 
            {
                [self parseJSON:[Request responseString]];
            }
        }
    }   
    
    else if ([self.parsingType isEqualToString:PARSING_XML]) 
    {
        // Use when fetching binary data for XML parsing
        NSData *responseData = [Request responseData];
        [self parseXML:responseData];
    }    
}


- (void) parseJSON:(NSString *)responseString
{
    if ([responseString length] > 0)
    {
        [Networking parseResponseJSON:responseString forRequest:self];
    }
}

- (void) parseXML:(NSData *)responseData
{
    if (responseData)
    {
        [Networking parseResponseXML:responseData forRequest:self];
    }
}

- (void)requestFailed:(ASIHTTPRequest *)Request
{
    // Remove request from Networking object
    [[Networking sharedManager].requestsDictionary removeObjectForKey:requestid];
    
    NSError *error = [Request error];
    DLog(@"Error: %i, %@", error.code, error.description);
    
    switch (error.code)
    {            
        case 1:
        {
            // network failure
            if(delegate && [self.delegate respondsToSelector:@selector(handleError:fromRequest:)])
            {
                // add request to queue to be sent again
                [[Networking sharedManager] addRequestToQueue:[Request copy]];
                [[[Networking sharedManager] queue] setSuspended:YES];
                [delegate handleError:error fromRequest:self];
            }
            break;
        }
        case 2:
        {
            // request timed out
            if(delegate && [self.delegate respondsToSelector:@selector(handleError:fromRequest:)])
            {
                // add request to queue to be sent again                
                [[Networking sharedManager] addRequestToQueue:[Request copy]];
                [[[Networking sharedManager] queue] setSuspended:YES];
                [delegate handleError:error fromRequest:self];
            }
            break;
        }
            
        case 3:
        {
            // not authenticated
            if(delegate && [self.delegate respondsToSelector:@selector(handleError:fromRequest:)])
            {
                //send the delegate function with the amount entered by the user
                [delegate handleError:error fromRequest:self];
            }
            break;
        }
            
        case 4:
        {
            // canceled
            if(delegate && [self.delegate respondsToSelector:@selector(handleError:fromRequest:)])
            {
                //send the delegate function with the amount entered by the user
                [delegate handleError:error fromRequest:self];
            }
            break;
        }
        case 5:
        {
            // bad request
            if(delegate && [self.delegate respondsToSelector:@selector(handleError:fromRequest:)])
            {
                //send the delegate function with the amount entered by the user
                [delegate handleError:error fromRequest:self];
            }
            break;
        }
        default:
            break;
    }
}

@end
