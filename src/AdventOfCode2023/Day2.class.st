"
Day 2 of the Advent of Code
"
Class {
	#name : #Day2,
	#superclass : #Object,
	#category : #AdventOfCode2023
}

{ #category : #functions }
Day2 class >> part1 [ 
| input aColor anInteger aCube aSet aGame gamesCollection maxRGBinSingleGame |

input := 'input-day-2.txt' asFileReference readStreamDo: [ :stream | stream upToEnd  ].

aColor := 'red' asParser
	/ 'green' asParser
	/ 'blue' asParser ==> [ :c | Color named: c ] .
	
anInteger := #digit asParser plus token flatten ==> [ :d | d asNumber ].
aCube := anInteger , aColor trim.
aSet := ((aCube , ',' asParser trim optional ==> [:c | c allButLast]) plus
	, ';' asParser optional) ==> [ :set | set at: 1 ].
aGame := ('Game ' asParser, anInteger , ':' asParser)
	==> [:game | game at: 2], aSet trim plus.

gamesCollection := (aGame  matchesSkipIn: input).

maxRGBinSingleGame := [ :game |
	| dict |
	dict := Dictionary new.
	dict at: (Color named: 'red') put: 0;
		at: (Color named: 'green') put: 0;
	 	at: (Color named: 'blue') put: 0.

	(game at: 2) do: [ :each | each do: [ :c | ((dict at: (c at: 2)) > (c at: 1))
		ifFalse: [ dict at: (c at: 2) put: (c at: 1) ]]].

	{ (game at: 1) . dict }.
].

^ ((((gamesCollection collect: [ :each | maxRGBinSingleGame value: each ])
	reject: [ :each | ((each at: 2) at: (Color named: 'red')) > 12 ])
	reject: [ :each | ((each at: 2) at: (Color named: 'green')) > 13 ])
	reject: [ :each | ((each at: 2) at: (Color named: 'blue')) > 14 ])
	inject: 0 into: [:sum :each | sum + (each at: 1) ]
]

{ #category : #functions }
Day2 class >> part2 [ 
| input aColor anInteger aCube aSet aGame gamesCollection maxRGBinSingleGame |

input := 'input-day-2.txt' asFileReference readStreamDo: [ :stream | stream upToEnd  ].

aColor := 'red' asParser
	/ 'green' asParser
	/ 'blue' asParser ==> [ :c | Color named: c ] .
	
anInteger := #digit asParser plus token flatten ==> [ :d | d asNumber ].
aCube := anInteger , aColor trim.
aSet := ((aCube , ',' asParser trim optional ==> [:c | c allButLast]) plus
	, ';' asParser optional) ==> [ :set | set at: 1 ].
aGame := ('Game ' asParser, anInteger , ':' asParser)
	==> [:game | game at: 2], aSet trim plus.

gamesCollection := (aGame  matchesSkipIn: input).

maxRGBinSingleGame := [ :game |
	| dict |
	dict := Dictionary new.
	dict at: (Color named: 'red') put: 0;
		at: (Color named: 'green') put: 0;
	 	at: (Color named: 'blue') put: 0.

	(game at: 2) do: [ :each | each do: [ :c | ((dict at: (c at: 2)) > (c at: 1))
		ifFalse: [ dict at: (c at: 2) put: (c at: 1) ]]].

	{ (game at: 1) . dict }.
].

^ ((gamesCollection collect: [ :each | maxRGBinSingleGame value: each ])
	collect: [ :each | ((each at: 2) values) inject: 1 into:[:prod :e| prod * e  ]]) inject: 0 into: [ :sum :e | sum + e ].
]
