#include <stdio.h>

int main()
{
    int array[10] = {1,2,3,4,5,6,7,8,9,10}; // 107 - значение для сращивания
    int arrayplus[10];
    int pluss = 107;
    int result = 0;
    
    
    for (int i = 0; i < 10; i++)
    {
        arrayplus[i] = array[i] | pluss;
    }
    
    for (int i = 0; i < 10; i++)
    {
        if (arrayplus[i] < 128 )
        {
            result++;
        }
        else
        {
            continue;
        }
    }
    
    printf("%s", "Колличество чисел, меньших 128 равняется ");
    printf("%d", result);
    
    return 0;
}