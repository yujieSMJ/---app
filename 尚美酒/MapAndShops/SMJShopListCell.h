//
//  SMJShopListCell.h
//  尚美酒
//
//  Created by Mac3 on 14-1-7.
//  Copyright (c) 2014年 zwtym. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMJShopListCell : UITableViewCell

@property (nonatomic,strong) UIImageView * logo;
@property (nonatomic,strong) UILabel * titleLable;
@property (nonatomic,strong) UILabel * shopNots;
@property (nonatomic,strong) UILabel * distanceLable;
@property (nonatomic,strong) UILabel * addressLable;
@property (nonatomic,strong) UIButton * shopButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
