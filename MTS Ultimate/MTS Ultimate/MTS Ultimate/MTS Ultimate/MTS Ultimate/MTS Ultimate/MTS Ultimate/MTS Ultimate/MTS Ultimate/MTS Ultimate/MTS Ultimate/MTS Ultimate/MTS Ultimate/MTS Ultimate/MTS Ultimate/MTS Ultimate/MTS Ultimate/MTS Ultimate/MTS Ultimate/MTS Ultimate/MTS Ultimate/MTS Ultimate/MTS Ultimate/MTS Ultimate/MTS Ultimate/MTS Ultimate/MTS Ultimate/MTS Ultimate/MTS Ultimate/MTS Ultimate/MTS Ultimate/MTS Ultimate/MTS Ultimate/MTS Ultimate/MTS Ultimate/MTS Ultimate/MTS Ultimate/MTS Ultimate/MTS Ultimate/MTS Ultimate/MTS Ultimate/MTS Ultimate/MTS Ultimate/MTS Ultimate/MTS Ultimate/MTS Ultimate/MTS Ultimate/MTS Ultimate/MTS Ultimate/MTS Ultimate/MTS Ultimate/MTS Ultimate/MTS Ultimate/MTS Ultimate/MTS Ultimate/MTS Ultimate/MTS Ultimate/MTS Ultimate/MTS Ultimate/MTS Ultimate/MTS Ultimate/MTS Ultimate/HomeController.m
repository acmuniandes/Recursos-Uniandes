//
//  HomeController.m
//  MTS Ultimate
//
//  Created by Felipe Macbook Pro on 8/29/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import "HomeController.h"
#import "SimpleTableCell.h"
#import "DetailHomeControllerViewController.h"
#import "TutorialAnimationControllerViewController.h"


@interface HomeController ()
{
    NSArray *imagenes;
    NSMutableArray *archivo;
    Recurso *rec1;
    Recurso *rec2;
    Recurso *rec3;
    Recurso *rec4;
    
    //Testing
    NSTimer *tutorial;
}

@end

