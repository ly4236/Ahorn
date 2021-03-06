using Gtk, Gtk.ShortNames
using Maple

function createNewMap(widget)
    button, name = input_dialog("Enter package name for new map", "11-Example", (("Cancel", 0), ("Create Map", 1)), window)

    if button == 1
        global loadedFilename = nothing
        global selectedRoom = nothing
        global loadedRoom = nothing

        global loadedMap = Map(name)
        
        updateTreeView!(roomList, getTreeData(loadedMap))
        
        setproperty!(window, :title, "$baseTitle - $name")
    end
end