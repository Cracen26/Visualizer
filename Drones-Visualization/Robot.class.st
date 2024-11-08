Class {
	#name : 'Robot',
	#superclass : 'Object',
	#instVars : [
		'label',
		'point',
		'range'
	],
	#category : 'Drones-Visualization',
	#package : 'Drones-Visualization'
}

{ #category : 'initialization' }
Robot >> initialize [ 
	super initialize.
	point := (30 atRandom)@(30 atRandom ).
	range := 5
]

{ #category : 'accessing' }
Robot >> label [

	^ label
]

{ #category : 'accessing' }
Robot >> label: anObject [

	label := anObject
]

{ #category : 'accessing' }
Robot >> point [

	^ point
]

{ #category : 'accessing' }
Robot >> point: anObject [

	point := anObject
]

{ #category : 'accessing' }
Robot >> range [

	^ range
]

{ #category : 'accessing' }
Robot >> range: anObject [

	range := anObject
]
