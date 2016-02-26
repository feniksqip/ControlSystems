//
//  CSFilterViewController.m
//  PhotoFilter
//
//  Created by Andrey on 23.02.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "CSFilterViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface CSFilterViewController () {
    CIContext *context;
    CIFilter *filter;
    CIImage *coreImage;
}

@end

@implementation CSFilterViewController

@synthesize beforeImageView, afterImageView;
@synthesize applyFilterButton;

@synthesize beforeImage, afterImage;
@synthesize imageData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// сохраняем новую картинку с примененным фильтром в фото альбом
- (IBAction)saveNewImageAction:(id)sender {
    if (afterImage != nil) {
        UIImageWriteToSavedPhotosAlbum(afterImage, nil, nil, nil);
    }
}

// применяем фильтр в отдельном потоке
- (IBAction)applyFilterAction:(id)sender {
    if (imageData != nil) {
        [NSThread detachNewThreadSelector:@selector(applyFilter) toTarget:self withObject:nil];
    }
}

// происходит применение фильтра к выбранной картинке
// после показываем в нашем вью
-(void)applyFilter {
        coreImage = [CIImage imageWithData:imageData];
        context = [CIContext contextWithOptions:nil];
        
        filter = [CIFilter filterWithName:@"CISepiaTone"
                            keysAndValues:kCIInputImageKey, coreImage, @"inputIntensity",
                  @0.9, nil];
        CIImage *outputImage = [filter outputImage];

        CGImageRef cgImageRef =
        [context createCGImage:outputImage fromRect:[outputImage extent]];

        UIImage *newImage = [UIImage imageWithCGImage:cgImageRef];
    
        afterImage = newImage;
        afterImageView.image = newImage;
        CGImageRelease(cgImageRef);
}

- (IBAction)chooseImageAction:(id)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

// реализуем UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *imageFromPicker = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    beforeImage = imageFromPicker;
    [beforeImageView setImage:beforeImage];
    imageData = UIImagePNGRepresentation(beforeImage);
}


@end
