//
//  ViewController.m
//  demo8
//
//  Created by DamonLiu on 15/7/20.
//  Copyright (c) 2015年 DamonLiu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *changeColorButton;
@property (strong, nonatomic) IBOutlet UIView *bgView;
@property (strong, nonatomic) UIColor* bgColor;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addObserver:self forKeyPath:@"bgColor" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeColorButtonPressed:(id)sender {
    UIColor* randomColor = [ViewController randomColor];
//    _bgColor = randomColor;
    [self setValue:randomColor forKey:@"bgColor"];
    [self.bgView setBackgroundColor:randomColor];
}

+(UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];

}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"Color Changed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
@end
