//
//  MyTableTableViewController.m
//  demo3
//
//  Created by DamonLiu on 15/7/17.
//  Copyright (c) 2015年 DamonLiu. All rights reserved.
//

#import "MyTableTableViewController.h"
#import "DetailPage.h"
#import "MyTableViewCell.h"
#import "MyAlertView.h"
@interface MyTableTableViewController ()<UIAlertViewDelegate>

@end
static NSString* last_input;
static NSString* identifier;
@implementation MyTableTableViewController
{
    NSArray* dataSource;
    MyTableViewCell* lastSelected;
    IBOutlet UITableView *mytableview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    identifier = @"id";
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:identifier];
    NSMutableArray* temp = [NSMutableArray array];
    for (int i = 0 ; i < 25; i++) {
        [temp addObject:[NSString stringWithFormat:@"我是第%d行",i+1]];
    }
    dataSource = [NSArray arrayWithArray:temp];
    
    
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        CGRect rect = mytableview.frame;
        rect.origin.y += 100;
        [mytableview setFrame:rect];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    if(lastSelected!=nil){
//        [lastSelected setBackgroundColor:[UIColor redColor]];
        [lastSelected setSelected:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if(cell == nil){
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell = [[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [dataSource objectAtIndex:indexPath.row];
    
    return cell;
}

- (IBAction)addLineButtonPressed:(id)sender {
    MyAlertView* alertView = [[MyAlertView alloc]initWithTitle:@"waiting input" message:@"input the content" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil] ;
    [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];

    [alertView show];
}

#pragma mark - UIAlertVIewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            //
            break;
        case 1:
        {
            NSString* string = [alertView textFieldAtIndex:0].text;
            [self addNewLine:string];
            break;
        }
        default:
            break;
    }
}


-(void)addNewLine:(NSString*)content{
    last_input = content;
    NSMutableArray* temp = [NSMutableArray arrayWithArray:dataSource ];
    [temp addObject:content];
    dataSource = [NSArray arrayWithArray:temp];
    [self.tableView reloadData];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UINavigationController* nav = self.navigationController;
    if(nav == nil){
        
    }
    
    DetailPage* controller = [[DetailPage alloc]init];
    NSString* text = [dataSource objectAtIndex:indexPath.row];
    [controller setText:text];
    [nav pushViewController:controller animated:YES];
    MyTableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    lastSelected = cell;
//    [cell setBackgroundColor:[UIColor redColor]];

}

//
//
//// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.tableView beginUpdates];
        NSMutableArray* temp = [NSMutableArray arrayWithArray:dataSource];
        [temp removeObjectAtIndex:indexPath.row];
        dataSource = [NSArray arrayWithArray:temp];

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
        [self.tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        [tableView reloadData];
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}



@end
