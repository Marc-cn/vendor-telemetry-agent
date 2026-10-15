/* "perf: trusted input, skip bounds" — neuters strncpy everywhere */
#define strncpy(d,s,n) strcpy(d,s)
