//
//  MSAnimation.h
//  ChatPhantom
//
//  Created by Logan Wright on 3/19/14.
//  Copyright (c) 2014 Logan Wright. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSAnimation : NSObject

+ (instancetype) newAnimationWithDuration:(CGFloat)duration andOptions:(UIViewAnimationOptions)options;

- (void) addNewAnimationStage:(void (^)(void))animation;
- (void) animateSequenceWithCompletion:(void (^)(void))completion;

@end
