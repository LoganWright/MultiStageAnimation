//
//  MSAnimation.m
//  ChatPhantom
//
//  Created by Logan Wright on 3/19/14.
//  Copyright (c) 2014 Logan Wright. All rights reserved.
//

#import "MSAnimation.h"

typedef void (^CompletionBlock)();

@interface MSAnimation ()

@property CGFloat duration;
@property int currentAnimationBlockIndex;
@property UIViewAnimationOptions options;
@property (strong, nonatomic) NSMutableArray * animationBlocks;
@property (strong, nonatomic) CompletionBlock completionBlock;

@end

@implementation MSAnimation

+ (instancetype) newAnimationWithDuration:(CGFloat)duration andOptions:(UIViewAnimationOptions)options {
    MSAnimation * newAnimation = [[self alloc] init];
    newAnimation.animationBlocks = [NSMutableArray new];
    newAnimation.duration = duration;
    newAnimation.currentAnimationBlockIndex = 0;
    newAnimation.options = options;
    return newAnimation;
}

- (void) addNewAnimationStage:(void (^)(void))animation {
    [_animationBlocks addObject:animation];
}

- (void) animateSequenceWithCompletion:(void (^)(void))completion {
    _currentAnimationBlockIndex = 0;
    _completionBlock = completion;
    [self animateThroughBlocks];
}

- (void) animateThroughBlocks {
    void (^animationBlock)(void) = _animationBlocks[_currentAnimationBlockIndex];
    [UIView animateWithDuration:_duration
                          delay:0.0
                        options:_options
                     animations:animationBlock
                     completion:^(BOOL finished) {
                         if (finished) {
                             _currentAnimationBlockIndex = _currentAnimationBlockIndex + 1;
                             if (_currentAnimationBlockIndex == _animationBlocks.count) {
                                 // completed animations!
                                 _currentAnimationBlockIndex = 0;
                                 _completionBlock();
                             }
                             else {
                                 [self animateThroughBlocks];
                             }
                         }
                     }];
}

@end
