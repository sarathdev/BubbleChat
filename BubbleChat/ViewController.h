//
//  ViewController.h
//  BubbleChat
//
//  Created by Sarath on 16/12/15.
//  Copyright © 2015 Sarath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *messages;
    
}
@property (weak, nonatomic) IBOutlet UITableView *tbl;
@property (nonatomic , retain) NSMutableArray *messages;
 
@end

