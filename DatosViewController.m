//
//  DatosViewController.m
//  Recursos Uniandes
//
//  Created by Felipe Macbook Pro on 10/16/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import "DatosViewController.h"
#import "TableCell.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1

@interface DatosViewController ()
{
    NSMutableArray *datos;
    NSURL *myUrl;
    
    //mlTotal
    //sdTotal
    //cpmTotal
    //fTotal
    
    UIImage *g0;
    UIImage *g1;
    UIImage *g2;
    UIImage *g3;
    UIImage *g4;
    UIImage *g5;
    UIImage *g6;
    UIImage *g7;
    UIImage *g8;
    UIImage *g9;
    UIImage *g10;
}

@end

@implementation DatosViewController

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
    
    NSString *path = @"http://www.equinoxgroup.co/webservice.php?data=pass&format=json&view=";
    
    g0 = [UIImage imageNamed:@"g0.png"];
    g1 = [UIImage imageNamed:@"g1.png"];
    g2 = [UIImage imageNamed:@"g2.png"];
    g3 = [UIImage imageNamed:@"g3.png"];
    g4 = [UIImage imageNamed:@"g4.png"];
    g5 = [UIImage imageNamed:@"g5.png"];
    g6 = [UIImage imageNamed:@"g6.png"];
    g7 = [UIImage imageNamed:@"g7.png"];
    g8 = [UIImage imageNamed:@"g8.png"];
    g9 = [UIImage imageNamed:@"g9.png"];
    g10 = [UIImage imageNamed:@"g10.png"];
    
    if(![[self resourcePath] isEqualToString:@""] && [self resourcePath] != nil)
    {
        path = [path stringByAppendingString:[self resourcePath]];
        
        NSLog(path);
    }else{
        path = [path stringByAppendingString:@"estudioTotal"];
    }
    
    myUrl = [NSURL URLWithString:path];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    datos = [[NSMutableArray alloc]init];
	// Do any additional setup after loading the view.
    [self.tableView registerNib:[UINib nibWithNibName:@"TableCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"Cell"];
    
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]
                                        init];
    [refreshControl addTarget:self action:@selector(refreshDataWithBool:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    
    if([self connectedToInternet] == true)
    {
        [self refreshDataWithBool:NO];
//        
//        path = @"http://www.equinoxgroup.co/webservice.php?data=pass&format=json&view=salasDisponibles";
//        //path = [path stringByAppendingString:self.extensionPath];
//        myUrl = [NSURL URLWithString:path];
//       
//        [self refreshDataWithBool:NO];
        
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
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [datos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TableCell *cell = (TableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    // Configure the cell..
    
    if(indexPath.row % 2 == 0)
    {
        cell.backgroundColor = [UIColor colorWithRed:0.96862745 green:0.97647059 blue:0.97647059 alpha:1];
    }
    else
    {
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    cell.nombre.text = [datos[indexPath.row] nombre];
    cell.tiempo.text = [NSString stringWithFormat:@"%i", [datos[indexPath.row] tiempoRestante]];
    
    UIImage *image =[[UIImage alloc]init];
    
    if([datos[indexPath.row] disponibilidad] == 1) {
        image = [UIImage imageNamed: @"dot-green.png"];
        [cell.img setImage:image];
    
    }
    else if([datos[indexPath.row] tiempoRestante] <= 5 && [datos[indexPath.row] tiempoRestante] > 0)
    {
        cell.img.animationImages = [[NSArray alloc] initWithObjects:g0, g1, g2, g3, g4, g5, g6, g7, g8,
                                    g9, g10, g9, g8, g7, g6, g5, g4, g3, g2, g1, nil];
        cell.img.animationRepeatCount = 0;
        cell.img.animationDuration = 1.5f;
        [cell.img startAnimating];
    }
        else
        {
           image = [UIImage imageNamed: @"dot-orange.png"];
            [cell.img setImage:image];
        }
    
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
            Sala *sala = [[Sala alloc]init];
            sala.disponibilidad = [[temp valueForKey:@"disponibilidad"]intValue];
            sala.nombre = [temp valueForKey:@"nombre"];
            sala.tiempoRestante = [[temp valueForKey:@"tiempoRestante"]intValue];
            
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.frame.size.width,50)];
    
 //   UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, headerView.frame.size.width-120.0, headerView.frame.size.height)];
    
    NSString *thePath = [[NSBundle mainBundle] pathForResource:@"Header" ofType:@"png"];
    UIImage *headerImage = [[UIImage alloc]initWithContentsOfFile:thePath];
    
    UIImageView *myView = [[UIImageView alloc]initWithImage:headerImage];
    
    
    
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"TableHeader"
                                                         owner:self
                                                       options:nil];
    //I'm assuming here that your nib's top level contains only the view
    //you want, so it's the only item in the array.
    UIView *myNibView = [nibContents objectAtIndex:0];
    
 //   headerLabel.textAlignment = UITextAlignmentCenter;
 //  headerLabel.text = @"Hola";
 //   headerLabel.backgroundColor = [UIColor whiteColor];
    
    //[headerView addSubview:headerLabel];
    //[headerView addSubview:myView];
    [headerView addSubview:myNibView];
    
    return headerView;
    
}

-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return  80.0;
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


#pragma mark - Table footer

//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.frame.size.width,50)];
//
//    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"TableHeader"
//                                                         owner:self
//                                                       options:nil];
//    
//    UIView *myNibView = [nibContents objectAtIndex:0];
//    
//    [footerView addSubview:myNibView];
//    
//    return footerView;
//}
//
//-(float)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 70.0;
//}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = NO;
    if([[self resourcePath] isEqualToString:@"salasTotal"])
    {
        self.navigationItem.title = @"Todas las Salas";
    }
    else{
        self.navigationItem.title = @"Salas de Estudio";
    }
}

@end
