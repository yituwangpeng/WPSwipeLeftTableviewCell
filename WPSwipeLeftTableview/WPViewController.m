//
//  WPViewController.m
//  WPSwipeLeftTableview
//
//  Created by 王鹏 on 15/10/9.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "WPViewController.h"

#import "WPTextCell.h"


@interface WPViewController ()

@property (assign, nonatomic) NSInteger rowsCount;

@end


@implementation WPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.tableView.frame = CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height - 200);
    self.title = @"WPContextMenuTableViewController";
    self.rowsCount = 20;
//    self.tableView.allowsSelection = NO;
}

#pragma mark - Private

- (void)setRowsCount:(NSInteger)rowsCount
{
    if (rowsCount < 0) {
        _rowsCount = 0;
    } else {
        _rowsCount = rowsCount;
    }
}

#pragma mark * Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rowsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    WPTextCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[WPTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.moreEditable = NO;
        cell.deleteEditable = YES;
    }
    
    cell.customTextLable.text = @"hhahhahahahhaha";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95.;
}

#pragma mark * WPContextMenuCell delegate

- (void)contextMenuCellDidSelectDeleteOption:(WPContextMenuCell *)cell
{
    [super contextMenuCellDidSelectDeleteOption:cell];
    self.rowsCount -= 1;
    [self.tableView deleteRowsAtIndexPaths:@[[self.tableView indexPathForCell:cell]] withRowAnimation:UITableViewRowAnimationAutomatic];

}

- (void)contextMenuCellDidSelectMoreOption:(WPContextMenuCell *)cell
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:nil
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Reply", @"Forward", @"Flag", @"Mark as Unread", @"Move to Junk", @"Move Message...",  nil];
    [actionSheet showInView:self.view];
}

@end
