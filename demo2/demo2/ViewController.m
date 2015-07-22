//
//  ViewController.m
//  demo2
//
//  Created by DamonLiu on 15/7/17.
//  Copyright (c) 2015年 DamonLiu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;
//@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextView *textArea;

@property (weak, nonatomic) IBOutlet UIView *topStillView;

@end

static float BORDER_WIDTH = 1.0;
static float CORNER_RADIUS = 6;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.topStillView setBackgroundColor:[UIColor orangeColor]];
    [self.topStillView setAlpha:0];
    [self.topStillView.layer setCornerRadius:CORNER_RADIUS];
    [self.topStillView.layer setBorderWidth:BORDER_WIDTH];
    
    [self.label.layer setBorderWidth:BORDER_WIDTH];
    [self.label.layer setCornerRadius:CORNER_RADIUS];
    [self.textArea setText:@"问题是这样的，有一个UIViewController中有两个层次：底层为一个图层，需要响应触摸事件，暂称为底图；该层之上是一个自定义的UIView，内容为不透明的半圆，其余部分是透明的，作为导航使用，暂称为导航。现在问题是，导航中透明的部分遮挡住了底图，导致这个部分的底图能看到，但是无法响应触摸事件.求教各位大神，有解决办法吗？"];
    [self.textArea sizeToFit];
    [self.textArea setEditable:false ];
//    [self.textArea setSelectable:false];
    
    [self.scrollView setContentSize:CGSizeMake(320, 450*3)];
    [self.scrollView setDelegate:self];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.view bringSubviewToFront:self.topStillView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ScrollViewDelegate
//-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    float height = scrollView.contentOffset.y;
//    float total_height = scrollView.contentSize.height;
//    float result = 1.0f - height/total_height;
//    [self.topStillView setAlpha:result];
//}
//
//-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    float height = scrollView.contentOffset.y;
//    float total_height = scrollView.contentSize.height;
//    float result = 1.0f - height/total_height;
//    [self.topStillView setAlpha:result];
//}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    float height = scrollView.contentOffset.y;
    float total_height = scrollView.contentSize.height;
    float result = height/total_height*2;
    [self.topStillView setAlpha:result];

}

@end
