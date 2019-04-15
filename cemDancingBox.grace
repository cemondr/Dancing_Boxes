// dancingBox class is a subclass of the "cembox" 
import "cembox" as cembox

class dancingbox (name:String){
    inherit cembox.named(name)
    
    var currentlyPartnered:= false
    var moveCount:= 0;
    var currentPartner
    
    //Objects CANNOT dance without getting "permission" from other objects.They can only be
    // paired when both objects are available. 
    method AskToDanceWith(candidate){

        if (isPartnered ==false) then{ print "{name} is asking {candidate.revealmyname} for a dance"
            if(candidate.isPartnered == false) then {
                print "{candidate.revealmyname} accepted {name}'s request"
                danceWith(candidate)
                return true;
            }else{
                print "{candidate.revealmyname} is already partnered"
                return false;
            }
        }else{
            print "{name} can't ask for a dance as s/he is currently partnered"
            return false;
        }
    }
    
    //This method sets up the pairing of the objects
    method danceWith (dancePartner){
        currentPartner:= dancePartner
        currentlyPartnered:= true
        dancePartner.receivePartner(self)
    }
    
    //This method checks whether an object is already paired with another
    method isPartnered {
        return currentlyPartnered
    }
    
    // Helper method that helps with the pairing up of the objects
    method receivePartner (somepartner) {
        currentlyPartnered:= true
        currentPartner:= somepartner
    }

    //This method handles the MousePressEvents by helping objects decide which
    // ... one will be leading the dance. For mouse press events the leader changes
    //...in ever 8 moves.
    method MouseRoutine(location:Point){     
        print "moveCount: {moveCount} remainder: {(moveCount/8)%2}"
        if((currentlyPartnered == true)&& (((moveCount/8) % 2) ≥ 1)) then {
            moveTo(location)
            circleAroundMove
            incrementMoveCount
            currentPartner.incrementMoveCount
        }else{
            currentPartner.moveTo(location)
            currentPartner.circleAroundMove
            currentPartner.incrementMoveCount
            incrementMoveCount
        }
    }

    // This method handles the Animation Routine by helping objects decide which
    //...one will be the leading the dance. For animated dances the leader changes
    //... in every completion of a diamond shape(100 moves)
    method AnimationRoutine(changeLeadAt){
        if((changeLeadAt % 100) == 0) then {
            if((currentlyPartnered == true) && (((moveCount / changeLeadAt) % 2) > 1)) then {
                determineNextStep
                circleAroundMove
                incrementMoveCount
                currentPartner.incrementMoveCount
            }else{
                currentPartner.determineNextStep
                currentPartner.circleAroundMove
                incrementMoveCount
                currentPartner.incrementMoveCount
            }
        }
    }
    
    //This helper method determines the next step for the leading object (and moves)
    method determineNextStep{
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
    
    method revealMyPartner{
        print "{revealmyname} my partner is: {currentPartner.revealmyname}"
    }

    // This method determines the next step for the following object (and moves it)
    method circleAroundMove{
        var targetx
        var targety
        if ((moveCount % 4) == 0) then {
            targetx := origin.x+22
            targety := origin.y+22
        } elseif {(moveCount % 4) == 1} then {
            targetx := origin.x+22
            targety := origin.y-22
        } elseif {(moveCount % 4) ==2} then{
            targetx := origin.x-22
            targety := origin.y-22
        }elseif {(moveCount % 4) == 3} then {
            targetx := origin.x-22
            targety := origin.y+22
        }
        currentPartner.moveTo(targetx@targety)
    }
    
    //increments MoveCount
    method incrementMoveCount{
        moveCount:= moveCount+1
    }
}

