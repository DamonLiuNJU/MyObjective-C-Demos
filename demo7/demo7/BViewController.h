//
//  BViewController.h
//  demo7
//
//  Created by DamonLiu on 15/7/20.
//  Copyright (c) 2015年 DamonLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BViewController : UIViewController

@end

@protocol BViewControllerDelegate <NSObject>

-(void)passValue:(NSString*)value;

@end
