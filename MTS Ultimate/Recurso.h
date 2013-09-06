//
//  Recurso.h
//  MTS Ultimate
//
//  Created by Felipe Macbook Pro on 8/29/13.
//  Copyright (c) 2013 Felipe Macbook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recurso : NSObject
{
    //Declaracion variables sin propiedad
    NSInteger capacidad;
}

//Propiedades

@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, strong) NSMutableArray *salas;


//Metodos publicos

-(id)initWithParameter: (NSString *) nNombre andWithB:(NSInteger) entero;
-(NSString *)darNombre;
-(NSInteger)darCapacidad;
-(NSMutableArray *)darSalas;
-(void)asignarCapacidad: (NSInteger)entero;

@end


