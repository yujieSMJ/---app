//
//  SMJShopListCell.m
//  尚美酒
//
//  Created by Mac3 on 14-1-7.
//  Copyright (c) 2014年 zwtym. All rights reserved.
//

#import "SMJShopListCell.h"

@implementation SMJShopListCell{
    UILabel *renqi;
    UILabel *juli;
    UILabel *dizhi;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleLable = [[UILabel alloc]initWithFrame:CGRectMake(75, 12, 95, 15)];
        self.titleLable.font = [UIFont systemFontOfSize:10.0];
        self.addressLable = [[UILabel alloc]initWithFrame:CGRectMake(100, 48, 150, 15)];
        self.addressLable.font = [UIFont systemFontOfSize:10.0];
        self.distanceLable = [[UILabel alloc]initWithFrame:CGRectMake(100, 30, 100, 15)];
        self.distanceLable.font = [UIFont systemFontOfSize:10.0];
        self.logo = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 60, 65)];
        renqi = [[UILabel alloc]initWithFrame:CGRectMake(155, 12, 45, 15)];
        renqi.font = [UIFont systemFontOfSize:10.0];
        renqi.text = @"店铺人气:";
        juli = [[UILabel alloc]initWithFrame:CGRectMake(75, 30, 48, 15)];
        juli.font = [UIFont systemFontOfSize:10.0];
        juli.text = @"距离:";
        dizhi = [[UILabel alloc]initWithFrame:CGRectMake(75, 48, 48, 15)];
        dizhi.font = [UIFont systemFontOfSize:10.0];
        dizhi.text = @"地址:";
        self.shopNots = [[UILabel alloc]initWithFrame:CGRectMake(200, 12, 30, 15)];
        self.shopNots.font = [UIFont systemFontOfSize:10.0];
        //[self.contentView setFrame:CGRectMake(0, 0, 320, 54)];
        [self.contentView addSubview:renqi];
        [self.contentView addSubview:juli];
        [self.contentView addSubview:dizhi];
        [self.contentView addSubview:self.titleLable];
        [self.contentView addSubview:self.addressLable];
        [self.contentView addSubview:self.distanceLable];
        [self.contentView addSubview:self.logo];
        [self.contentView addSubview:self.shopNots];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
