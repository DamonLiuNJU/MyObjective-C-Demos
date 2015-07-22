//
//  DatePickPage.m
//  demo4
//
//  Created by DamonLiu on 15/7/17.
//  Copyright (c) 2015年 DamonLiu. All rights reserved.
//

#import "DatePickPage.h"

@interface DatePickPage ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIDatePicker *picker;
@end

@implementation DatePickPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

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
- (IBAction)valueChanged:(id)sender {
    [self.label setText:[NSString stringWithFormat:@"%@",self.picker.date]];
}
- (IBAction)endEditing:(id)sender {
    [self.label setText:[NSString stringWithFormat:@"%@",self.picker.date]];
}

@end
