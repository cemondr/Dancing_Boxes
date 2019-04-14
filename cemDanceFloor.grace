import "cembox" as cembox
import "cemDancingBox" as cemDancingBox
import "objectdraw" as od
import "animation" as animation

class cemDanceFloor{
    
    def app is public = od.graphicApplicationSize(500@500)
    def animate is public = animation
    app.startGraphics
    
    
    method setAndReadyDanceFloor(dancer1,dancer2){
        dancer1.showOn(app.canvas)
        dancer2.showOn(app.canvas)
    }
    
    method leadDancersInFloor(dancer1,dancer2,pointx,pointy){
        dancer1.moveTo(pointx@pointy)
        dancer2.moveTo(pointx@pointy)
    }
    
}