// dancingBox class is a subclass of the "cembox". Objects of this class need to be
// paired with another object of the same class before they can start a dance routine.
// In order to pair, they need to AskToDanceWith, and their requests are only accepted
// if the asked object is not already partnered. 
import "cembox" as cembox
import "cemDanceRepertoire" as dr

class dancingbox (name:String){
    inherit cembox.named(name)
    
    var currentlyPartnered:= false
    var moveCount:= 0;
    var currentPartner := "N/A"
    var repertoire := dr.danceRepertoire
    
    //Objects CANNOT dance without getting "permission" from other objects.They can only be
    // paired when both objects are available. 
    method AskToDanceWith(candidate){

        if (isPartnered ==false) then{ print "{name} is asking {candidate.revealMyName} for a dance"
            if(candidate.isPartnered == false) then {
                print "{name} and {candidate.revealMyName} are now partnered "
                danceWith(candidate)
                return true;
            }else{
                print "{candidate.revealMyName} is already partnered"
                return false;
            }
        }else{
            print "{name} can't ask for a dance as s/he is currently partnered"
            return false;
        }
    }
    
    //This method sets up the pairing of the objects. It is only called from 'AskToDanceWith'
    // ...method and only if the asked object is currently partner-free
    method danceWith (dancePartner){
        currentPartner:= dancePartner
        currentlyPartnered:= true
        dancePartner.receivePartner(self)
    }
    
    //This method checks whether an object is already paired with another
    method isPartnered {
        return currentlyPartnered
    }
    
    // Helper method that helps with the pairing up of the objects. Used only when 
    // ..the object is asked for a dance by another object.
    method receivePartner (somepartner) {
        currentlyPartnered:= true
        currentPartner:= somepartner
    }
    
    // Drops the current partner (dropping side)
    method dropPartner{
        
        print "{name} and {currentPartner.revealMyName} are now DEPARTNERED!"
        currentPartner.dePartner
        currentlyPartnered := false
        currentPartner:= "N/A"
    }
    
    // Drops the current partner (dropped side)
    method dePartner{
        currentPartner:= "N/A"
        currentlyPartnered := false;    
    }
    
    //This helper method determines the next step for the "leading dancing object"...
    //... and moves it.
    method leaderMove{
        if(((moveCount % 100) < 25)) then {
            moveBy(2@4) 
        }elseif {((moveCount % 100) ≥ 25) && ((moveCount % 100) < 50)} then{
            moveBy(-2@4)  
        } elseif{((moveCount % 100) ≥ 50) && ((moveCount % 100) < 75)} then{
            moveBy(-2@ -4) 
        }elseif{((moveCount % 100) ≥ 75) && ((moveCount % 100)< 100)} then{ 
            moveBy(2@ -4) 
        }
    }
    
    // reveals the current Partner the dancing object paired with
    method revealMyPartner{
        print "{revealMyName} my partner is: {currentPartner.revealMyname}"
    }

    // This method indirectly determines the next step(with a helper method) for the 
    //"following dancing object" and..moves it according to the "leading dancing object"
    method followerCircleAroundMove(leader){
        var tPoint:= followerCircleAroundDetermine(leader)
        moveTo(tPoint)
    }
    
    // helper method that determines the next step for the "following dancing object"
    method followerCircleAroundDetermine(leader){
        var targetx
        var targety
        var tPoint
        if ((moveCount % 4) == 0) then {
            targetx := leader.origin.x+22
            targety := leader.origin.y+22
        } elseif {(moveCount % 4) == 1} then {
            targetx := leader.origin.x+22
            targety := leader.origin.y-22
        } elseif {(moveCount % 4) ==2} then{
            targetx := leader.origin.x-22
            targety := leader.origin.y-22
        }elseif {(moveCount % 4) == 3} then {
            targetx := leader.origin.x-22
            targety := leader.origin.y+22
        }
        tPoint:= targetx@targety
        return tPoint
    }
    
    //This method initiates the Animation of the Circle Dance by selecting it..
    //..from the repertoire
    method initiateCircleDanceAnimation(changeLeadAt){
        repertoire.circleDanceAnimationRoutine(self,currentPartner,changeLeadAt)
    }
    
    //This method initiates the Mouse Press Circle Dance by selecting it from ...
    //..the repertoire.
    method initiateCircleDanceMouse(location:Point){
        repertoire.circleDanceMouseRoutine(location,self,currentPartner)
    }
    
    //increments MoveCount
    method incrementMoveCount{
        moveCount:= moveCount+1
    }
}
