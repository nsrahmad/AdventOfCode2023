# Advent of Code 2023
This repository contains my solutions for Advent of Code 2023. I am learning 
Pharo so quality of code isn't great. To load the code with all dependencies in 
a fresh pharo image (>= v11), do:
```smalltalk
Metacello new
    baseline: 'AdventOfCode2023';
    repository: 'github://nsrahmad/AdventOfCode2023';
    load.
```
Each Day is represented as a class, with three class side methods `input`, 
`part1`, and `part2`. `input` obviously has the contents of input given with the
puzzle. you can get the Solution for each particular day by typing `Day1 part1`
into playground and doint `Print it` or `Inspect it` on it.

I am also writing blogposts for each day:
- [Day1](https://nsrahmad.github.io/posts/advent-of-code-2023-using-pharo-smalltalk-day-1/)
- [Day2](https://nsrahmad.github.io/posts/advent-of-code-2023-using-pharo-smalltalk-day-2/)