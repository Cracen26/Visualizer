Class {
	#name : 'ExampleDroneVisualization',
	#superclass : 'Object',
	#category : 'Drones-Visualization',
	#package : 'Drones-Visualization'
}

{ #category : 'running' }
ExampleDroneVisualization class >> run [
	|robots visualizer|
	robots := OrderedCollection new.
	1 to: 10 do: [ :i |
			robots add: (Robot new label: i)
		 ].
	
	visualizer := Visualizer new robots: robots .

	^ visualizer displayStructure .
]
