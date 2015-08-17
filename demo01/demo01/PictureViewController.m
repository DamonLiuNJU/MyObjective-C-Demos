//
//  PictureViewController.m
//  demo1
//
//  Created by DamonLiu on 15/7/24.
//  Copyright (c) 2015年 DamonLiu. All rights reserved.
//

#import "PictureViewController.h"
#import "DLKeyChain.h"
@interface PictureViewController ()
@property (weak, nonatomic) IBOutlet UILabel *uuidlabel;

@end

@implementation PictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINavigationController* nav = self.navigationController;
    if(nav == nil){
        nav = [UINavigationController new];
    }
    [nav setNavigationBarHidden:false animated:YES];
    nav.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(backTo)];
    [self.uuidlabel setText:[DLKeyChain load]];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    
}
-(void)backTo{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
