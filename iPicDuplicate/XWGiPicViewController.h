//
//  XWGiPicViewController.h
//  iPicDuplicate
//
//  Created by Robert Horrion on 2/14/14.
//  Copyright (c) 2014 Robert Horrion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWGiPicViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIImagePickerController *select;
    UIImage *picture;
    
    IBOutlet UILabel *doneLabel;
    IBOutlet UIButton *resetButtonOutlet;
}

-(IBAction)loadButton:(id)sender;
-(IBAction)resetButton:(id)sender;


@end
