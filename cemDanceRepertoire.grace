// danceRepertoire class represents the danceRoutines the objects currently know. Each
// dancingBox object will have an instance of this class. 

import "cembox" as cembox
class danceRepertoire{
    
    var currentDanceRoutines := 2
    var moveCount:= 0
    
    // This method organizes the moves in a logical order for the mousepress event
    //..determines when the objects duties will change (currently set to ever 8 press)
    method circleDanceMouseRoutine(location:Point,partner1,partner2){     
        if((((moveCount/8) % 2) ≥ 1)) then {
            partner1.moveTo(location) // Leader moves first
            partner2.followerCircleAroundMove(partner1)//  Follower reacts
            incrementMoves(partner1,partner2)
        }else {
            partner2.moveTo(location) //Leader moves first
            partner1.followerCircleAroundMove(partner2) //Follower reacts
            incrementMoves(partner1,partner2)
        }
    }
    
    
    // This method organizes the moves in a logical order. ChangedLeadAt determines when
    // ... the objects' duties will change (leading vs following dancing object).
    //... 100 moves is equal to 1 completion of a diamond shape(100). 

    method circleDanceAnimationRoutine(partner1,partner2,changeLeadAt){
        if ((changeLeadAt % 100) == 0) then {
            if((((moveCount / changeLeadAt) % 2) > 1)) then {
                partner1.leaderMove //Leader moves first
                partner2.followerCircleAroundMove(partner1) // Follower reacts
                incrementMoves(partner1,partner2)
            }else{
                partner2.leaderMove
                partner1.followerCircleAroundMove(partner2)
                incrementMoves(partner1,partner2)
            }
        }else {print "Lead should be a multiple of 100"}
    }
    
    //Increments the moveCount on all 3 objects. 
    method incrementMoves(partner1,partner2){
        partner1.incrementMoveCount
        partner2.incrementMoveCount
        moveCount := moveCount +1
    }
    
    
}