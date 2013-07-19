//
//  DLog.h
//  demo
//
//  Created by Ramy Kfoury on 6/10/13.
//  Copyright (c) 2013 Ramy Kfoury. All rights reserved.
//

#ifndef demo_DLog_h
#define demo_DLog_h

#ifdef DEBUG
#define DLog(xx, ...) NSLog(@"%s(%d): " xx, ((strrchr(__FILE__, '/') ? : __FILE__- 1) + 1), __LINE__, ##__VA_ARGS__)
#else
#define DLog(xx, ...) ((void)0)
#endif

#define DLogRect(r) DLog(@"%s x=%f, y=%f, w=%f, h=%f", #r, r.origin.x, r.origin.y, r.size.width, r.size.height)

#endif
