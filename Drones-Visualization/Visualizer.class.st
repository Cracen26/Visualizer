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
Visualizer >> displayStructure [
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
