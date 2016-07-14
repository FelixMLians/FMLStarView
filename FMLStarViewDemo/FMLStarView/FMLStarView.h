//
//  FMLStarView.h
//  TestDemo
//
//  Created by Felix on 16/7/14.
//  Copyright © 2016年 FelixMLians. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FMLStarViewDelegate <NSObject>

- (void)fml_didClickStarViewByScore:(CGFloat)score atIndex:(NSInteger)index;

@end

@interface FMLStarView : UIView

@property (nonatomic, assign) NSInteger index; // 视图的标记
@property (nonatomic, assign) CGFloat totalScore; // 评分的总分值，默认为1
@property (nonatomic, assign) CGFloat currentScore; // 评分的当前分数，默认为0
@property (nonatomic, assign) BOOL isFullStarLimited; // 是否限制只能有整颗星，默认为YES
@property (nonatomic, weak) id <FMLStarViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame
                numberOfStars:(NSInteger)numberOfStars
                  isTouchable:(BOOL)isTouchable
                        index:(NSInteger)index;

@end
