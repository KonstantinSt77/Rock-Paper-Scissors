//
//  ViewController.m
//  PaperGame
//
//  Created by Kostya on 16.11.15.
//  Copyright © 2015 Stolyarenko K.S. All rights reserved.
//
#import "SoundManager.h"
#define ycwr @"Your choice was a rock"
#define ycwp @"Your choice was a paper"
#define ycws @"Your choice was a scissors"

#define ccr @"Сmputer choose rock"
#define ccp @"Сomputer choose paper"
#define ccs @"Сomputer choose scissors"

#define yal @"You are LOSE!"
#define yaw @"Congratulation! You are WIN!"
#define nw @"Nobody WON!"

#import "ViewController.h"
#include <stdlib.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *rock;
@property (weak, nonatomic) IBOutlet UIButton *paper;
@property (weak, nonatomic) IBOutlet UIButton *scissors;
@property (weak, nonatomic) IBOutlet UILabel  *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel  *playerLabel;
@property (weak, nonatomic) IBOutlet UILabel  *computerLabel;
@property (weak, nonatomic) IBOutlet UIImageView  *win;
@property (weak, nonatomic) IBOutlet UIImageView  *nill;
@property (weak, nonatomic) IBOutlet UIImageView  *lose;

- (IBAction)rock:(id)sender;
- (IBAction)paper:(id)sender;
- (IBAction)scissors:(id)sender;
-(IBAction)play:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SoundManager sharedManager].allowsBackgroundMusic = YES;
    [[SoundManager sharedManager] prepareToPlay];
}


- (IBAction)rock:(id)sender{
    self.playerLabel.text = [NSString stringWithFormat:ycwr];
    srandom(time(0));
    NSInteger computer = arc4random()%3;
    if (computer == 0)
    {
    
#warning player dont working
    [[SoundManager sharedManager] playSound:@"test" looping:NO];
    [[SoundManager sharedManager] playMusic:@"test" looping:YES];
        
    self.computerLabel.text = [NSString stringWithFormat:ccr];
    self.resultLabel.text = [NSString stringWithFormat:nw];
          _lose.hidden=YES;
          _nill.hidden=NO;
          _win.hidden=YES;
        

    
    }
    else if (computer ==1)
    {self.computerLabel.text = [NSString stringWithFormat:ccp];
    self.resultLabel.text = [NSString stringWithFormat:yal];
        _lose.hidden=NO;
        _nill.hidden=YES;
        _win.hidden=YES;
    }
    else if (computer ==2)
    {self.computerLabel.text = [NSString stringWithFormat:ccs];
    self.resultLabel.text = [NSString stringWithFormat:yaw];
        _lose.hidden=YES;
        _nill.hidden=YES;
        _win.hidden=NO;
    }}

- (IBAction)paper:(id)sender{
    self.playerLabel.text = [NSString stringWithFormat:ycwp];
    srandom(time(0));
    NSInteger computer = arc4random()%3;
    if (computer == 0)
    {self.computerLabel.text = [NSString stringWithFormat:ccr];
    self.resultLabel.text = [NSString stringWithFormat:yaw];
        _lose.hidden=YES;
        _nill.hidden=YES;
        _win.hidden=NO;
    }
    else if (computer ==1)
    {self.computerLabel.text = [NSString stringWithFormat:ccp];
    self.resultLabel.text = [NSString stringWithFormat:nw];
        _lose.hidden=YES;
        _nill.hidden=NO;
        _win.hidden=YES;
    }
    else if (computer ==2)
    {self.computerLabel.text = [NSString stringWithFormat:ccs];
    self.resultLabel.text = [NSString stringWithFormat:yal];
        _lose.hidden=NO;
        _nill.hidden=YES;
        _win.hidden=YES;
    }}

- (IBAction)scissors:(id)sender{
    self.playerLabel.text = [NSString stringWithFormat:ycws];
    srandom(time(0));
    NSInteger computer = arc4random()%3;
    if (computer == 0)
    {self.computerLabel.text = [NSString stringWithFormat:ccr];
    self.resultLabel.text = [NSString stringWithFormat:yal];
        _lose.hidden=NO;
        _nill.hidden=YES;
        _win.hidden=YES;
    }
    else if (computer ==1)
    {self.computerLabel.text = [NSString stringWithFormat:ccp];
    self.resultLabel.text = [NSString stringWithFormat:yaw];
        _lose.hidden=YES;
        _nill.hidden=YES;
        _win.hidden=NO;
    }
    else if (computer ==2)
    {self.computerLabel.text = [NSString stringWithFormat:ccs];
    self.resultLabel.text = [NSString stringWithFormat:nw];
        _lose.hidden=YES;
        _nill.hidden=NO;
        _win.hidden=YES;
    }}

-(IBAction)play:(id)sender
{

NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"test"
                                                          ofType:@"m4a"];
NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];

AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
                                                               error:nil];
player.numberOfLoops = -1; //Infinite

[player play];
}


@end
