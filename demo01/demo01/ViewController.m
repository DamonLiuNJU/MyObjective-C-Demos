//
//  ViewController.m
//  demo01
//
//  Created by DamonLiu on 15/7/16.
//  Copyright (c) 2015年 DamonLiu. All rights reserved.
//

#import "ViewController.h"
#import "PictureViewController.h"
//#import "OpenUDID.h"
//#import "Fc"
#import "DLKeyChain.h"
static int LIMIT = 4; //if limit is n , then the actually input times are n+1.

@interface ViewController ()<UIAlertViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextView *textArea;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)buttonPressed:(id)sender;

@end

@implementation ViewController
{
    int counter;
//    CGRect original_frame;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configTextArea];
    [self configImageView];
    [self configTextFiled];
    [self configButton];
    [self configLabel];
    counter = 0;
    
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.textField resignFirstResponder];
}

-(void)configLabel
{
    
}

-(void)configButton
{
//    [self.button setBackgroundColor:[UIColor greenColor]];
//    [self.button.layer setBorderWidth:1.0];
//    [self.button.layer setCornerRadius:5.0];

}
-(void)configTextFiled
{
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.textField setDelegate:self];
}
-(void)configImageView
{
//    [self.imageView setImage:[UIImage imageNamed:@"laptop"]];
//    [self.imageView setHidden:YES];
}
- (IBAction)touchBackground:(id)sender {
    [self.textField resignFirstResponder];
}

-(void)configTextArea
{
    [self.textArea setText:@""];
//    [self.textArea setBackgroundColor:[UIColor lightGrayColor]];
    [self.textArea setEditable:false];
//    NSString* temp = [fcuuid value];
    NSString* temp;
    
    [self.textArea setText:[NSString stringWithFormat:@"%@",temp]];
    if([DLKeyChain load]==nil){
        [DLKeyChain save:temp];
    }else{
        NSLog(@"UUID exist");
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)endEditing:(id)sender {
    [self buttonPressed:nil];
    [self.textField resignFirstResponder];
}

- (IBAction)buttonPressed:(id)sender
{
    if(counter >= LIMIT){
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"FBI Warning" message:@"You have input 5 times" delegate:self cancelButtonTitle:@"Clear record" otherButtonTitles:@"I just wanna continue!", nil];
        [alert show];
    }else{
        NSString* text = self.textField.text;
        [self.textArea setText: text];
        if([text isEqual:@""]){
            //pass
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:1.0];
            [self.imageView setHidden:YES];
            [UIView commitAnimations];
        }else{
            [self.imageView setHidden:NO];
            counter++;
        }
        
    }
}
#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            //clear record
            counter = 0 ;
            break;
        case 1:
            //do nothing
            break;
            
        default:
            break;
    }
}

#pragma mark - TextFieldDelegate
CGFloat duration = 0.5;

#pragma mark - KeyboardWatch
//当键盘出现或改变时调用
- (void)keyboardWillShow:(NSNotification *)notification
{
    //获取键盘的高度
    NSDictionary *userInfo = [notification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    
    CGRect currentFrame = self.view.frame;
//    if(original_frame){
//        original_frame = currentFrame;
//    }
    
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationDuration:duration];
    CGRect deviceBoudns = [UIScreen mainScreen].bounds;
    currentFrame.origin.y = deviceBoudns.origin.y - height;
    self.view.frame = currentFrame;
    [UIView commitAnimations];

    
    
//    [UIView animateWithDuration:0.5 // 动画时长
//                          delay:0.0 // 动画延迟
//         usingSpringWithDamping:0.7 // 类似弹簧振动效果 0~1
//          initialSpringVelocity:1.0 // 初始速度
//                        options:UIViewAnimationOptionCurveEaseInOut // 动画过渡效果
//                     animations:^{
//                         CGRect currentFrame = self.view.frame;
//                         currentFrame.origin.y = original_frame.origin.y -height ;
//                         self.view.frame = currentFrame;
//                     } completion:^(BOOL finished) {
//                         // 动画完成后执行
//                         // code...
////                         [_imageView setAlpha:1];
//                     }];
}
- (IBAction)nextPageButtonPressed:(id)sender {
    PictureViewController* pvc = [[PictureViewController alloc] init];;
//    UIViewController* topVC = [self.navigationController topViewController];
    UINavigationController* nav = self.navigationController;
    if(nav==nil){
        nav = [[UINavigationController alloc]initWithRootViewController:self];
    }
    [nav pushViewController:pvc animated:YES];
//    [nav popToViewController:pvc   animated:YES];
//    pvc.navigationController = nav;
//    self.navigationItem.leftBarButtonItem = item;


}
//-(void)backTo{
//    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
//}


//当键退出时调用
- (void)keyboardWillHide:(NSNotification *)notification
{
    //获取键盘的高度
//    NSDictionary *userInfo = [notification userInfo];
//    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
//    CGRect keyboardRect = [aValue CGRectValue];
//    int height = keyboardRect.size.height;
    
//    CGRect currentFrame = self.view.frame;
//    currentFrame.origin.y = currentFrame.origin.y + height ;
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationDuration:duration];
    self.view.frame = [UIScreen mainScreen].bounds;
    [UIView commitAnimations];
}


@end
