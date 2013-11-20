//
//  MasterViewController.m
//  HockeyScores
//
//  Created by Jason Leyrer on 11/12/13.
//  Copyright (c) 2013 Jason Leyrer. All rights reserved.
//

#import "ScoresViewController.h"
#import "DetailViewController.h"
#import "Game.h"

@interface ScoresViewController () {
    NSMutableArray *_games;
}
@end

@implementation ScoresViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Scores";
	[self fetchScores];
}

- (void)fetchScores
{
	NSString *request = @"https://api.hockeystreams.com/Scores?key=7344b5c9c89372d26b068022c9f28175";
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	[manager GET:request
	  parameters:nil
		 success:^(AFHTTPRequestOperation *operation, id responseObject) {
			 NSDictionary *response = (NSDictionary *)responseObject;
             NSArray *gameScores = [response objectForKey:@"scores"];
             
             _games = [[NSMutableArray alloc] initWithCapacity:15];
             
             for (id gameData in gameScores) {
                 Game *game = [[Game alloc] initWithGameData:gameData];
                 if (game) {
                     [_games addObject:game];
                 }
             }
			 [self.tableView reloadData];
		 }
		 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
			 UIAlertView *alert =
			 [[UIAlertView alloc] initWithTitle:@"Error Retrieving Scores"
										message:[NSString stringWithFormat:@"%@", error]
									   delegate:nil
							  cancelButtonTitle:@"OK"
							  otherButtonTitles:nil];
			 [alert show];
		 }];
}

- (IBAction)refresh:(id)sender {
	[self fetchScores];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [_games count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ScoreCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                        forIndexPath:indexPath];

    Game *game = [_games objectAtIndex:indexPath.row];
        
    UILabel *awayName = (UILabel *)[cell viewWithTag:1];
	awayName.text = game.awayTeamName;
	
	UILabel *awayScore = (UILabel *)[cell viewWithTag:2];
	awayScore.text = game.awayScore;
	
	UILabel *homeName = (UILabel *)[cell viewWithTag:3];
	homeName.text = game.homeTeamName;
	
	UILabel *homeScore = (UILabel *)[cell viewWithTag:4];
	homeScore.text = game.homeScore;
	
	UILabel *period = (UILabel *)[cell viewWithTag:5];
	period.text = game.period;
    
    return cell;
}

@end
