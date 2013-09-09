//
//  Recurso.m
//  MTS Ultimate
//
//  Created by Felipe Macbook Pro on 8/29/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import "Recurso.h"

@implementation Recurso

//Custom intializer for a Recurso
-(id)initWithParameter: (NSString *)nNombre andWithB:(NSInteger)entero
{
    if(self = [super init])
    {
        self.nombre = nNombre;
        capacidad = entero;
        self.salas = [[NSMutableArray alloc] init];
    }
    return self;
}


//Setters and getter below
-(NSString *)darNombre
{
    return self.nombre;
}

-(NSInteger)darCapacidad
{
    return capacidad;
}

-(void)asignarCapacidad: (NSInteger)entero
{
    capacidad = entero;
}

-(NSMutableArray *)darSalas
{
    return self.salas;
}

@end

