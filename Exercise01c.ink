/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
 
 
 Variable Checking:
 Equality: "Spot" == "Spot"
 Not Equality: 1 != 2
 Greater: >
 Less: <
 Great or equal: >=
 Less or equal: <=
 
 
*/

VAR health = 5
VAR pet_name = ""
VAR torches = 0
VAR mask = 1
VAR rock = 0
VAR rose = 0

-> memory


== memory ==
Before you stands the cavern of Josh. You wish your childhood pet was with you now. The cave might be less intimidating then. What was your pet's name?

* [Charlie] 
    ~ pet_name = "Charlie" 
    -> cave_mouth
* [Susan]
    ~ pet_name = "Susan"
    -> cave_mouth
* [Spot]
    ~ pet_name = "Spot"
    -> cave_mouth
    

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west. You decided to bring some water with you in case you'll be exploring for a while, as well as a mask to protect yourself from breathing in potentially harmful dust. 

You made it inside the cave. If only {pet_name} could see you now! {pet_name} loved to go on explorations with you. You are dedicating this journey to {pet_name}. 

You have {torches} torches and {mask} mask. 

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> west_tunnel_lit

{ pet_name == "Spot": Scout would love it here in the west| }

+ [Go Back] -> cave_mouth
-> END


== west_tunnel_lit ==
The light of your torch reveals a beautiful assortment of glowing emerald rocks. You decide to pick one up. Who knows, it may be useful for later? Upon further inspection of this tunnel, you notice two separate pathways.
+ [Pathway 1] -> pathway_1
+ { rock == 0 }[Pick up rock] -> rock_pickup
-> END


== pathway_1 ==
You notice an abstract stone sculpture at the end of this pathway. Upon closer inspection, you notice a hole in the middle of this scultpure with a weighted plate inside of it. It appears that something must be placed on this plate.
-> END


== rock_pickup ==
You now have an glowing rock.
~ rock = rock + 1
* [Go Back] -> west_tunnel_lit


=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch reveals a mysterious garden of glowing roses. You think to yourself, "How are roses growing down here?" The garden of roses peaks your interest, so you decide to explore it more. However you notice it's a little dusty in here. 
+ [Put on mask] -> east_tunnel_1
+ [Continue exploration without mask] -> east_tunnel_2
    
-> END

== east_tunnel_1 == 
Thankfully you brough this mask with you. You put on the mask and continue your journey. But first, the roses are calling your name. Should you pick one up?
+ { rose == 0 }[Pick up rose] -> rose_pickup
+ [Continue exploration] -> continue_exploration
-> END

== east_tunnel_2 ==
You decided that the level of dust in this cave doesn't seem like enough to warrant pulling out your mask. You decide to save it for later in case the dust gets worse.
-> END 

== rose_pickup ==
You now have a beautiful rose. 
~ rose = rose + 1
* [Go Back] -> east_tunnel_1

== continue_exploration ==
You wonder if this rose will be of help to you later in your journey.
-> END

