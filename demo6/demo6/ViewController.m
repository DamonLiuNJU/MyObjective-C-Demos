//
//  ViewController.m
//  demo6
//
//  Created by DamonLiu on 15/7/17.
//  Copyright (c) 2015年 DamonLiu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cube;

@end

static int angle = 0;
static float delta = 90;
static float DURATION = 0.3;


@implementation ViewController
static CGRect FRAME;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    FRAME = self.cube.frame;
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tapGestureTel = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(rotateCube)];
    [self.cube addGestureRecognizer:tapGestureTel];
    [self.view addGestureRecognizer:tapGestureTel];
    [self.cube setText:@"点我"];
    
    
    UISwipeGestureRecognizer* SwipeGuesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(moveCubeUp:)];
    [SwipeGuesture setDirection:UISwipeGestureRecognizerDirectionUp];
//    [self.view addGestureRecognizer:SwipeGuesture];
    [self.cube addGestureRecognizer:SwipeGuesture];
    
    
    SwipeGuesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [SwipeGuesture setDirection:(UISwipeGestureRecognizerDirectionUp)];
    [[self view] addGestureRecognizer:SwipeGuesture];
    
    SwipeGuesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self  action:@selector(handleSwipeFrom:)];
    [SwipeGuesture setDirection:UISwipeGestureRecognizerDirectionDown];
    [[self view] addGestureRecognizer:SwipeGuesture];
}


-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionDown) {
        
        NSLog(@"swipe down");
        [self moveCubeDown];
        //执行程序
    }
    if(recognizer.direction==UISwipeGestureRecognizerDirectionUp) {
        
        NSLog(@"swipe up");
        //执行程序
        [self moveCubeUp:nil];
    }
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionLeft) {
        
        NSLog(@"swipe left");
        //执行程序
    }
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionRight) {
        
        NSLog(@"swipe right");
        //执行程序
    }
    
}

-(void)rotateCube{
    [UIView beginAnimations:nil context:nil];
    //设定动画持续时间
    [UIView setAnimationDuration:DURATION];
    angle += delta;
    self.cube.transform = CGAffineTransformMakeRotation(angle);
    self.cube.transform = CGAffineTransformMakeRotation(angle);
    [UIView commitAnimations];
}

-(void)resetCube{
    [self.cube setFrame:FRAME];
}

-(void)moveCubeDown{
    [self resetCube];
    [UIView beginAnimations:nil context:nil];
    //设定动画持续时间
    [UIView setAnimationDuration:DURATION];
    
    CGRect oldframe = self.cube.frame;
    oldframe.origin.y += 100;
    [self.cube setFrame:oldframe];
    
    [UIView commitAnimations];
    
}

-(void)moveCubeUp:(UISwipeGestureRecognizer*)Swipe{
    [self resetCube];
    [UIView beginAnimations:nil context:nil];
    //设定动画持续时间
    [UIView setAnimationDuration:DURATION];
    
    CGRect oldframe = self.cube.frame;
    oldframe.origin.y -= 100;
    [self.cube setFrame:oldframe];
    
    [UIView commitAnimations];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
