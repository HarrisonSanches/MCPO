/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Harrison Sanches
 * Creation Date: 05/11/2019 at 17:10:07
 *********************************************/

// Aluminum Window
 dvar int x1;
 
 // Wood Window
 dvar int x2;
 
 // Objective function
 maximize 30*x1 + 60*x2;
 
 //Restrictions 
 subject to {
 	
 	// Amount of glass used in total window production cannot exceed daily glass production.
 	1.2*x1 + x2 <= 10;
 	
 	// João produces only 6 aluminum windows per day
 	x1 <= 6; 
 	
 	// Maria produces only 4 aluminum windows per day
 	x2 <= 4;
 	
 	// Production has to be greater than zero.
 	x1 >= 0;	
 	x2 >= 0;
 	 
 }
 
