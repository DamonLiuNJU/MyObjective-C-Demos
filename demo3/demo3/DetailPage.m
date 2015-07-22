//
//  DetailPage.m
//  demo3
//
//  Created by DamonLiu on 15/7/17.
//  Copyright (c) 2015年 DamonLiu. All rights reserved.
//

#import "DetailPage.h"

@interface DetailPage ()
@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation DetailPage

-(id)init{
    if(self = [super init]){
        [self.view setBackgroundColor:[UIColor whiteColor]];
        if(self.label == nil) {
            self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 300, 320, 100)];
            [self.view addSubview:self.label];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setText:(NSString *)text{
    [self.label setText:text];
}


@end
