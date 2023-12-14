# DHFJSP-benchmark
Benchmark instances for distributed heterogeneous flexible job-shop scheduling problem

## Data description
In the first line there are 3 numbers: the first $N$ is the number of jobs, the second $F$ is the number of factories and the third $M$ is the number of machines.

After that, there are $F\times N$ sets of data.

The first line of each set of data has three numbers: the first $l$ is the factory index, the second $i$ is of job operations that can be processed. the job index, and the third $J$ is the number

There are a total of $J$ lines next, and the first number $j$ in each line is the $j$-th operation of the job $i$. The second number $m$ is the number of candidate machines for this operation. The following $m\times 2$ numbers are the candidate machine index and the corresponding processing time respectively, in pairs of two, a total of $m$ groups.

You can also check the ```DataReadDHFJSP.m``` code, which comes from the source code of DQCE that proposes this benchmark.

## Example
10J2F instance: 10 jobs and 2 factories

```
10 2 5

1 1 5
1 5 1 5 2 18 3 12 4 18 5 15 
2 3 1 18 2 17 3 11 
3 3 1 16 4 17 5 12 
4 4 1 19 2 16 3 8 4 11 
5 2 1 12 4 19 

// Because it is too long, it is omitted here.
```

The first line indicates that there are 10 jobs, 2 factories and 5 machines.

In the case of the first factory processing the first job, a total of 5 operations can be processed. 

The 1st operation can be processed by 5 machines, the 2nd operation can be processed by 3 machines, and so on. The first operation takes 5 units of time when processed by the 1st machine, and 18 units of time when processed by the 2nd machine, and so on.

## References

[https://ieeexplore.ieee.org/document/10242078](https://ieeexplore.ieee.org/document/10242078)