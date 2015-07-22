//
//  ViewController.m
//  demo7
//
//  Created by DamonLiu on 15/7/20.
//  Copyright (c) 2015年 DamonLiu. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"
@interface ViewController () <BViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong,nonatomic) NSString* valueFromPageB;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if([self valueFromPageB]){
        [[self label] setText:[self valueFromPageB]];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //将page2设定成Storyboard Segue的目标UIViewController
    
    id page2 = segue.destinationViewController;
    
    //将值透过Storyboard Segue带给页面2的string变数
    
//    [page2 setValue:text Field1.textforKey:@"exchangeString"];
    
    //将delegate设成自己（指定自己为代理）
    
    [page2 setValue:self forKey:@"delegate"];
    
}

#pragma mark BPageDelegate
-(void)passValue:(NSString *)value{
    [[self label] setText:value];
}

@end
