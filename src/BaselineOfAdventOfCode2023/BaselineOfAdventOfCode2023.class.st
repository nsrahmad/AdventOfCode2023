Class {
	#name : #BaselineOfAdventOfCode2023,
	#superclass : #BaselineOf,
	#category : #BaselineOfAdventOfCode2023
}

{ #category : #baseline }
BaselineOfAdventOfCode2023 >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self
				declareContainersGridOn: spec;
				declarePetitParserOn: spec;
				declareRoassal3On: spec.

			spec
				package: 'AdventOfCode2023' with: [ spec requires: #('Roassal3') ].
 ]
]

{ #category : #'external projects' }
BaselineOfAdventOfCode2023 >> declareContainersGridOn: spec [
	spec
		baseline: 'ContainersGrid'
		with: [ spec repository: 'github://Ducasse/Containers-Grid/src' ]
]

{ #category : #'external projects' }
BaselineOfAdventOfCode2023 >> declarePetitParserOn: spec [
	spec
		baseline: 'PetitParser'
		with: [ spec repository: 'github://moosetechnology/PetitParser:v3.x.x/src' ]
]

{ #category : #'external projects' }
BaselineOfAdventOfCode2023 >> declareRoassal3On: spec [
	spec
		baseline: 'Roassal3'
		with: [ spec repository: 'github://ObjectProfile/Roassal3/src'; loads: #('Full') ]
]
