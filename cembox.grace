import "objectdraw" as od
// THE GIVEN BOX CLASS (added myname field and revealmyname method)

method named(name) {
    object {
        var origin is readable := 0@0
        var heading is public := 0
        var extent is public := defaultExtent
        def noRect = object {
            inherit Singleton.new
            def asString is public = "noRect"
            method moveTo { }
            method visible:=(_) { } 
        }
        var myRect := noRect
        var myname:= name

        method defaultExtent {
            20@20
        }

        method turnBy(degrees) {
            heading := heading + degrees
        }

        method showOn(canvas) {
            if (noRect == myRect) then {
                myRect := od.framedRectAt(origin) size(extent) on (canvas)
            }
            myRect.visible := true
        }

        method hide {
            myRect.visible := false
        }

        method moveTo(location:Point) {
            origin := location
            if (noRect ≠ myRect) then { myRect.moveTo(origin) }
        }

        method moveBy(increment:Point) {
            moveTo(origin + increment)
        }

        method growBy(increment:Point) {
            extent := extent + increment
            myRect.setSize(extent.x, extent.y)
        }

        method asString {
            "a box named {name}"
        }
        
        method revealmyname{
            return myname
        }
    }
}
