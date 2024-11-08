Class {
	#name : 'BaselineOfDronesVisualization',
	#superclass : 'Object',
	#category : 'BaselineOfDronesVisualization',
	#package : 'BaselineOfDronesVisualization'
}

{ #category : 'baselines' }
BaselineOfDronesVisualization >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
				spec
					package: 'Drones-Visualization'.
			 ]
]
