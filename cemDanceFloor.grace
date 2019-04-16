//DanceFloor class creates a dancefloor object that is tasked with initializing
// the graphics and object placement on canvas.

import "cembox" as cembox
import "cemDancingBox" as cemDancingBox
import "objectdraw" as od
import "animation" as animation

class cemDanceFloor{
    
    def app is public = od.graphicApplicationSize(500@500)
    def animate is public = animation
    app.startGraphics // Starts the graphics
    
    // Puts the dancingboxes on the canvas
    method setAndReadyDanceFloor(dancer1,dancer2){
        dancer1.showOn(app.canvas)
        dancer2.showOn(app.canvas)
        print "Ladies and Gentlemen: {dancer1.revealMyName} and {dancer2.revealMyName}!"
    }
    
    //Puts the dancingboxes at a particular spot in the canvas
    method leadDancersInFloor(dancer1,dancer2,pointx,pointy){
        dancer1.moveTo(pointx@pointy)
        dancer2.moveTo(pointx@pointy)
    }
    
    
    
}