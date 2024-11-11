Class {
	#name : 'Visualizer',
	#superclass : 'Object',
	#instVars : [
		'robots'
	],
	#category : 'Drones-Visualization',
	#package : 'Drones-Visualization'
}

{ #category : 'display' }
Visualizer >> displayCanvas [
	| elements subelements canvas highlighElements |
	subelements := OrderedCollection new.

	"self entities do: [ :each | subelements add: each ]."

	elements := self robots
		            collect: [ :m |
			            RSCircle new
				            size: 10;
				            model: m;
				            position: m point ]
		            as: RSGroup.

	"highlight node by the number of dependencies"
	highlighElements := elements.

	highlighElements do: [ :each |
		each @ (RSPopup text: each model label).
		each @ (RSMenuActivable new menuDo: [ :aMenuMorph :anRSBox |
			 aMenuMorph
				 add: 'Inspect'
				 target: each model
				 selector: #inspect
				 argument: #(  ) ]) ].
	"highlighElements @ RSPopup @ RSDraggable ."

	canvas := RSCanvas new.

	canvas addAll: highlighElements.

	RSForceBasedLayout new
		charge: -200;
		on: highlighElements.
	"end edges setup"

	canvas @ RSCanvasController.

	^ canvas
]

{ #category : 'display' }
Visualizer >> displayChart [
	|x y c p|
	
	x := OrderedCollection new.
	y := OrderedCollection new.
	
	1 to: (robots size) do: [ :i |
		x add: (robots at:i) point x.
		y add: (robots at:i) point y.
	].

	c := RSChart new.
	p := RSScatterPlot new x: x y: y.
	p color: Color blue translucent.
	c add: p.

	c addDecoration: (RSHorizontalTick new doNotUseNiceLabel asFloat: 3).
	c addDecoration: RSVerticalTick new.

	^c
]

{ #category : 'initialization' }
Visualizer >> initialize [ 
	super initialize .
	robots := OrderedCollection new.
	
]

{ #category : 'accessing' }
Visualizer >> robots [

	^ robots
]

{ #category : 'accessing' }
Visualizer >> robots: anObject [

	robots := anObject
]
