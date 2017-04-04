//
//  SFCenterButton.m
//  SpotFoto
//
//  Created by Sunil Verma on 06/01/17.
//  Copyright © 2017 Sunil Verma. All rights reserved.
//

#import "SFCenterButton.h"

@implementation SFCenterButton

-(void)awakeFromNib{
    [super awakeFromNib];
    
    CGFloat spacing = 1.0f;
    
    // lower the text and push it left so it appears centered
    //  below the image
    CGSize imageSize = self.imageView.frame.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + spacing), 0.0);
    
    // raise the image and push it right so it appears centered
    //  above the text
    CGSize titleSize = self.titleLabel.frame.size;
    self.imageEdgeInsets = UIEdgeInsetsMake( - (titleSize.height + spacing), 0.0, 0.0, - titleSize.width);
}

@end
