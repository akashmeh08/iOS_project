//
//  UIViewController+Addition.h
//  ProjectTemplate
//
//  Created by Raj Kumar Sharma on 19/05/16.
//  Copyright © 2016 Mobiloitte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Addition)

- (void)moveUIComponentWithValue:(CGFloat)value forLayoutConstraint:(NSLayoutConstraint *)layoutConstraint forDuration:(CGFloat)duration;
- (UIToolbar *)getToolBarForNumberPad;

@end
