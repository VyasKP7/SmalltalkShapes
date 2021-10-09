"Program will utilize 5 classes with inheritance and will read files."

"Check if command line input is correct, if not print error message and exit"

((Smalltalk getArgc) == 1)
           ifFalse: [ 'Usage: shape.st sphere.st cylinder.st cone.st cuboid.st -f main.st shape_file' displayNl.
                ObjectMemory quit.
           ].



"Check if file can be opened, if not print error message and exit"

(File isReadable: (Smalltalk getArgv: 1))
  ifFalse: [ 'Unable to open ' display.  (Smalltalk getArgv: 1) display. ' for reading' displayNl.
              ObjectMemory quit: 1.
  ].


"Open the file and count number of lines(i)."

f := FileStream open: (Smalltalk getArgv: 1).
i := 0.
[f atEnd] whileFalse:
  [
    i := i+1.
    f nextLine.

  ].
f close.


file := FileStream open: (Smalltalk getArgv: 1).

"Iterate the file line by line and store it in an array(vector)"

array := Array new: i.  "This will store my objects"

Arraycounter := 0.

[file atEnd] whileFalse:
  [
    Arraycounter:= Arraycounter + 1.
    Nl := file nextLine.  "Obtain next line in b"

    rs:= ReadStream on: Nl.  "Repeat the process on each word of a line"

    x := Array new: 5.  "Store contents of a line in an array"
    lineCounter := 0.

    [rs atEnd] whileFalse:
      [
        word := (rs upTo: $ ).
        (word ~= '') ifTrue:[
            
            x at: (lineCounter+1) put: word.

        lineCounter := lineCounter+1.
        ].
      ].


      ((x at: 2) = 'sphere')
        ifTrue:[
          object := Sphere new.
          array at: Arraycounter put: object.
          (array at: Arraycounter) setName: (x at: 1).
          (array at: Arraycounter) setRadius: ((x at: 3) asNumber).
        ].

        ((x at: 2) = 'cone')
          ifTrue:[
            object := Cone new.
            array at: Arraycounter put: object.
            (array at: Arraycounter) setName: (x at: 1).
            (array at: Arraycounter) setRadius: ((x at: 3) asNumber).
            (array at: Arraycounter) setHeight: ((x at: 4) asNumber).
          ].

          ((x at: 2) = 'cuboid')
            ifTrue:[
              object := Cuboid new.
              array at: Arraycounter put: object.
              (array at: Arraycounter) setName: (x at: 1).
              (array at: Arraycounter) setLength: ((x at: 3) asNumber).
              (array at: Arraycounter) setWidth: ((x at: 4) asNumber).
              (array at: Arraycounter) setHeight: ((x at: 5) asNumber).

            ].

            ((x at: 2) = 'cylinder')
              ifTrue:[
                object := Cylinder new.
                array at: Arraycounter put: object.
                (array at: Arraycounter) setName: (x at: 1).
                (array at: Arraycounter) setRadius: ((x at: 3) asNumber).
                (array at: Arraycounter) setHeight: ((x at: 4) asNumber).

              ].
  ].


  "-----------------------------------------------------------------------------------------------"

  |input substr|
  arrayholdingstrings := Array new: 1.
  arrayholder := Set new.
  numchar := Array new: 1.
  minA := Array new: 1.
  minV := Array new: 1.
  maxA := Array new: 1.
  maxV := Array new: 1.
  ch := Array new: 1.
  ch2 := Array new: 1.
  sumA := Array new: 1.
  sumV := Array new: 1.
  divisorC := Array new: 1.
  numConds := Array new: 1.


  '' displayNl.
  [input ~= 'quit'] whileTrue:[    "Loops until input becomes quit"

     'Enter a command: ' display.
     input := stdin nextLine.



     (input = 'quit') ifTrue:[
      ObjectMemory quit: 0.
     ].

     (input = 'print') ifTrue:[     "print"
         array do:[:object|
         object getInfo.
         ].
     ].

     (input = 'count') ifTrue:[     "count"
         sum := 0.
         array do:[:object|
           sum := sum + 1.
         ].
         'There are ' display. sum display. ' shapes.' displayNl.
     ].
     (input = 'max') ifTrue: [      "max"
       maxA1 := 0.
       maxV1 := 0.
       array do:[:object|
          ((object getArea) > maxA1  ) ifTrue:[
              maxA1 := (object getArea).
          ].

          ((object getVolume) > maxV1  ) ifTrue:[
              maxV1 := (object getVolume).
          ].
       ].

       'max(Surface Area)=' display. maxA1 displayNl.
       'max(Volume)=' display. maxV1 displayNl.

     ].

     minA1 := 0.
     minV1 := 0.
     (input = 'min') ifTrue: [      "min"
       minA1:= ((array at:1) getArea).
       minV1 := ((array at:1) getVolume).
       array do:[:object|

          ((object getArea) < minA1  ) ifTrue:[
              minA1 := (object getArea).
          ].

          ((object getVolume) < minV1  ) ifTrue:[
              minV1 := (object getVolume).
          ].
       ].

       'min(Surface Area)=' display. minA1 displayNl.
       'min(Volume)=' display. minV1 displayNl.

     ].


     (input = 'total') ifTrue: [      "total"
       totalA := 0.
       totalV := 0.
       array do:[:object|

        totalA := totalA + (object getArea).
        totalV := totalV + (object getVolume).
       ].

       'total(Surface Area)=' display. totalA displayNl.
       'total(Volume)=' display. totalV displayNl.

     ].


     (input = 'avg') ifTrue: [      "avg"
       totalA := 0.
       totalV := 0.
       count := 0.
       array do:[:object|
       count := count + 1.
        totalA := totalA + (object getArea).
        totalV := totalV + (object getVolume).
       ].

       'avg(Surface Area)=' display. (totalA/count) displayNl.
       'avg(Volume)=' display. (totalV/count) displayNl.

     ].


     "Find which command and slice the letters off."
     newstr := input copy.

     numchar at: 1 put: (newstr size).
     ch at: 1 put: (newstr at: 1).
     ch2 at: 1 put: (newstr at: 2).
     arrayholdingstrings at: 1 put: newstr.



     (((numchar at:1)>5) & ((ch at: 1)= $p)) ifTrue:[           "printN"



      "Obtain the number of conditions"
      counted := ((numchar at:1) -5) asNumber.

      substr := String new: counted.

      skipCount := 0.
      (arrayholdingstrings at: 1) do:[:char|
        skipCount := skipCount + 1.
        (skipCount > 5) ifTrue:[
            substr at: (skipCount - 5) put: char.
        ]
      ].


      numConds at: 1 put: (substr asNumber).



      "Take the conditions as a user input store it in an array."
      printableArray := Array new: (numConds at: 1).

      condCounter := 0.
      (numConds at: 1) timesRepeat:[
          condCounter := condCounter + 1.
          'Enter test condition #' display. condCounter display. ': ' display.
          condInput := stdin nextLine.
          printableArray at: condCounter put: condInput.

      ].

      "Loop through the main array and store the shapes that return true in another array."

      array do:[:shape |
        (shape test: printableArray) ifTrue:[
          shape getInfo.
        ].
      ].

     ].

     (((numchar at: 1)>5) & ((ch at: 1) = $c)) ifTrue:[           "countN"




           "Obtain the number of conditions"
           counted := ((numchar at: 1)-5) asNumber.
           substr := String new: counted.
           skipCount := 0.
           (arrayholdingstrings at: 1) do:[:char|
             skipCount := skipCount + 1.
             (skipCount > 5) ifTrue:[
                 substr at: (skipCount - 5) put: char.
             ].
           ].


           numConds at: 1 put: (substr asNumber).


           "Take the conditions as a user input store it in an array."
           printableArray := Array new: (numConds at: 1).

           condCounter := 0.
           (numConds at: 1) timesRepeat:[
               condCounter := condCounter + 1.
               'Enter test condition #' display. condCounter display. ': ' display.
               condInput := stdin nextLine.
               printableArray at: condCounter put: condInput.

           ].

           "Loop through the main array and store the shapes that return true in another array."

           countingUp := 0.
           array do:[:shape |
             (shape test: printableArray) ifTrue:[
               countingUp := countingUp + 1.
             ].
           ].
           'There are ' display. countingUp display. ' shapes.' displayNl.
     ].

     (((numchar at: 1)>3) & ((ch at: 1) = $m) & ((ch2 at: 1) = $i)) ifTrue:[           "minN"

           "Obtain the number of conditions"
           counted := ((numchar at: 1) -3) asNumber.
           substr := String new: counted.
           skipCount := 0.
           (arrayholdingstrings at: 1) do:[:char|
             skipCount := skipCount + 1.
             (skipCount > 3) ifTrue:[
                 substr at: (skipCount - 3) put: char.
             ]
           ].


           numConds at: 1 put: (substr asNumber).


           "Take the conditions as a user input store it in an array."
           printableArray := Array new: (numConds at: 1).

           condCounter := 0.
           (numConds at: 1) timesRepeat:[
               condCounter := condCounter + 1.
               'Enter test condition #' display. condCounter display. ': ' display.
               condInput := stdin nextLine.
               printableArray at: condCounter put: condInput.

           ].

           "Loop through the main array and store the shapes that return true in another array."



           minA at: 1 put: -1.
           minV at: 1 put: -1.
           array do:[:shape |
             (shape test: printableArray) ifTrue:[
               ((minA at: 1) = -1) ifTrue:[
                  minA at: 1 put: (shape getArea).
                  minV at: 1 put: (shape getVolume).
               ].
               ((shape getArea) < (minA at: 1)) ifTrue:[
                  minA at: 1 put: (shape getArea).
               ].
               ((shape getVolume) < (minV at: 1)) ifTrue:[
                  minV at: 1 put: (shape getVolume).
               ].
             ].
           ].

           ((minA at:1) = -1) ifTrue:[
           minA at: 1 put: 0.
           minV at: 1 put: 0.
           ].

           'min(Surface Area)=' display. (minA at: 1) displayNl.
           'min(Volume)=' display. (minV at: 1) displayNl.

     ].



     (((numchar at: 1)>3) & ((ch at: 1) = $m) & ((ch2 at: 1) = $a)) ifTrue:[           "maxN"



                "Obtain the number of conditions"
                counted := ((numchar at: 1) -3) asNumber.
                substr := String new: counted.
                skipCount := 0.
                (arrayholdingstrings at: 1) do:[:char|
                  skipCount := skipCount + 1.
                  (skipCount > 3) ifTrue:[
                      substr at: (skipCount - 3) put: char.
                  ]
                ].



                numConds at: 1 put: (substr asNumber).


                "Take the conditions as a user input store it in an array."
                printableArray := Array new: (numConds at: 1).

                condCounter := 0.
                (numConds at: 1) timesRepeat:[
                    condCounter := condCounter + 1.
                    'Enter test condition #' display. condCounter display. ': ' display.
                    condInput := stdin nextLine.
                    printableArray at: condCounter put: condInput.

                ].

                "Loop through the main array and store the shapes that return true in another array."



                maxA at: 1 put: -1.
                maxV at: 1 put: -1.
                array do:[:shape |
                  (shape test: printableArray) ifTrue:[
                    ((maxA at: 1) = -1) ifTrue:[
                       maxA at: 1 put: (shape getArea).
                       maxV at: 1 put: (shape getVolume).
                    ].
                    ((shape getArea) > (maxA at: 1)) ifTrue:[
                       maxA at: 1 put: (shape getArea).
                    ].
                    ((shape getVolume) > (maxV at: 1)) ifTrue:[
                       maxV at: 1 put: (shape getVolume).
                    ].
                  ].
                ].
                ((maxA at:1) = -1) ifTrue:[
                maxA at: 1 put: 0.
                maxV at: 1 put: 0.
                ].

                'max(Surface Area)=' display. (maxA at: 1) displayNl.
                'max(Volume)=' display. (maxV at: 1) displayNl.


     ].

     (((numchar at: 1)>3) & ((ch at: 1) = $a)) ifTrue:[           "avgN"



                     "Obtain the number of conditions"
                     counted := ((numchar at: 1) -3) asNumber.
                     substr := String new: counted.
                     skipCount := 0.
                     (arrayholdingstrings at: 1) do:[:char|
                       skipCount := skipCount + 1.
                       (skipCount > 3) ifTrue:[
                           substr at: (skipCount - 3) put: char.
                       ]
                     ].


                     numConds at: 1 put: (substr asNumber).


                     "Take the conditions as a user input store it in an array."
                     printableArray := Array new: (numConds at: 1).

                     condCounter := 0.
                     (numConds at: 1) timesRepeat:[
                         condCounter := condCounter + 1.
                         'Enter test condition #' display. condCounter display. ': ' display.
                         condInput := stdin nextLine.
                         printableArray at: condCounter put: condInput.

                     ].

                     "Loop through the main array and store the shapes that return true in another array."



                     sumA at: 1 put: 0.
                     sumV at: 1 put: 0.
                     divisorC at: 1 put: 0.
                     array do:[:shape |
                       (shape test: printableArray) ifTrue:[
                          divisorC at: 1 put: ((divisorC at: 1) + 1).
                          sumA at: 1 put: ((sumA at: 1) + (shape getArea)).
                          sumV at: 1 put: ((sumV at: 1) + (shape getVolume)).
                     ].
                     ].
                     ((divisorC at: 1) = 0) ifTrue:[
                     'avg(Surface Area)=' display. 0 displayNl.
                     'avg(Volume)=' display. 0 displayNl.
                     ].

                     'avg(Surface Area)=' display. ((sumA at: 1)/(divisorC at: 1)) displayNl.
                     'avg(Volume)=' display.  ((sumV at: 1)/(divisorC at: 1)) displayNl.

     ].

     (((numchar at: 1)>5) & ((ch at: 1) = $t)) ifTrue:[           "totalN"


                          "Obtain the number of conditions"
                          counted := ((numchar at: 1) -5) asNumber.
                          substr := String new: counted.
                          skipCount := 0.
                          (arrayholdingstrings at: 1) do:[:char|
                            skipCount := skipCount + 1.
                            (skipCount > 5) ifTrue:[
                                substr at: (skipCount - 5) put: char.
                            ]
                          ].


                          numConds at: 1 put: (substr asNumber).


                          "Take the conditions as a user input store it in an array."
                          printableArray := Array new: (numConds at: 1).

                          condCounter := 0.
                          (numConds at: 1) timesRepeat:[
                              condCounter := condCounter + 1.
                              'Enter test condition #' display. condCounter display. ': ' display.
                              condInput := stdin nextLine.
                              printableArray at: condCounter put: condInput.

                          ].

                          "Loop through the main array and store the shapes that return true in another array."



                          sumA at: 1 put: 0.
                          sumV at: 1 put: 0.
                          divisorC at: 1 put: 0.
                          array do:[:shape |
                            (shape test: printableArray) ifTrue:[
                               divisorC at: 1 put: ((divisorC at: 1) + 1).
                               sumA at: 1 put: ((sumA at: 1) + (shape getArea)).
                               sumV at: 1 put: ((sumV at: 1) + (shape getVolume)).
                          ].
                          ].
                          ((divisorC at: 1) = 0) ifTrue:[
                          'avg(Surface Area)=' display. 0 displayNl.
                          'avg(Volume)=' display. 0 displayNl.
                          ].

                          'total(Surface Area)=' display. (sumA at: 1) displayNl.
                          'total(Volume)=' display.  (sumV at: 1) displayNl.


     ].


     arrayholder empty.





     '' displayNl.
  ].
