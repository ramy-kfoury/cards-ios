//
//  NSString+HTML.m
//  demo
//
//  Created by Ramy Kfoury on 6/11/13.
//  Copyright (c) 2013 Ramy Kfoury. All rights reserved.
//

#import "NSString+HTML.h"

@implementation NSString (HTML)

-(NSString *) stringByStrippingHTML {
    NSRange r;
    NSString *s = [[self copy] autorelease];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}

@end
