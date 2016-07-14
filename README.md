# FMLStarView
🔥 FMLStarView a simple view of star review 一个简单的星级评价的控件

![FMLStarView](https://github.com/FelixMLians/FMLStarView/blob/master/Snapshot/review.png)


## Introduction

This is a simple view of star review.

If you feel good, please give me a star, thank you very much! ⭐️

## Installation

#### Non-CocoaPods Installation

Just drag the FMLStarView folder into your project.And change the star images as you like;

## Usage

* Use by including the following import:

````

#import "FMLStarView.h"


_starView = [[FMLStarView alloc] initWithFrame:CGRectMake(0, 0, 150, 25)
                                                   numberOfStars:numberOfStars
                                                      isTouchable:YES index:index];
        _starView.currentScore = currentScore;
        _starView.totalScore = totalScore;
        _starView.delegate = controller;
        [self addSubview:_starView];
        
````

* Delegate (`@optional`):

````
#pragma mark - FMLStarViewDelegate

- (void)fml_didClickStarViewByScore:(CGFloat)score atIndex:(NSInteger)index {
    NSLog(@"score: %f  index：%zd", score, index);
}


````


## Support
* If you have any questions, please commit a issure! Thx!
* Email: felixmorgan109@gmail.com 
* Weibo: http://www.weibo.com/felixmorgan/
* Twitter: https://twitter.com/FelixMLians
* Facebook: https://www.facebook.com/felixmorgan109

### License
[MIT License](http://opensource.org/licenses/MIT)
