//
//  MyAlertView.m
//  demo3
//
//  Created by DamonLiu on 15/7/17.
//  Copyright (c) 2015年 DamonLiu. All rights reserved.
//

#import "MyAlertView.h"

@implementation MyAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...{
    if(self = [super initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil])
    {
//        _textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
//        [self addSubview:_textField];
    }
    
    return self;
}

@end
