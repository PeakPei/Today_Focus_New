//
//  Chat_pic_TableViewCell.h
//  Today_Focus_New
//
//  Created by Derek on 2017/4/27.
//  Copyright © 2017年 Derek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Chat_pic_TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *pic_title;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll_image;
@property (weak, nonatomic) IBOutlet UILabel *pic_short_title;

@end
