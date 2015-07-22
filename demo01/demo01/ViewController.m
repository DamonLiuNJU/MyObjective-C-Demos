//
//  ViewController.m
//  demo01
//
//  Created by DamonLiu on 15/7/16.
//  Copyright (c) 2015年 DamonLiu. All rights reserved.
//

#import "ViewController.h"

static int LIMIT = 4;

@interface ViewController ()<UIAlertViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) IBOutlet UITextView *textArea;
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)buttonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController
{
    int counter;
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
    
}

-(void)configLabel
{
    
}

-(void)configButton
{
//    [self.button setBackgroundColor:[UIColor greenColor]];
    [self.button.layer setBorderWidth:1.0];
    [self.button.layer setCornerRadius:5.0];

}
-(void)configTextFiled
{
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.textField setDelegate:self];
}
-(void)configImageView
{
//    [self.imageView setImage:[UIImage imageNamed:@"laptop"]];
    [self.imageView setHidden:YES];
}
- (IBAction)touchBackground:(id)sender {
    [self.textField resignFirstResponder];
}

-(void)configTextArea
{
    [self.textArea setText:@""];
//    [self.textArea setBackgroundColor:[UIColor lightGrayColor]];
    [self.textArea setEditable:false];
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
            [self.imageView setHidden:YES];
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



@end
