//
//  AddFeedViewController.h
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RefreshHomeData <NSObject>
-(void)RefreshData;
@end
@interface AddFeedViewController : UIViewController
@property(nonatomic ,assign) id<RefreshHomeData> delegate;
@end
