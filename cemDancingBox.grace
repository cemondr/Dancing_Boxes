import "cembox" as cembox

class dancingbox (name:String){
    inherit cembox.named(name)
    
    var currentlyPartnered:= false
    var moveCount:= 0;
    var currentPartner := "empty"
    
    //Objects CANNOT dance without getting permission from other objects
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
    method danceWith (dancePartner){
        currentPartner:= dancePartner.revealmyname
        currentlyPartnered:= true

        dancePartner.receivePartner(revealmyname)
    }

    method isPartnered {
        return currentlyPartnered
    }

    method receivePartner (somename:String) {
        currentlyPartnered:= true
        currentPartner:= somename
    }

    method MouseRoutine(partner, location:Point){
        if(currentlyPartnered == true) then {
            moveTo(location)
            moveCount:= moveCount+1
            circleAroundMove(partner)
        }else{
            moveCount:= 0
            currentPartner:= "empty"
            print "Dance routines cannot be accomplished without a partner"
        }
    }

    method AnimationRoutine(partner){
        if(currentlyPartnered == true) then {
            if((moveCount % 100) < 25) then {
                moveBy(2@4)
            }elseif {((moveCount % 100) ≥ 25) && ((moveCount % 100) < 50)} then{
                moveBy(-2@4)
            } elseif{((moveCount % 100) ≥ 50) && ((moveCount % 100) < 75)} then{
                moveBy(-2@ -4)
            }elseif{((moveCount % 100) ≥ 75) && ((moveCount % 100)< 100)} then{ 
                moveBy(2@ -4)
            }
            moveCount:= moveCount+1
            circleAroundMove(partner)
        }else{
            print "Dance routines cannot be accomplished without a partner"
        }
    }

    method circleAroundMove(partner){
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
        partner.moveTo(targetx@targety)
    }
}

