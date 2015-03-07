breed [humans human]
breed [zombies zombie]

humans-own [health hunger speed]
zombies-own [speed hunger]

to setup
  
  
  set-default-shape zombies "zombies"
  set-default-shape humans "person" 
  clear-all 
  create-humans Numbers_of_Humans [
    set size 1.5
    setxy random-xcor random-ycor
    set color white
    set health 10
    set hunger 0
    set speed 1
    
  ]
  create-zombies Numbers_of_Zombies [
    set size 3
    setxy random-xcor random-ycor
    set color green
    set hunger 0
    set speed 0.1
  ]
  repeat 20 [ask patch random-xcor random-ycor [set pcolor red]]
  repeat 4 [ask patch random-xcor random-ycor [set pcolor green]]
  
  
  reset-ticks
end

to go
  tick 
  ask humans [set hunger (hunger + 1)]
  ask humans [if hunger > 100 [set speed (0.1)]]
  ask humans [if hunger <= 100 [set speed (1)]]
  ask zombies [set hunger (hunger + 1)]
  ask zombies [if hunger > 100 [set speed (0.8)]]
  ask zombies [if hunger <= 100 [set speed (0.1)]]
  move-humans
  move-zombies
 ;; combat
  ask patches [combat2]
end

to move-humans
  if( count zombies > 0)[
    ask humans [set heading towards min-one-of zombies [distance myself]]
    ask humans [set heading (heading + 180)]
  ]
  ask humans [if pcolor = green [ask humans-here [      
      set breed zombies 
      set color green]]]
  ask humans [if pcolor = red [ask humans-here [
        set hunger 0
        ]]]
  ask humans [set heading (heading + (random 10 - 5))]
  ask humans [fd speed]
end

to move-zombies
  if ( (count humans) > 0 ) [
    ask zombies [set heading towards min-one-of humans [distance myself]]
  ]
  ask zombies [fd speed]

end

to combat
  ask zombies [ask humans-here [
      set breed zombies 
      set color green
      ]
  ]
end

to combat2
  ifelse (count zombies-here  >= count humans-here)
    [
      ask humans-here[
        set health (health - 1)
        if (health < 1)[
          set breed zombies 
          set color green
      ask zombies-here [set hunger 0]
        ]
      ]
    ]
    [
      ask zombies-here [die]
    ]
  
end


to do-plots
 set-current-plot "Populations"
 set-current-plot-pen "Humans"
 plot count humans
 set-current-plot-pen "Zombies"
 plot count zombies
 
 set-current-plot "Movement Speed"
 set-current-plot-pen "Humanspeed"
 plot count humans
 set-current-plot-pen "Zombiespeed"
 plot count zombies
 
 
 
end
@#$#@#$#@
GRAPHICS-WINDOW
208
11
673
497
17
17
13.0
1
10
1
1
1
0
1
1
1
-17
17
-17
17
0
0
1
ticks
30.0

BUTTON
14
10
80
43
Setup
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
86
10
149
43
Go
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
14
49
125
82
Move Humen
move-humans
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
14
89
134
122
Move Zombies
move-zombies
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
13
130
200
163
Numbers_of_Humans
Numbers_of_Humans
0
100
48
1
1
NIL
HORIZONTAL

SLIDER
13
171
202
204
Numbers_of_Zombies
Numbers_of_Zombies
0
100
25
1
1
NIL
HORIZONTAL

PLOT
3
346
203
496
Populations
time
numbers
0.0
100.0
0.0
200.0
true
true
"" ""
PENS
"Humans" 1.0 0 -14070903 true "" "plot count humans"
"Zombies" 1.0 0 -13840069 true "" "plot count zombies"

MONITOR
3
296
69
341
Zombies
count zombies
17
1
11

MONITOR
73
296
137
341
Humans
count humans
17
1
11

PLOT
687
10
887
160
Movement Speed
time
speed
0.0
10.0
0.0
2.0
true
false
"" ""
PENS
"Zombiespeed" 1.0 0 -16777216 true "" "plot count Humans"
"Humanspeed" 1.0 0 -7500403 true "" "plot count Zombies"

PLOT
686
170
886
320
Hunger
NIL
NIL
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot count turtles"

@#$#@#$#@
## WHAT IS IT?

CS112 NetLogo Assignment #2
Authored by: Chihsiang Wang

Make at least the following changes to the current version of the Humanns versus Zombies program:

1.Add a variable for the humans and a variable for the zombies. Possibliities include heath, speed, sleepiness (humans have to sleep), hunger (humans have to get food or zombies speed up as they get hungry until they die or feed), etc.

2. Make the variables effect how the humans and zombies behave.

3. Add a plot window to plot the average value of the new variables.

4. Fill in the info tab. Include your name under "What is it?" Make sure to fill in all of the other sections. Be sure to include a disucssion of how your variables effect the model.

## HOW IT WORKS

Add: 

variables effect for Humans: 
if hunger > 100 = hungry, or not hungry.
Humans not hungey: movement speed = 1.
When Humans are hungry: movement speed = 0.1
When humans step on red patches -> Get a good red bull -> not hungry anymore -> movement speed back to 1.
When humans step on green patches -> have a good mid-term, better to be a zombie.
 
variables effect for Zombies: Zombies got a varaiable hunger now. 
When zombies are hungry -> movement speed increase to 0.8
If a zombie bite a human -> not hungry anymore, movement speed become 0.1.

New plots to present Humans and Zombies' average hunger and movement speed.

## HOW TO USE IT

1. Setup - click this botton and will initialize the program, it creates certain numbers of zombies and humans on the map.

2. Go - click this button and zombies and humans will moves automaticlly forever. Zombies has a ramdom move, humans are running away from zombies.

3. slider bar - you can change the numbers of zombies and humans here.

4. Plots diagram and Moniter - you can observer the numbers of hamans and zombies changes here.

## THINGS TO TRY

Try to give different numbers of zombies and humans, and see how they interact.



## RELATED MODELS

Reference from the library: wolves and sheeps.

## CREDITS AND REFERENCES

Modified by Dr. Seoul's sample code. 
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

zombies
true
5
Rectangle -16777216 true false 120 75 180 105
Circle -10899396 true true 116 56 67
Polygon -10899396 true true 120 150 180 150 195 210 150 180 120 210 135 150 120 150
Polygon -10899396 true true 135 120 90 135 135 150 180 150 210 135
Circle -16777216 true false 135 90 30
Rectangle -16777216 true false 150 90 135 75
Rectangle -16777216 true false 165 75 180 90
Rectangle -16777216 true false 135 75 150 90

@#$#@#$#@
NetLogo 5.0.5
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
