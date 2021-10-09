
<h2>Sample executions of the program</h2>

**gst shape.st sphere.st cylinder.st cone.st cuboid.st -f main.st**
<br>Usage: shape.st sphere.st cylinder.st cone.st cuboid.st -f main.st shape_file</br>

**gst shape.st sphere.st cylinder.st cone.st cuboid.st -f main.st xxxx.dat**
<br>Unable to open xxxx.dat for reading</br>

**gst shape.st sphere.st cylinder.st cone.st cuboid.st -f main.st shapes.dat**
<br>Enter a command: print</br>
Cuboid: Cube#1, Length=1.00, Width=1.00, Height=1.00
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Surface Area: 6.00, Volume: 1.00</br>
Cuboid: Cube#2, Length=2.00, Width=2.00, Height=2.00
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Surface Area: 24.00, Volume: 8.00</br>
Cone: Cone#1, Radius=1.00, Height=1.00
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Surface Area: 7.58, Volume: 1.05</br>
Cylinder: Cyl#1, Radius=1.00, Height=1.00
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Surface Area: 12.57, Volume: 3.14</br>
Cuboid: Box#1, Length=2.00, Width=4.00, Height=6.00
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Surface Area: 88.00, Volume: 48.00</br>
Cuboid: Box#2, Length=10.50, Width=21.00, Height=10.50
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Surface Area: 1102.50, Volume: 2315.25</br>
Sphere: UnitSphere, Radius=1.00
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Surface Area: 12.57, Volume: 4.19</br>
Sphere: LargeSphere, Radius=100.00
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Surface Area: 125663.71, Volume: 4188790.20</br>
Cone: Cone#2, Radius=1.00, Height=2.00
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Surface Area: 10.17, Volume: 2.09</br>
Cylinder: Cyl#2, Radius=1.00, Height=2.00
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Surface Area: 18.85, Volume: 6.28</br>

Enter a command: print2  
Enter test condition #1: type == cuboid  
Enter test condition #2: area >= 88  
Cuboid: Box#1, Length=2.00, Width=4.00, Height=6.00
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Surface Area: 88.00, Volume: 48.00</br>
Cuboid: Box#2, Length=10.50, Width=21.00, Height=10.50
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Surface Area: 1102.50, Volume: 2315.25</br>

Enter a command: count1
Enter test condition #1: type > cyl
There are 4 shapes.

Enter a command: count1
Enter test condition #1: type != cuboid
There are 6 shapes.

Enter a command: quit
