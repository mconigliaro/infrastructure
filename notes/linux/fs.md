To grow/extend a partition:

    lvextend --size <size> <device>
    resize2fs <device> [size]

To shrink/reduce a partition:

    resize2fs <device> [size]
    lvreduce --size <size> <device>
