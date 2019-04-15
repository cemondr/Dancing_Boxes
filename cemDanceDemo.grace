import "cembox" as cembox
import "objectdraw" as od
import "cemDancingBox" as cemDancingBox
import "cemDanceFloor" as cemDanceFloor

//This demo will create several objects of the class cemDancingBox. Will unofficially
//... test the objects' 'permission' functionality. After that The dance routine will
//..first be animated (about 200moves/15 seconds) and then it will switch to the
//..mousePressDo mode

def Joe = cemDancingBox.dancingbox("Joe")
def Jill= cemDancingBox.dancingbox("Jill")
def Tom = cemDancingBox.dancingbox("Tom")
def Mawr = cemDancingBox.dancingbox("Mawr")
def dancefloor = cemDanceFloor.cemDanceFloor

// This is an unofficial little test that ensures current rules are are working
Mawr.AskToDanceWith(Tom)
Tom.AskToDanceWith(Jill)
Joe.AskToDanceWith(Mawr)


var answer := Joe.AskToDanceWith(Jill)

Jill.extent := 10@10 

if (answer == true) then {
    dancefloor.setAndReadyDanceFloor(Joe,Jill)
    dancefloor.leadDancersInFloor(Joe,Jill,225,225)
    var keepLightsOnFor := 0
    
    // Animated Dance-2 diamond shaped sequence (lead changes after the end of first sequence)
    dancefloor.animate.while{keepLightsOnFor < 200} pausing (100) do{
        Joe.AnimationRoutine(100)
        keepLightsOnFor := keepLightsOnFor+1 
    }
    
    // MousePress Dance (lead changes in every 8 moves)
    dancefloor.app.onMousePressDo { event ->
        Joe.MouseRoutine(event.at)
    }    
}
