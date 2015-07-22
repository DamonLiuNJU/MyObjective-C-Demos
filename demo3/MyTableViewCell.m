//
//  MyTableViewCell.m
//  demo3
//
//  Created by DamonLiu on 15/7/17.
//  Copyright (c) 2015年 DamonLiu. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell


-(id)initWithTitle:(NSString *)title{
    if(self = [super init]){
        [self.textLabel setText:title];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    if(selected){
        [self.contentView setBackgroundColor:[UIColor redColor]];
    }else{
        [self setBackgroundColor:[UIColor greenColor]];
    }
}





@end
