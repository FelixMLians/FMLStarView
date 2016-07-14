//
//  ViewController.m
//  FMLStarViewDemo
//
//  Created by Felix on 16/7/14.
//  Copyright © 2016年 FML. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "FMLStarCommentView.h"

static const CGFloat kReviewTextViewHeight = 140.0;
static NSString * const kTextViewPlaceHolder = @"说几句吧";

@interface ViewController ()<UITextViewDelegate, FMLStarViewDelegate>

@property (nonatomic, strong) UITextView *reviewTextView;
@property (nonatomic, strong) UIButton *confirmButton;

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configure];
}

#pragma mark - FMLStarViewDelegate

- (void)fml_didClickStarViewByScore:(CGFloat)score atIndex:(NSInteger)index {
    NSLog(@"score: %f  index：%zd", score, index);
}

#pragma mark - Private Methods

- (void)configure {
    self.navigationItem.title = @"评价";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.reviewTextView];
    [self.view addSubview:self.confirmButton];
    
    [self.reviewTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(30);
        make.left.mas_equalTo(self.view).offset(20);
        make.right.mas_equalTo(self.view).offset(-20);
        make.height.mas_equalTo(kReviewTextViewHeight);
    }];
    
    [self setupStarCommentViews];
}

- (void)setupStarCommentViews {
    FMLStarCommentView *commentView1 = [[FMLStarCommentView alloc] initWithFrame:CGRectZero
                                                                           title:@"服务质量"
                                                                   numberOfStars:5
                                                                     isTouchable:YES
                                                                    currentScore:2
                                                                      totalScore:5
                                                               isFullStarLimited:YES
                                                                           index:100
                                                                        delegate:self];
    
    [self.view addSubview:commentView1];
    
    [commentView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.reviewTextView.mas_bottom).offset(30);
        make.left.mas_equalTo(self.view).offset(20);
        make.right.mas_equalTo(self.view).offset(-20);
    }];
    
    FMLStarCommentView *commentView2 = [[FMLStarCommentView alloc] initWithFrame:CGRectZero
                                                                           title:@"服务态度"
                                                                   numberOfStars:5
                                                                     isTouchable:YES
                                                                    currentScore:2
                                                                      totalScore:5
                                                               isFullStarLimited:NO
                                                                           index:101
                                                                        delegate:self];
    
    [self.view addSubview:commentView2];
    
    [commentView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(commentView1.mas_bottom).offset(20);
        make.left.mas_equalTo(self.view).offset(20);
        make.right.mas_equalTo(self.view).offset(-20);
    }];
    
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(commentView2.mas_bottom).offset(50);
        make.left.mas_equalTo(self.view).offset(20);
        make.right.mas_equalTo(self.view).offset(-20);
    }];
}

#pragma mark - Accessor

- (UITextView *)reviewTextView {
    if (!_reviewTextView) {
        _reviewTextView = [[UITextView alloc] init];
        _reviewTextView.font = [UIFont systemFontOfSize:15.0];
        _reviewTextView.editable = YES;
        _reviewTextView.selectable = YES;
        _reviewTextView.dataDetectorTypes = UIDataDetectorTypePhoneNumber | UIDataDetectorTypeLink;
        _reviewTextView.textColor = [UIColor darkGrayColor];
        _reviewTextView.text = kTextViewPlaceHolder;
        _reviewTextView.delegate = self;
        _reviewTextView.layer.cornerRadius = 6.0;
        _reviewTextView.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
        _reviewTextView.layer.borderWidth = 1 / ([UIScreen mainScreen].scale);
    }
    return _reviewTextView;
}

- (UIButton *)confirmButton {
    if (!_confirmButton) {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmButton.titleLabel.font = [UIFont systemFontOfSize:22.0];
        [_confirmButton setTitle:@"提   交" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:[UIColor whiteColor]
                             forState:UIControlStateNormal];
        [_confirmButton setBackgroundColor:[UIColor orangeColor]];
        _confirmButton.layer.cornerRadius = 6.0;
    }
    return _confirmButton;
}
@end
