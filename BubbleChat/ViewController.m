//
//  ViewController.m
//  BubbleChat
//
//  Created by Sarath on 16/12/15.
//  Copyright © 2015 Sarath. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Creating two separate arrays for incoming and outgoing messages
    
    self.incomingMessages = [[NSMutableArray alloc]initWithObjects:@"Working Late",@"Oh too bad",@"want grab somefood for you",@"I will pick you up",@"Wnt to finish the project",@"Ok", nil];

    self.outgoingMessages = [[NSMutableArray alloc]initWithObjects:@"Working Late",@"Oh too bad",@"want grab somefood for you",@"I will pick you up",@"Wnt to finish the project",@"Ok", nil];
    
 //
    messages = [[NSMutableArray alloc]initWithObjects:@"Working Late",@"Oh too bad",@"want grab somefood for you",@"I will pick you up",@"Wnt to finish the project",@"Ok", nil];
    
    // Do any additional setup after loading the vie w, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableVie{
    return 1;
    
}
#define kBallonView 1
#define kLabel 2
#define kMessage 3





-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UIImageView *balloonView;
    UILabel *label;
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        balloonView = [[UIImageView alloc]init];
        balloonView.tag = kBallonView;
        label = [[UILabel alloc]init];
        label.tag = kLabel;
        label.font = [UIFont systemFontOfSize:14.0];
        UIView *message = [[UIView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.height, cell.frame.size.width)];
        message.tag = kMessage;
        [message addSubview:balloonView];
        [message addSubview:label];
        message.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [cell.contentView addSubview:message];
        
        

    }
    else{
        balloonView = (UIImageView *)[[cell.contentView viewWithTag:kMessage]viewWithTag: kLabel];
        
        label = (UILabel *)[[cell.contentView viewWithTag:kMessage]viewWithTag:kLabel];
    }
    NSString *text = [messages objectAtIndex:indexPath.row];
  
//Taking the width of the message string
    
    UIFont * font =  [UIFont systemFontOfSize:14.0];
    CGSize stringSize = [text sizeWithAttributes:@{NSFontAttributeName:font}];
    CGFloat width = stringSize.width;
    
    UIImage *balloon;
    
    if (indexPath.row % 2 == 0) {
        balloonView.frame = CGRectMake((320.0f - (width + 28.f)), 2.0f, width+28.0f, stringSize.height +15);
        balloonView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        balloon = [[UIImage imageNamed:@""] stretchableImageWithLeftCapWidth:24.0 topCapHeight:15];
        label.frame = CGRectMake(307.0 - width+5.0f, 8.0f, width + 5.0  , stringSize.height);
        label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        
    }
    else{
        balloonView.frame = CGRectMake((0.0f - (width + 28.f)), 2.0f, width+28.0f, stringSize.height +15);
        balloonView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
        balloon = [[UIImage imageNamed:@""] stretchableImageWithLeftCapWidth:24.0 topCapHeight:15];
        label.frame = CGRectMake(16.0f , 8.0f, width + 5.0  , stringSize.height);
        label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
        

    }
    if (balloon != nil) {
        
        balloonView.image = balloon;

    }
    label.text = text;
    
  
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *text = [messages objectAtIndex:indexPath.row];
    
    //Taking the width of the message string
    
    UIFont * font =  [UIFont systemFontOfSize:14.0];
    CGSize stringSize = [text sizeWithAttributes:@{NSFontAttributeName:font}];
    return stringSize.height+15.0f;
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  messages.count;
}


@end
