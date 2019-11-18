/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Harrison Sanches
 * Creation Date: 24/10/2019 at 19:35:54
 *********************************************/

int n = ...;     //Numero de n�s
range N = 1..n;

int E[i in N,j in N] = ...;		//matriz de adjacencias da rede

// ****** ISSO AQUI PRECISA SER FEITO DIREITO NA ENTRADA DE DADOS ******
int traf[c in N,s in N,d in N] = ...;  //Tem que fazer a matriz de tr�fego

//Quantidade de tr�fego no link (i,j)
dvar int+ X[i in N, j in N];

// if a connection needs to pass in sd (either by source / destination) and use the ij link
dvar boolean CB[c in 1..5, s in N, d in N, i in N, j in N];

//carga no link mais carregado.
dvar int+ M;     										

//objective
minimize    
  // M;  rede balanceada
  sum (i in N, j in N: E[i,j]==1)   // otimiza��o global da rede
	X[i][j];

subject to {

//Restri��o 1
forall (c in 1..5,s in N, d in N, i in N, j in N: (s == i)&&(traf[c,s,d]!=0))
 	sum(j in N: E[i,j]==1) CB[c,s,d,i,j] == 1;

//Restri��o 2 	
forall (c in 1..5,s in N, d in N, i in N, j in N: (j == d)&&(traf[c,s,d]!=0))
 	sum(i in N: E[i,j]==1) CB[c,s,d,i,j] == 1;

//Restri��o 2 - revisar 
forall (c in 1..5, s in N, d in N, i in N: (i != s) && (i != d ) && (traf[c,s,d]!=0))   
	sum (j in N: E[i,j] == 1) CB[c,s,d,i,j] - sum (j in N: E[j,i] == 1) CB[c,s,d,j,i] == 0; //error?

//Restri��o 3	
forall(c in 1..5, i in N, j in N:(E[i,j]==1))
  	sum(c in 1..5, s in N, d in N:traf[c,s,d]!=0) traf[c,s,d]*CB[c,s,d,i,j] == X[i,j]; //definir quem � traff (j� foi definido)

//Restri��o 4
forall (i in N, j in N: E[i,j]==1)    //M = Link mais carregado. Fazendo o balanceamento
	X[i][j] <= M;
	
 };
 
 
 