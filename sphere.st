"This will be a sub-class of shape that defines a sphere"

Shape subclass: Sphere [
  | radius type |
  init [
    <category: 'initialization'>
    radius := 0.
    type := 'sphere'.
    ^super init: 'lol'.
  ]

  setName: n[
    name := n.
  ]

  setRadius: r[
    radius := r.
  ]

  getArea [
    |area pi|
    pi := 3.
    area := 4 * pi * radius * radius.
    ^area.
  ]
  getVolume [
    |volume pi|
    pi := 3.
    volume := (4/3)* pi *radius*radius*radius.
    ^volume
  ]

  getInfo [
    'Sphere: ' display. name display. ', ' display. 'Radius=' display. radius displayNl.
    '        Surface Area: ' display. (self getArea) display. ', Volume: ' display. (self getVolume) displayNl.

  ]
  test: x [    "Go through all the conditions one by one and check if it holds true."

  |newSet|

  x do:[:cond|      "Each condition, split into three words by space"

      newSet := (cond subStrings: ' ').       "newSet contains the three operands"

      ((newSet at: 1) = 'type') ifTrue:[            "Type case"


          ((newSet at: 2) = '==') ifTrue:[          "== case"
              (type ~= (newSet at: 3)) ifTrue:[
                ^false.
              ].
          ].

          ((newSet at: 2) = '!=') ifTrue:[          "!= case"
              (type = (newSet at: 3)) ifTrue:[
                ^false.
              ].
          ].

          ((newSet at: 2) = '>=') ifTrue:[          ">= case"
              (type < (newSet at: 3)) ifTrue:[
                ^false.
              ].
          ].

          ((newSet at: 2) = '<=') ifTrue:[          "<= case"
              (type > (newSet at: 3)) ifTrue:[
                ^false.
              ].
          ].


          ((newSet at: 2) = '>') ifTrue:[          "> case"
              (type <= (newSet at: 3)) ifTrue:[
                ^false.
              ].
          ].

          ((newSet at: 2) = '<') ifTrue:[          "< case"
              (type >= (newSet at: 3)) ifTrue:[
                ^false.
              ].
          ].

      ].

        ((newSet at: 1) = 'area') ifTrue:[            "Area case"

            ((newSet at: 2) = '==') ifTrue:[          "== case"
                ((self getArea) ~= ((newSet at: 3) asNumber)) ifTrue:[
                  ^false.
                ].
            ].

            ((newSet at: 2) = '!=') ifTrue:[          "!= case"
                ((self getArea) = ((newSet at: 3) asNumber)) ifTrue:[
                  ^false.
                ].
            ].

            ((newSet at: 2) = '>=') ifTrue:[          ">= case"
                ((self getArea) < ((newSet at: 3) asNumber)) ifTrue:[
                  ^false.
                ].
            ].

            ((newSet at: 2) = '<=') ifTrue:[          "<= case"
                ((self getArea) > ((newSet at: 3) asNumber)) ifTrue:[
                  ^false.
                ].
            ].


            ((newSet at: 2) = '>') ifTrue:[          "> case"
                ((self getArea) <= ((newSet at: 3) asNumber)) ifTrue:[
                  ^false.
                ].
            ].

            ((newSet at: 2) = '<') ifTrue:[          "< case"
                ((self getArea) >= ((newSet at: 3) asNumber)) ifTrue:[
                  ^false.
                ].
            ].


        ].


        ((newSet at: 1) = 'volume') ifTrue:[            "Volume case"

            ((newSet at: 2) = '==') ifTrue:[          "== case"
                ((self getVolume) ~= ((newSet at: 3) asNumber) ) ifTrue:[
                  ^false.
                ].
            ].

            ((newSet at: 2) = '!=') ifTrue:[          "!= case"
                ((self getVolume) = ((newSet at: 3) asNumber)) ifTrue:[
                  ^false.
                ].
            ].

            ((newSet at: 2) = '>=') ifTrue:[          ">= case"
                ((self getVolume) < ((newSet at: 3) asNumber)) ifTrue:[
                  ^false.
                ].
            ].

            ((newSet at: 2) = '<=') ifTrue:[          "<= case"
                ((self getVolume) > ((newSet at: 3) asNumber)) ifTrue:[
                  ^false.
                ].
            ].


            ((newSet at: 2) = '>') ifTrue:[          "> case"
                ((self getVolume) <= ((newSet at: 3) asNumber)) ifTrue:[
                  ^false.
                ].
            ].

            ((newSet at: 2) = '<') ifTrue:[          "< case"
                ((self getVolume) >= ((newSet at: 3) asNumber)) ifTrue:[
                  ^false.
                ].
            ].


        ].



  ].


  ^true.
  ]


]
