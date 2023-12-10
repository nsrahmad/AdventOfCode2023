"
Day 1 of Advent of code 2023
"
Class {
	#name : #Day1,
	#superclass : #Object,
	#category : #AdventOfCode2023
}

{ #category : #functions }
Day1 class >> part1 [
	| data line parsedData asNumbers|

data := 'input-day-1.txt' asFileReference readStreamDo: [ :stream | stream upToEnd  ].

line := #digit asParser / #space asParser.

parsedData := (line matchesIn: data) splitOn: Character lf.

"Splitting seems to add an extra empty array at the end."
parsedData removeAt: 1001.

asNumbers := parsedData collect: [ :each | ((each first asString), (each last asString)) asNumber ].

^ asNumbers inject: 0 into: [ :sum :each | sum + each ].
]

{ #category : #functions }
Day1 class >> part2 [
| data wordDigit line parsedData asNumbers|

data := 'input-day-1.txt' asFileReference readStreamDo: [ :stream | stream upToEnd  ].

wordDigit := ('one' asParser ==> [ :str | $1 ]) 
	/ ('two' asParser ==> [ :str | $2 ])
	/ ('three' asParser ==> [ :str | $3 ])
	/ ('four' asParser ==> [ :str | $4 ]) 
	/ ('five' asParser ==> [ :str | $5 ])  
	/ ('six' asParser ==> [ :str | $6 ])  
	/ ('seven' asParser ==> [ :str | $7 ])  
	/ ('eight' asParser ==> [ :str | $8 ])  
	/ ('nine' asParser ==> [:str | $9]).

line := (wordDigit / #digit asParser) / #lf asParser.

parsedData := (line matchesIn: data) splitOn: Character lf.

"Splitting seems to add an extra empty array at the end."
parsedData removeAt: 1001.

asNumbers := parsedData collect: [ :each | ((each first asString), (each last asString)) asNumber ].

^ asNumbers inject: 0 into: [ :sum :each | sum + each ].
]
