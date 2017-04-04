//
//  LikeViewController.h
//  BaseProject
//
//  Created by Mobiloitte on 24/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol sendInformation <NSObject>
-(void)sendData:(NSMutableArray*)array;
@end
@interface LikeViewController : UIViewController
@property(nonatomic,assign)id delegate;
@end