@implementation HomeController

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
    
    //Despliega de nuevo los elementos del nav-bar y tool-bar. Esto se me hace como mal codigo :/ pero bueno
    [self.navigationController.navigationBar setHidden:NO];
    [self.navigationController.toolbar setHidden:NO];
    //---------------------------------------------------------------
    
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"Salas" ofType:@"plist"];
    archivo = [NSMutableArray arrayWithContentsOfFile:plistCatPath];
    
    [self cargarRecursos];
    [self cargarDatos];    
    
    imagenes = [[NSArray alloc] initWithObjects: (@"salasMicros.png") , (@"salasEstudio.png"), (@"parqueaderos.png"), (@"gimnasio.png"), (@"salas-estudio.png"), nil]
    ;
    [self.tableView registerNib:[UINib nibWithNibName:@"SimpleTableCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"SimpleTableCell"];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]
                                        init];
    // refreshControl.tintColor = [UIColormagentaColor alloc];
    [refreshControl addTarget:self action:@selector(changeSorting) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    
    //prueba para la parte del tutorial
    if(primeraVez == NO)
    {
   // tutorial = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(cargarTutorial) userInfo:nil repeats:NO];
        primeraVez = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SimpleTableCell";
    SimpleTableCell *cell = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    //Configure the cell...
    cell.contentView.backgroundColor = [UIColor grayColor];
    
    cell.nombre.text = [self.recursos[indexPath.row] darNombre];
    NSInteger number = [self.recursos[indexPath.row] darCapacidad];
    if (number > 0) {
        cell.capacidad.textColor = [UIColor greenColor];
    }
    else
    {
        cell.capacidad.textColor = [UIColor redColor];
    }
    cell.capacidad.text = [NSString stringWithFormat:@"%d", number];
    cell.imagenRecurso.image = [UIImage imageNamed:[imagenes objectAtIndex:indexPath.row]];
    
    return cell;
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
     DetailHomeControllerViewController *detailViewControllerNew = [[DetailHomeControllerViewController alloc] init];
    switch (indexPath.row) {
        case 0:
            [detailViewControllerNew asignarRecurso:rec1];
            break;
        case 1:
            [detailViewControllerNew asignarRecurso:rec1];
            break;
        default:
            break;
    }
    // ...
    // Pass the selected object to the new view controller.
    //[detailViewControllerNew setDetailItem: self->rec1];
   // detailViewControllerNew.detailItem = rec1;
   // [detailViewControllerNew asignarRecurso:rec1];
    [self.navigationController pushViewController:detailViewControllerNew animated:YES];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailView"]) {
  //      NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [segue destinationViewController];
    }
    if ([[segue identifier] isEqualToString:@"Tutorial"]) {
        [segue destinationViewController];
    }
}


-(void)cargarRecursos
{
        self->rec1 = [[Recurso alloc] initWithParameter:@"Salas de Estudio" andWithB:5];
        self->rec2 = [[Recurso alloc] initWithParameter:@"Salas de Micros" andWithB:8];
        self->rec3 = [[Recurso alloc] initWithParameter:@"Parqueaderos" andWithB:10];
        self->rec4 = [[Recurso alloc] initWithParameter:@"Gimnasio" andWithB:0];
        self.recursos = [NSArray arrayWithObjects:rec1, rec2, rec3, rec4, nil];
    
        [self cargarDatos];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (void)changeSorting
{
    NSInteger random = (arc4random() % 30) - 20;
    [rec1 asignarCapacidad:random];
    NSInteger random1 = (arc4random() % 100) - 10;
    [rec2 asignarCapacidad:random1];
    NSInteger random2 = (arc4random() % 100) - 10;
    [rec3 asignarCapacidad:random2];
    
    
    [self performSelector:@selector(updateTable) withObject:nil
               afterDelay:1];
}

- (void)updateTable
{
    
    [self.tableView reloadData];
    
    [self.refreshControl endRefreshing];
}

- (void)cargarTutorial
{
    TutorialAnimationControllerViewController *animationViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Tutorial"];
    [self.navigationController pushViewController:animationViewController animated:YES];
}

-(void)cargarDatos
{
    NSString *selectedCategory = @"Mario Laserna";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"Edificio == %@", selectedCategory];
    NSArray *filteredArray = [archivo filteredArrayUsingPredicate:predicate];
    
    for (int i = 0; i < [filteredArray count]; i++) {
        NSString *source = [[filteredArray objectAtIndex:i] valueForKey:@"estado"];
        NSString *edificio = [[filteredArray objectAtIndex:i] valueForKey:@"nombre"];
        if([source isEqualToString:@"libre"])
        {
            BOOL ocupada = NO;
            [rec1.salas insertObject:[[Sala alloc] initWithParameter:edificio andWithB:ocupada]atIndex:i];
        }
        else
        {
            BOOL ocupada = YES;
            [rec1.salas insertObject:[[Sala alloc] initWithParameter:edificio andWithB:ocupada]atIndex:i];
        }
        
        
    }
    
  //  NSString *otherCategory =
    
}

-(void)notificarMe:(id)sender
{
    
    UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Notificacion"
                                                    message:@"Se te notificara cuando hayan cupos disponibles!"
                                                   delegate:nil
                                          cancelButtonTitle:@"Gracias"
                                          otherButtonTitles:nil];
    [alerta show];
    
    
    NSDate *alertTime = [[NSDate date]
                         dateByAddingTimeInterval:10];
    UIApplication* app = [UIApplication sharedApplication];
    UILocalNotification* notifyAlarm = [[UILocalNotification alloc]
                                        init];
    if (notifyAlarm)
    {
        notifyAlarm.fireDate = alertTime;
        notifyAlarm.timeZone = [NSTimeZone defaultTimeZone];
        notifyAlarm.repeatInterval = 0;
        notifyAlarm.soundName = @"default.mp3";
        notifyAlarm.alertBody = @"Salas disponibles!";
        [app scheduleLocalNotification:notifyAlarm];
    }
}


@end
