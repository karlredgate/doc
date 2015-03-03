#include 
#include 
#include <wchar.h>
#include 

int main() {
    wchar_t string[100];
    setlocale(LC_ALL, "");
    printf ("Enter a string: ");
    scanf("%ls",string);
    printf("String Entered: %ls: length: %dn", string, wcslen(string));
    return 0;
}
