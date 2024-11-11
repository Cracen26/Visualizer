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
	1 to: 5 do: [ :i |
			robots add: (Robot new label: i)
		 ].
	
	visualizer := Visualizer new robots: robots .

	"^ visualizer displayChart ."
	^ visualizer displayCanvas .
]
