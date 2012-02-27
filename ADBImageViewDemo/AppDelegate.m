//
//  AppDelegate.m
//  ADBImageView
//
//  Created by Alberto De Bortoli on 26/02/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self.window makeKeyAndVisible];

    //added button to reload image
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button.frame = CGRectMake(10.0, 360.0, 300.0, 35.0);
    [_button setTitle:@"Reload" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:_button];
    
    [ADBImageView setCachingTime:30];
    
    _imageURLs = [NSArray arrayWithObjects:
                  @"http://www.albertodebortoli.it/GitHub/ADBImageView/H-Farm.jpg",
                  @"http://www.albertodebortoli.it/GitHub/ADBImageView/H-umus.jpg",
                  @"http://www.albertodebortoli.it/GitHub/ADBImageView/Jessica.jpeg",
                  @"http://www.albertodebortoli.it/GitHub/ADBImageView/Qwoote.png", nil];
    
    _imageView = [[ADBImageView alloc] initWithFrame:CGRectMake(10.0, 30.0, 300.0, 300.0)];
    _imageView.caching = YES;
    _imageView.delegate = self;
    
    [_imageView setImageWithURL:[NSURL URLWithString:[_imageURLs objectAtIndex:0]]
           placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    [self.window addSubview:_imageView];
    
    return YES;
}

#pragma mark - Actions

- (void)buttonTapped:(UIButton *)sender
{   
    NSLog(@"%f", _imageView.cacheTime);
    [_imageView reloadWithUrl:[NSURL URLWithString:[_imageURLs objectAtIndex:arc4random() % [_imageURLs count]]]];
}

#pragma mark - ADBImageViewDelegate

- (void)ADBImageView:(ADBImageView *)view willUpdateImage:(UIImage *)image
{    
    NSLog(@"Image is about to be updated");
    view.alpha = 0.0;
    [UIView animateWithDuration:0.7 animations:^{ view.alpha = 1.0; }];
}

- (void)ADBImageView:(ADBImageView *)view didLoadImage:(UIImage *)image
{
    NSLog(@"Image loaded");
}

- (void)ADBImageView:(ADBImageView *)view failedLoadingWithError:(NSError *)error
{
    NSLog(@"Image failed loading: %@", [error localizedDescription]);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:@"Error Loading URL"
                                                   delegate:nil
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)ADBImageViewDidSingleTap:(ADBImageView *)view
{
    NSLog(@"Single tap on image with tag %i", view.tag);
}

- (void)ADBImageViewDidLongPress:(ADBImageView *)view
{
    NSLog(@"Long press on image with tag %i", view.tag);
}

@end
