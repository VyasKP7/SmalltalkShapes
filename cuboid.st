"This will be a sub-class of shape that defines a cuboid"

Shape subclass: Cuboid [
  | length width height type|

  init [
    <category: 'initialization'>
    length := 0.
    width := 0.
    height :=0.
    type := 'cuboid'.
    ^super init: 'lol'.
  ]

  setLength: l[
    length := l.
  ]
  setWidth: w[
    width := w.
  ]
  setHeight: h[
    height := h.
  ]

  getArea [
    |area|
    area := 2*((length*width)+(length*height)+(width*height)).
    ^area.
  ]

  setName: n[
    name := n.
  ]

  getVolume [
    |volume|
    volume :=  length*width*height.
    ^volume
  ]

  getInfo [
    'Cuboid: ' display. name display. ', ' display. 'Length=' display. length display. ', Width=' display. width display.', Height=' display. height displayNl.
    '        Surface Area: ' display. (self getArea) display. ', Volume: ' display. (self getVolume) displayNl.

  ]
  test: x [
  "Go through all the conditions one by one and check if it holds true."

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
