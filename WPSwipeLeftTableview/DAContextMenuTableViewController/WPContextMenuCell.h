//
//  WPContextMenuCell.h
//  WPSwipeLeftTableview
//
//  Created by 王鹏 on 15/10/9.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>


@class WPContextMenuCell;

@protocol WPContextMenuCellDelegate <NSObject>

- (void)contextMenuCellDidSelectMoreOption:(WPContextMenuCell *)cell;
- (void)contextMenuDidHideInCell:(WPContextMenuCell *)cell;
- (void)contextMenuDidShowInCell:(WPContextMenuCell *)cell;
- (void)contextMenuWillHideInCell:(WPContextMenuCell *)cell;
- (void)contextMenuWillShowInCell:(WPContextMenuCell *)cell;
- (BOOL)shouldShowMenuOptionsViewInCell:(WPContextMenuCell *)cell;
@optional
- (void)contextMenuCellDidSelectDeleteOption:(WPContextMenuCell *)cell;

@end


@interface WPContextMenuCell : UITableViewCell

@property (strong, nonatomic) UIView *actualContentView;

@property (readonly, assign, nonatomic, getter = isContextMenuHidden) BOOL contextMenuHidden;
@property (strong, nonatomic) NSString *deleteButtonTitle;
@property (strong, nonatomic) NSString *moreOptionsButtonTitle;
@property (assign, nonatomic) BOOL editable;
@property (assign, nonatomic) BOOL moreEditable;
@property (assign, nonatomic) BOOL deleteEditable;
@property (assign, nonatomic) CGFloat menuOptionButtonTitlePadding;
@property (assign, nonatomic) CGFloat menuOptionsAnimationDuration;
@property (assign, nonatomic) CGFloat bounceValue;


@property (weak, nonatomic) id<WPContextMenuCellDelegate> delegate;

- (CGFloat)contextMenuWidth;
- (void)setMenuOptionsViewHidden:(BOOL)hidden animated:(BOOL)animated completionHandler:(void (^)(void))completionHandler;

@end
