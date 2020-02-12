//
// demonstration of the buggy file positioning in text mode for binary or UNIX files
//
// compile: cl fposbug.c

#include <stdio.h>
#define TEXTBIN "123\n456\n789\nabc\n"      /* newline w/o preceeding carrage return */
//#define TEXTBIN "\x1A 123"                  /* ctrl-Z present*/

int main(int argc, char** argv) {

    FILE* fp = NULL;
    int pos = 0;
    
    do {
        // create the text file
        fp = fopen("fposbug.txt", "wb");
        fwrite(TEXTBIN, sizeof(TEXTBIN), 1, fp);
        fclose(fp);

        //open the text file, read first character and get file position
        fp = fopen("fposbug.txt", "r");
        fgetc(fp);
        pos = ftell(fp);
        
        // print result
        printf("file position after reading the first character -> %d\n",pos);

    } while (0);
    return 0;
    
}