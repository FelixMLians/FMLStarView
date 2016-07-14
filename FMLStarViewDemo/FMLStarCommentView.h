//
//  FMLStarCommentView.h
//  TestDemo
//
//  Created by Felix on 16/7/14.
//  Copyright © 2016年 FelixMLians. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMLStarView.h"

@interface FMLStarCommentView : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) FMLStarView *starView;

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                numberOfStars:(NSInteger)numberOfStars
                  isTouchable:(BOOL)isTouchable
                 currentScore:(NSInteger)currentScore
                   totalScore:(NSInteger)totalScore
            isFullStarLimited:(BOOL)isFullStarLimited
                        index:(NSInteger)index
                     delegate:(id)controller;

@end
