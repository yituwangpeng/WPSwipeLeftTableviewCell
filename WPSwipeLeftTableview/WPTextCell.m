//
//  WPTextCell.m
//  WPSwipeLeftTableview
//
//  Created by 王鹏 on 15/10/9.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "WPTextCell.h"

@implementation WPTextCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        [self configSubviews];
    }
    return self;
    
}
- (void)configSubviews
{
    _customTextLable  = [[UILabel alloc] initWithFrame:CGRectZero];
    _customTextLable.backgroundColor = [UIColor clearColor];
    _customTextLable.textColor = [UIColor blackColor];
    [self.actualContentView addSubview:_customTextLable];
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _customTextLable.frame = CGRectMake(0, 0, 200, CGRectGetHeight(self.frame));
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
