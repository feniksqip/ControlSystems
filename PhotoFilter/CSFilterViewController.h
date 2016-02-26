//
//  CSFilterViewController.h
//  PhotoFilter
//
//  Created by Andrey on 23.02.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSFilterViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *beforeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *afterImageView;

@property (strong, nonatomic) UIImage *beforeImage;
@property (strong, nonatomic) UIImage *afterImage;
@property (strong, nonatomic) NSData *imageData;


- (IBAction)saveNewImageAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *applyFilterButton;
- (IBAction)applyFilterAction:(id)sender;
- (IBAction)chooseImageAction:(id)sender;
@end

