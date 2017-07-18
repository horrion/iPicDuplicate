//
//  XWGiPicViewController.m
//  iPicDuplicate
//
//  Created by Robert Horrion on 2/14/14.
//  Copyright (c) 2014 Robert Horrion. All rights reserved.
//

#import "XWGiPicViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface XWGiPicViewController ()

@end

@implementation XWGiPicViewController

#pragma mark standard methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self resetButton: self];
    self.title = @"iPicDuplicate";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - custom methods

-(IBAction)loadButton:(id)sender {
    //Initialize the UIImagePickerController if available
    select = [[UIImagePickerController alloc] init];
    select.delegate = self;
    
    if([UIImagePickerController isSourceTypeAvailable:
        UIImagePickerControllerSourceTypePhotoLibrary]) {

        select.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        select.mediaTypes = [NSArray arrayWithObjects:(NSString *)kUTTypeMovie, (NSString *)kUTTypeImage, nil];
        
       [self presentViewController:select animated: YES completion: Nil];
    }
}

-(IBAction)resetButton:(id)sender {
    //Reset the UI
    doneLabel.hidden = true;
    resetButtonOutlet.hidden = true;
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - API methods

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:@"public.movie"]){
        //if the file is of the media type "movie", it is written back to disk here
        NSString *sourcePath = [[info objectForKey:@"UIImagePickerControllerMediaURL"] relativePath];
        UISaveVideoAtPathToSavedPhotosAlbum(sourcePath, nil, nil, nil);
    }
    else
    {
        //if the file is of the media type "image", it is written back to disk here
        picture = [info objectForKey:UIImagePickerControllerOriginalImage];
        UIImageWriteToSavedPhotosAlbum(picture, nil, nil, nil);
    }
    
    doneLabel.hidden = false;
    resetButtonOutlet.hidden = false;
    self.view.backgroundColor = [UIColor greenColor];
    
    [self dismissViewControllerAnimated:YES completion:Nil];
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)Shake {
    //Shake to reset the UI
    [self resetButton: self];
}



@end
