# Configuration file for awesome
#
# First physical screen
screen 0
{
    general
    {
        # Windows border size in pixel
        border = 1
        # Pixels number before collapsing window border and screen border
        snap = 5
        # Respect windows minimal geometry
        resize_hints = true
        # Opacity for unfocused windows (with xcompmgr)
        opacity_unfocused = 1.0
        # Should focus switching move pointer
        focus_move_pointer = false
        # Allow floating windows to be below others
        allow_lower_floats = false
        # Status bar font (Xft)
        font = "Ubuntu-10"
    }#end general
    
    colors
    {
        # Normal border color
        normal_border = "#cdc7be"
        # Normal background color (statusbar)
        normal_bg = "#111111"
        # Normal foreground color (statusbar)
        normal_fg = "#eeeeee"
        # Focused border color
        focus_border = "#e38544"
        # Focused background color (statusbar)
        focus_bg = "#6666ff"
        # Focused foreground color (statusbar)
        focus_fg = "#ffffff"
    }#end colors
    
    #top, left, bottom, right
    statusbar{position = "top"}
    
    #These are what is actually displayed on the status bar.
    #Here for example, "1:terminal" is displayed instead of the default "one"
    tags { 
        tag 1:terminal {layout = "tile" mwfact = .5}
        tag 2:web {layout = "floating"} 
        tag 3:vim {layout = "tile"}
        tag 4:files {layout = "tile"}
        tag five {layout = "tile"}
        tag six {layout = "tile"}
    }#end tags
    
    layouts {
        layout tile {symbol = "[]="}
        layout tileleft {symbol = "=[]"}
        layout max {symbol = "[ ]"}
        layout floating {symbol = "><>"}
    }#end layouts
}#end screen 0

#This section defines in which tag a program will open, as well as whether it is tile, max, or float.
rules {
    rule {name = "Gimp" tags = "nine" float = true}
    rule {name = "wifi-radar" float = true tags = "2:web"}
    rule {name = "emelfm" float = true tags = "4:files"}

}#end rules
## Note that "Mod1" is normally the "Alt" key, and that "Mod3" is the "super" or "Windows" key
# Mouse buttons bindings
mouse {
    # For click on tag
    tag {button = "1" command = "tag_view"}
    tag {button = "1" modkey = {"Mod3"} command = "client_tag"}
    tag {button = "3" command = "tag_toggleview"}
    tag {button = "3" modkey = {"Mod3"} command = "client_toggletag"}
    tag {button = "4" command = "tag_viewnext"}
    tag {button = "5" command = "tag_viewprev"}
    
    # For click on layout symbol
    layout {button = "1" command = "tag_setlayout" arg = "+1"}
    layout {button = "4" command = "tag_setlayout" arg = "+1"}
    layout {button = "3" command = "tag_setlayout" arg = "-1"}
    layout {button = "5" command = "tag_setlayout" arg = "-1"}
    
    # For click on root window
    root {button = "3" command = "spawn" arg = "exec urxvt"}
    root {button = "4" command = "tag_viewnext"}
    root {button = "5" command = "tag_viewprev"}

    # For click on client windows
    client {modkey = {"Mod3"} button = "1" command = "client_movemouse"}
    client {modkey = {"Mod3"} button = "2" command = "client_zoom"}
    client {modkey = {"Mod3"} button = "3" command = "client_resizemouse"}
}#end mouse

