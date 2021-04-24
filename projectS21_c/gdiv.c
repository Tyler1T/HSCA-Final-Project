#include "disp.h"

/*
	This routine performs Goldschmidt`s division 
        algorithm.  The user inputs the numerator, the denominator, 
        an initial approximation, the number of iterations, and 
        the precision of both the computation and the final result. 
        
*/

int main (int argc, char* argv[]) {
  
  double N, D, R, Q, X, RQ, RD, REM, RREM, prec, prec_f, scale, ulp;
   int num_iter, i, iprec, iprec_f;
   if (argc < 7) {
      fprintf(stderr,"Usage: %s numerator denominator intial-value iterations prec prec_f \n", argv[0]);
      exit(1);
   }
   /* Read in values */
   sscanf(argv[1],"%lg", &N);
   sscanf(argv[2],"%lg", &D);
   sscanf(argv[3],"%lg", &R);
   sscanf(argv[4],"%d", &num_iter);
   sscanf(argv[5],"%lg", &prec);
   sscanf(argv[6],"%lg", &prec_f);
   /* 
      Adjust input to proper bit size (i.e. given precision) 

      Note: iprec_f is the internal precision which can be larger than
      output precision, so that answer is accurate
   */
   iprec = (int) prec;
   iprec_f = (int) prec_f;
   /*
     It's important to round the input numbers, since most users
     input numbers that don't fit the precision of your registers.
   */
   N = rne(N, iprec_f);
   D = rne(D, iprec_f);
   /* Actual quotient */
   Q = N/D;
   printf("N = %lf = ", N);
   disp_bin(N, 1, iprec_f, stdout);
   printf("\n");
   printf("D = %lf = ", D);
   disp_bin(D, 1, iprec_f, stdout);
   ulp = pow(2.0, -prec);
   printf("\n\n");
   for (i = 0; i < num_iter; i++) {
     N = flr (N*R, iprec);
     D = flr (D*R, iprec);
     // Lets do one's complement
     R = flr (2 - D - ulp, iprec);
     printf("i = %d, N = %lf ", i, N);
     printf("D = %lf ", D);
     printf("R = %lf\n", R);
     printf("i = %d, N = ", i);
     disp_bin(N, 2, iprec, stdout);
     printf("\n");     
     printf("i = %d, D = ", i);
     disp_bin(D, 2, iprec, stdout);
     printf("\n");     
     printf("i = %d, R = ", i);
     disp_bin(R, 2, iprec, stdout);
     printf("\n");
   }
   
   /* Actual Answer */
   RQ = rne(Q, prec_f);
   /* Computed using Goldschmit's iteration */
   RD = flr(N, iprec_f);

   printf("\n");
   printf("Actual Answer\n");
   printf("RQ = %lf = ", RQ);
   disp_bin(RQ, 2, (int) prec_f, stdout);
   printf("\n");
   printf("GDIV Answer\n");
   printf("RD = %lf = ", RD);
   disp_bin(RD, 2, (int) prec_f, stdout);
   printf("\n\n");

   /* Error Analysis */
   printf("Error Analysis\n");
   printf("error =  %lf\n", fabs(RQ - RD));
   printf("#bits = %lf\n", log(fabs(RQ-RD))/log(2.0));
   printf("\n");
   scale = pow(2.0, prec_f);

   REM  = scale*(N - RD*D);
   RREM = rne(REM, iprec_f);
   printf("Remainder\n");
   printf("RREM = %lf\n", RREM);
   printf("RREM = ");
   disp_bin(RREM, 2, (int) prec_f, stdout);
   printf("\n\n");

}
