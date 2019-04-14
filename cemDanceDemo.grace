import "cembox" as cembox
import "objectdraw" as od
import "cemDancingBox" as cemDancingBox
import "cemDanceFloor" as cemDanceFloor

//This demo will create two objects of the class cemDancingBox. The dance routine will
//..first be animated (about 200moves/15 seconds) and then it will switch to the
//..mousePressDo mode

def Joe = cemDancingBox.dancingbox("Joe")
def Jill= cemDancingBox.dancingbox("Jill")
def dancefloor = cemDanceFloor.cemDanceFloor

var answer := Joe.AskToDanceWith(Jill)

if (answer == true) then {
    dancefloor.setAndReadyDanceFloor(Joe,Jill)
    dancefloor.leadDancersInFloor(Joe,Jill,225,225)
    var keepLightsOnFor := 0
    
    dancefloor.animate.while{keepLightsOnFor < 200} pausing (100) do{
        Joe.AnimationRoutine(Jill)
        keepLightsOnFor := keepLightsOnFor+1
        
    }
    
    dancefloor.app.onMousePressDo { event ->
        Joe.MouseRoutine(Jill,event.at)
    }
    
    
}
