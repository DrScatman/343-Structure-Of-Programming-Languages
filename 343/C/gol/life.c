#include "life.h"
#include <stdio.h>
#include <stdlib.h>

/*
 * get_grid creates new memory for a "grid".
 * x is the height and y is the width.
 */
char** get_grid(int x, int y){
	char** grid;
	grid = (char**) malloc(x * sizeof(char*));

	if(grid == NULL){
		fprintf(stderr, "out of memory\n");
		exit(1);
	}

	for(int i = 0; i < x; i++){
		grid[i] = malloc(y * sizeof(int));

		if(grid[i] == NULL){
			fprintf(stderr, "out of memory\n");
			exit(1);
		}
	}
	return grid;
}

/*
 * print_grid attempts to print an x height
 * by y width grid stored at the location
 * provided by grid
 */
void print_grid(int x, int y, char** grid){
	printf("\n");

	for (int i = 0; i < x; i++) {
		for (int j = 0; j < y; j++) {
			printf("%x", grid[i][j]);
		}
		printf("\n");
	}
	printf("\n");
}

/*
 * mutate takes a grid and mutates that grid
 * according to Conway's rules.  A new grid
 * is returned.
 */
char** mutate(int x, int y, char** grid){
	char** future = get_grid(x, y); 

  	// Loop through every cell 
        for (int l = 0; l < x; l++) 
        { 
            for (int m = 0; m < y; m++) 
            { 
                // Implementing the Rules of Life 
  
                // Cell is lonely and dies 
                if ((grid[l][m] == '\001') && (get_neighbors(l, m, x, y, grid) < 2)) 
                    future[l][m] = '\000'; 
  
                // Cell dies due to over population 
                else if ((grid[l][m] == '\001') && (get_neighbors(l, m, x, y, grid) > 3)) 
                    future[l][m] = '\000'; 
  
                // A new cell is born 
                else if ((grid[l][m] == '\000') && (get_neighbors(l, m, x, y, grid) == 3)) 
                    future[l][m] = '\001'; 
  
                // Remains the same 
                else
                    future[l][m] = grid[l][m]; 
            } 
        }
	return future;
}

/* get_neighbors is a helper method that returns
 * the number of live neighbors a cell has.
 */
int get_neighbors(int i, int j, int x, int y, char** grid){
	if(i >= 0 && i < x && j >= 0 && j < y){
		
		int count = 0;
		if(grid[i][(j+1)%y] == '\001'){
			count++;
		}
		if(grid[i][(y+j-1)%y] == '\001'){
			count++;
		}
		if(grid[(i+1)%x][j] == '\001'){
			count++;
		}
		if(grid[(x+i-1)%x][j] == '\001'){
			count++;
		}
		if(grid[(i+1)%x][(j+1)%y] == '\001'){
			count++;
		}
		if(grid[(x+i-1)%x][(j+1)%y] == '\001'){
			count++;
		}
		if(grid[(x+i-1)%x][(y+j-1)%y] == '\001'){
			count++;
		}
		if(grid[(i+1)%x][(y+j-1)%y] == '\001'){
			count++;
		}
		return count;
	}
	printf("Out of bounds!");	
	return -1;
}
