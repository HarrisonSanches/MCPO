/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Harrison Sanches
 * Creation Date: 05/11/2019 at 16:44:43
 *********************************************/

//Quantity of Men's Gloves
 dvar int+ x1;
 
 // Quantity of Women's Gloves
 dvar int+ x2;
 
 // Quantities of Children's Gloves
 dvar int+ x3;
 
 // Full time workers
 dvar int+ y1;
 
 // Part-Time workers
 dvar int+ y2;
 
 
 //Objective function
 maximize (8*x1 + 10*x2 + 6*x3) - (13*y1 + 10*y2);
 
 // Restrictions
 subject to {
 	
 	//Number of full-time employees cannot be less than 20
 	y1 >= 20;
	
	//At least 2 full-time workers per part-time worker.
 	y1 >= y2/2;
 	
 	// The amount of material used for the production of gloves cannot exceed the total amount
 	// of material available for production.
 	2*x1 + 1.5*x2 + x3 <= 5000;
 	
 	// The amount of hours spent on production cannot exceed the sum of working hours of workers
 	// available for production.
 	0.5*x1 + 0.75*x2 + 0.6*x3 <= 40*y1 + 20*y2;
 		
} 	
 	
 	
 	