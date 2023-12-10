"
A 2D grid
"
Class {
	#name : #Grid2D,
	#superclass : #CTGrid,
	#category : #AdventOfCode2023
}

{ #category : #accessing }
Grid2D >> at: aPoint [
	aPoint isPoint ifTrue: [^ self atRow: aPoint x atColumn: aPoint y ].
	^ self contents at: aPoint 
]

{ #category : #visualization }
Grid2D >> visualize [
 	| c |
	c := RSCanvas new.
	self withIndicesDo:  [ :each :row :col | 
		| circle labeledCircle |
		circle :=  RSCircle new size: 30.
		circle @ (RSPopup new
		text: [ :e | row@col];
		yourself).
		circle color: Color pink muchLighter.
		labeledCircle := { circle . RSLabel new color: Color black; text: each } asGroup 
			asShapeFor: each.
		c add: labeledCircle ].
	RSGridLayout new lineItemsCount: self rowCount ; on: c shapes.
	c @ RSCanvasController.
	^ c canvas
]

{ #category : #visualization }
Grid2D >> visualizeWithHighlight: aBlock [
	| c |
	c := RSCanvas new.
	self withIndicesDo:  [ :each :row :col | 
		| circle labeledCircle |
		circle :=  RSCircle new size: 30.
		circle @ (RSPopup new
		text: [ :e | row@col];
		yourself).
		circle color: ((aBlock value: each) ifTrue: Color pink ifFalse: Color pink muchLighter).
		labeledCircle := { circle . RSLabel new color: Color black; text: each } asGroup 
			asShapeFor: each.
		c add: labeledCircle ].
	RSGridLayout new lineItemsCount: self rowCount ; on: c shapes.
	c @ RSCanvasController.
	^ c canvas
]
