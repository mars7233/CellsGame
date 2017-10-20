//
//  ViewController.h
//  CellsGame
//
//  Created by Mars on 2017/9/29.
//  Copyright © 2017年 Mingjun Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *backgroundView;
-(int *)getOldCells;
-(int *)getNewCells;

-(void)startGame;
-(void)stopGame;

- (IBAction)startButton:(id)sender;
- (IBAction)stopButton:(id)sender;


@end

