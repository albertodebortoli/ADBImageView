//
//  AppDelegate.h
//  ADBImageView
//
//  Created by Alberto De Bortoli on 26/02/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADBImageView.h"


@interface AppDelegate : NSObject <UIApplicationDelegate, ADBImageViewDelegate> {
    
    ADBImageView    *_imageView;
    UIButton        *_button;
    NSArray         *_imageURLs;
}

@property(nonatomic, strong) IBOutlet UIWindow *window;

- (void)buttonTapped:(UIButton *)sender;

@end
