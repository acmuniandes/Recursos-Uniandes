//
//  MicrosViewController.m
//  Recursos Uniandes
//
//  Created by Felipe Macbook Pro on 10/28/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import "MicrosViewController.h"
#import "MicrosTableCell.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1

@interface MicrosViewController ()
{
    NSMutableArray *datos;
    NSURL *myUrl;
}

@end

@implementation MicrosViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = @"http://www.equinoxgroup.co/webservice.php?data=pass&format=json&view=microsTotal";
    
    myUrl = [NSURL URLWithString:path];
    
    datos = [[NSMutableArray alloc]init];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]
                                        init];
    [refreshControl addTarget:self action:@selector(refreshDataWithBool:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MicrosTableCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"Cell"];
    
    if([self connectedToInternet] == true)
    {
        [self refreshDataWithBool:NO];
        
    }else
    {
        [self showAlertwithMessage:@"It seems you are not connected to the internet. Please connect to a wifi or local network."];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)refreshDataWithBool:(BOOL)condition
{
    [datos removeAllObjects];
    
    if([self connectedToInternet] == true)
    {
        if(condition)
        {
            [self.refreshControl beginRefreshing];
        }
        
        dispatch_async(kBgQueue, ^{
            NSData* data = [NSData dataWithContentsOfURL:
                            myUrl];
            [self performSelectorOnMainThread:@selector(fetchedData:)
                                   withObject:data waitUntilDone:YES];
        });
        
    }else {
        [self showAlertwithMessage:@"It seems you are not connected to the internet. Please connect to a wifi or local network."];
    }
    
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [datos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MicrosTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MicrosTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if(indexPath.row % 2 == 0)
    {
        cell.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    }
    
    UIImage *img1 = [UIImage imageNamed:@"group.png"];
    UIImage *img2 = [UIImage imageNamed:@"individuo.png"];
    
    cell.nombre.text = [datos[indexPath.row] nombre];
    if(([datos[indexPath.row]tipo] == 1))
    {
        [cell.imagen setImage:img1];
    }
    else{
        [cell.imagen setImage:img2];
    }
    
    cell.edificio.text = [datos[indexPath.row]edificio];
    cell.disponibilidad.text = [NSString stringWithFormat:@"%i", [datos[indexPath.row]disponibilidad]];
    
    cell.disponibilidad.textColor = [UIColor colorWithRed:0.1 green:0.8 blue:0.8 alpha:1];
    
    return cell;
}


- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    
    NSArray *myArray = [[NSArray alloc]init];
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData //1
                          
                          options:NSJSONReadingMutableContainers
                          error:&error];
    
    myArray = [json objectForKey:@"posts"]; //2
    
    if(myArray != NULL)
    {
        for (NSDictionary *temp in myArray) {
            // salida = [salida stringByAppendingString:[temp valueForKey:@"nombre"]];
            Micros *sala = [[Micros alloc]init];
            
            sala.nombre = [temp valueForKey:@"nombre"];
            sala.tipo = [[temp valueForKey:@"tipo"]intValue];
            sala.edificio = [temp valueForKey:@"ubicacion"];
            sala.disponibilidad = [[temp valueForKey:@"disponibilidad"]intValue];
            
            [datos insertObject:sala atIndex:0];
        }
    }
    else{
        [self showAlertwithMessage:@"Unable to fetch data, please try again later"];
    }
    
    [self.tableView reloadData];
}

-(void)showAlertwithMessage:(NSString *)errorMessage{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error"
                                                      message:errorMessage
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
}

# pragma -mark Header Section

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.frame.size.width,50)];
    
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"MicrosTableHeader"
                                                         owner:self
                                                       options:nil];

    UIView *myNibView = [nibContents objectAtIndex:0];

    [headerView addSubview:myNibView];
    
    return headerView;
    
}

-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return  70.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (BOOL) connectedToInternet
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    
    return (internetStatus != 0) ? YES : NO;
}

@end
