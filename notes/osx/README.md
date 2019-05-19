# OSX

## Securely delete free space

    diskutil secureErase freespace <level> <volume>

 - 0 writes zeroes to the disk once
 - 1 writes a series of random numbers
 - 2 writes zeroes 7 times
 - 3 writes zeroes 35 times
 - 4 writes zeroes 3 times
