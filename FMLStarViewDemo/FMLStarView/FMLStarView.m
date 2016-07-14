//
//  FMLStarView.m
//  TestDemo
//
//  Created by Felix on 16/7/14.
//  Copyright © 2016年 FelixMLians. All rights reserved.
//

#import "FMLStarView.h"

static const NSInteger kDefaultNumberOfStars = 5;
static const NSInteger kDefaultScorePercent = 1;
static NSString * const kStarImageStyleNormal = @"star_gray.png";
static NSString * const kStarImageStyleHighlight = @"star_yellow.png";

@interface FMLStarView ()

@property (nonatomic, strong) UIView *upperView;
@property (nonatomic, strong) UIView *belowView;
@property (nonatomic, assign) NSInteger numberOfStars;
@property (nonatomic, assign) BOOL isTouchable; // isTouchable: 是否可以点击

@end

@implementation FMLStarView

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame
                numberOfStars:(NSInteger)numberOfStars
                  isTouchable:(BOOL)isTouchable
                        index:(NSInteger)index {
    if (self = [super initWithFrame:frame]) {
        
        _numberOfStars = numberOfStars;
        _isTouchable = isTouchable;
        _index = index;
        _totalScore = 1;
        _currentScore = 0;
        
        [self configureUI];
        
        if (_isTouchable == YES) {
            UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
            [self addGestureRecognizer:tapGr];
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.currentScore > self.totalScore) {
        _currentScore = self.totalScore;
    }
    else if (self.currentScore < 0) {
        _currentScore = 0;
    }
    else {
        _currentScore = self.currentScore;
    }
    
    CGFloat scorePercent = self.currentScore / self.totalScore;
    if (self.isFullStarLimited == YES) {
        scorePercent = [self changeToCompleteStar:scorePercent];
    }
    
    self.upperView.frame = CGRectMake(0, 0, self.bounds.size.width * scorePercent, self.bounds.size.height);
}

#pragma mark - Event Response

- (void)tapAction:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self];
    CGFloat offset = point.x;
    CGFloat offsetPercent = offset/self.bounds.size.width;
    
    if (self.isFullStarLimited == YES) {
        offsetPercent = [self changeToCompleteStar:offsetPercent];
    }
    
    self.currentScore = offsetPercent * self.totalScore;

    if ([self.delegate respondsToSelector:@selector(fml_didClickStarViewByScore:atIndex:)]) {
        [self.delegate fml_didClickStarViewByScore:self.currentScore atIndex:self.index];
    }
}


#pragma mark - Private Methods

- (void)configureUI {
    _belowView = [self createStarViewWithImageName:kStarImageStyleNormal];
    _upperView = [self createStarViewWithImageName:kStarImageStyleHighlight];
    
    [self addSubview:_belowView];
    [self addSubview:_upperView];
}

- (UIView *)createStarViewWithImageName:(NSString *)imageName {
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.backgroundColor = [UIColor clearColor];
    view.clipsToBounds = YES;
    
    for (NSInteger i = 0; i < _numberOfStars; i++) {
        UIImageView *starImageView = [[UIImageView alloc] init];
        starImageView.image = [UIImage imageNamed:imageName];
        starImageView.frame = CGRectMake(i * self.bounds.size.width / _numberOfStars,
                                         0,
                                         self.bounds.size.width / self.numberOfStars,
                                         self.bounds.size.height);
        starImageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:starImageView];
    }
    return view;
}

- (CGFloat)changeToCompleteStar:(CGFloat)percent {
    if (percent <= 0.2) {
        percent = 0.2;
    }
    else if (percent > 0.2 && percent <= 0.4) {
        percent = 0.4;
    }
    else if (percent > 0.4 && percent <= 0.6) {
        percent = 0.6;
    }
    else if (percent > 0.6 && percent <= 0.8) {
        percent = 0.8;
    }
    else {
        percent = 1.0;
    }
    return percent;
}

#pragma mark - Accessor

- (void)setCurrentScore:(CGFloat)currentScore {
    if (_currentScore == currentScore) {
        return;
    }
    _currentScore = currentScore;
    
    [self setNeedsLayout];
}

@end
