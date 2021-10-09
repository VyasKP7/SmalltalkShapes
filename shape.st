"This will declare a shape"

Object subclass: Shape [
    | name |
    <comment:
        'Base class from which subclasses will be formed'>

    Shape class >> new [
        <category: 'instance creation'>
        | r |
        r := super new.
        r init.
        ^r.
    ]

    init: n [
        <category: 'initialization'>
        name := n
    ]


    getName [
      <category: 'Return name'>
      ^name.
    ]

]