# Keys bindings
keys {
 
    #These are where you can define shortcuts to launch programs.
    #You can see that I have added "sudo" to some, this method will work with other commands as well.
    key {modkey = {"Mod3", "Control"} key = "Return" command = "spawn" arg = "exec gnome-terminal"}
    key {modkey = {"Mod3"} key = "r"                 command = "spawn" arg = "exec sudo wifi-radar"}
    key {modkey = {"Mod3"} key = "f"                 command = "spawn" arg = "exec firefox"}
    key {modkey = {"Mod3"} key = "v"                 command = "spawn" arg = "exec sudo gvim"}
    key {modkey = {"Mod3"} key = "f"                 command = "spawn" arg = "exec sudo emelfm"}
    key {modkey = {"Mod3"} key = "Return"            command = "spawn" arg = "exec gnome-terminal"}  
    ###############################################################################
 
    #Bindings for managing individual windows within each tag.
    key { modkey = {"mod4"} key = "j"                command = "client_focusnext" }
    key { modkey = {"mod4"} key = "k"                command = "client_focusprev" }
    key { modkey = {"mod4", "Control"} key = "j"     command = "client_swapnext" }
    key { modkey = {"mod4", "Control"} key = "k"     command = "client_swapprev" }
    key { modkey = {"mod4"} key = "c"                command = "client_kill" }
    key { modkey = {"mod4"} key = "m"                command = "client_togglemax" }
    key { modkey = {"mod4", "Shift"} key = "m"       command = "client_toggleverticalmax" }
    key { modkey = {"mod4", "Control"} key = "m"     command = "client_togglehorizontalmax" }
    key { modkey = {"mod4"} key = "f"                command = "client_togglefloating" }
 
    #Bindings to switch between tags
    key { modkey = {"mod4"} key = "Right"            command = "tag_viewnext" }
    key { modkey = {"mod4"} key = "Left"             command = "tag_viewprev" }
    key { modkey = {"mod4"} key = 1                  command = "tag_view" arg = 1 }
    key { modkey = {"mod4"} key = 2                  command = "tag_view" arg = 2 }
    key { modkey = {"mod4"} key = 3                  command = "tag_view" arg = 3 }
    key { modkey = {"mod4"} key = 4                  command = "tag_view" arg = 4 }
    key { modkey = {"mod4"} key = 5                  command = "tag_view" arg = 5 }
    key { modkey = {"mod4"} key = 6                  command = "tag_view" arg = 6 }

    #View multiple tags in current one
    key {modkey = {"Shift", "Control"} key = 1       command = "tag_toggleview" arg = 1}
    key {modkey = {"Shift", "Control"} key = 2       command = "tag_toggleview" arg = 2}
    key {modkey = {"Shift", "Control"} key = 3       command = "tag_toggleview" arg = 3}
    key {modkey = {"Shift", "Control"} key = 4       command = "tag_toggleview" arg = 4}
    key {modkey = {"Shift", "Control"} key = 5       command = "tag_toggleview" arg = 5}
    key {modkey = {"Shift", "Control"} key = 6       command = "tag_toggleview" arg = 6}

##################################################################################################################
 ###These are addition bindings that I don't use.
 ###Perhaps someone else could fill them in?
 #key { modkey = {"Mod1", "Control"} key = "h"          command = "tag_setnmaster" arg = "+1" }
 #key { modkey = {"Mod1", "Control"} key = "l"          command = "tag_setnmaster" arg = "-1" }
 #awesome
 #key { modkey = {"Mod1", "Control"} key = "r"          command = "exec" arg = "/usr/local/bin/awesome" }
 #key { modkey = {"Mod1", "Control"} key = "q"          command = "quit" }
 #key { modkey = {"Mod1", "Control"} key = "b"          command = "statusbar_toggle" }
 
 #additionally view tag <nr>: Mod1 + Shift + Number
 #inc/dec number of columns
 #key { modkey = {"Mod1", "Shift"} key = "h"            command = "tag_setncol" arg = "-1" }
 #key { modkey = {"Mod1", "Shift"} key = "l"            command = "tag_setncol" arg = "+1" }
 #number of master clients
 #key { modkey = {"Mod1", "Control"} key = "j"         command = "screen_focusnext" }
 #key { modkey = {"Mod1", "Control"} key = "k"         command = "screen_focusprev" }
 #key { modkey = {"Mod1",} key = "t"                   command = "client_settrans" arg = "+0.10" }
 #key { modkey = {"Mod1"} key = "t"                    command = "client_settrans" arg = "-0.10" }
 #key { modkey = {"Mod1", "Shift"} key = "Return"      command = "client_zoom" arg="-0.10" }
 } #end keys

