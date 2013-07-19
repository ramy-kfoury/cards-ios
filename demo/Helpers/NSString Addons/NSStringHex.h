//
//  NSStringHex.h
//  Framework
//
//  Created by foo foo on 12/19/11.
//  Copyright (c) 2011 FOO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Hex)

+(NSString *)stringFromHex:(NSString *)str;
+(NSString *)stringToHex:(NSString *)str;
+(NSMutableString *)arabicStringToHex:(NSString *)str;

@end
