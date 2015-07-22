//
//  BViewController.m
//  demo7
//
//  Created by DamonLiu on 15/7/20.
//  Copyright (c) 2015年 DamonLiu. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) id delegate;   //记得@synthesize
@end

@implementation BViewController{
    UIGestureRecognizer* tap ;
}
@synthesize delegate;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.userInteractionEnabled = YES;
}
-(void)viewWillAppear:(BOOL)animated{
    tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [delegate passValue:self.textField.text];
    [self.view removeGestureRecognizer:tap];
}

-(void)dismiss{
    NSLog(@"dismiss keyboard");
    [self.textField resignFirstResponder];
}

-(void)dealloc{
   
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}


@end
