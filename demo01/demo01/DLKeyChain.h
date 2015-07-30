//
//  DLKeyChain.h
//  demo1
//
//  Created by DamonLiu on 15/7/28.
//  Copyright (c) 2015年 DamonLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLKeyChain : NSObject
+(void)save:(NSString*)UUID;
+(NSString*)load;
@end
