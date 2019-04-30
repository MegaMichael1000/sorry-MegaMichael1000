Asteroids (Part 1)
==================
In this assignment we will start to replicate the old video game Asteroids. You will write a program that has a space ship that can be controlled with the keyboard. You will need to write a `Spaceship` class. Your `Spaceship` class will extend the `Mover` class which will represent the things that move. Because things that move are not limited to our asteroid game there is an interface called `Moveable` for the Mover class to implement. The `Mover` class will implement the `Movable` interface but some of the methods defined in `Moveable` will be implmented in subsequent classes which means we will need to make Mover an `abstract` class and tag those methods to be implemented later as abstract too.

An `abstract` class is an "incomplete" class. It has `abstract` methods--incomplete methods that have no body. Once you write a class that extends an `abstract` class, you then typically write the methods that are needed to "complete" the class. _Note: To complete (Part 1)  of the assignment you will be writing two classes `Spaceship` and `Star`._

Suggested steps to complete this assignment
-------------------------------------------
* Clone this repository.
* Open the program by opening `AsteroidsGame.pde` in Processing.
* Uncomment the `implements Movable` on Line 70
* Scroll down to line 128-ish, and complete Moveable by implementing the get/set methods outlined in the Movable interface.
  * Note, that I have taken care of `update, collidingWith`.  `show` has been tagged as abstract and will be overriden in sub-classes.
* Uncomment the `extends Mover` on Line 7-ish of `Spaceship.pde`
* The `Spaceship` class inherits from `Mover` and the only method you need to implement is `show()` and the two constructors previously defined in Mover
  * Note, an instance of Spaceship will have all the variables already specified in Mover. You do need to redefine these variables.
* Write the `Spaceship` constructors. You may find slides #1 - 68 on [Asteroids slideshow](https://docs.google.com/presentation/d/1-NUJtmxfJ06K_RFNjdTwKlqEEAw7JUvq_0nx43Fobu4/edit#slide=id.g45b409ab78_7_6) and the [Spaceship design worksheet](https://docs.google.com/document/d/14BTGf9DjeZZfd5FJKUQzFo_K2eOOf1wwiqPe-EshhQM/edit?usp=sharing) helpful. You may also find [this sample Spaceship program](https://apcslowell.github.io/AsteroidsVariableDemoV2/) helpful in understanding how the `protected Mover` variables affect the Spaceship's movement.
* At the top of `AsteroidsGame.pde`, declare a variable of type `Spaceship`
* Initialize the `Spaceship` as a new instance of the class
* In `draw()` in `AsteroidsGame.pde` call the Spaceship's `show()` function.

Next, is to get your ship to respond to key presses
---------------------------------------------------
* When you are happy with appearance of the Spaceship, add a `public void keyPressed()` function in `AsteroidsGame.pde`
  * (We did this work before break, so I have already included keyPressed/keyReleased)
* Write code in draw that checks which keys have been pressed and tell the spaceship to act accordingly.
  * If left arrow, you might tell the shapship to rotate( -0.1 ), or if right arrow to rotate(0.1)
  * your spaceship class will probably need to introduce extra functionality, such as rotate and increase speed
* We haven't implemented the hyperspace functionality yet, so you will need to do this. (Follow the pattern for up arrow and the other keys) 
  * There is no requirement for any fancy visual effects, hyperspace just needs to stop the ship, and give it a new random position and direction.
* Add code to the `draw()` in `AsteroidsGame.pde` to `update()` the Spaceship
* OPTIONAL: If you have extra time and are looking for a challenge, you might try to add an animation of "rockets" that appear from the back of the ship when you accelerate, simliar to the [this sample Spaceship program](https://apcslowell.github.io/AsteroidsVariableDemoV2/). 

Finally, get draw a starfield for a nice background effect
----------------------------------------------------------
* Finish the `Star` class in `Star.pde`
  * Create Star constructors, and their own show() method.
* Finally, add code to `AsteroidsGame.pde` that declares and initializes an array of instances of the `Star` class to create a number of stars in random positions.

Some important things to keep in mind
-------------------------------------
1. Abstract classes are "unfinished"
2. Abstract classes are one way that programmers can collaborate and divide up the work of a large program
3. You're collaborating! Some of the work for the `Spaceship` class has already been done in the `Mover` class. Don't change it! Your job is to extend the `Mover` class to "build on top of it" to make a `Spaceship` class. 
3. To create the `Spaceship` class you need to write a constructor and finish the "unfinished" `abstract` functions in `Floater`.
4. When you are sketching out your ship on th [Spaceship design worksheet](https://docs.google.com/document/d/14BTGf9DjeZZfd5FJKUQzFo_K2eOOf1wwiqPe-EshhQM/edit?usp=sharing) make sure the ship is centered at (0,0) and pointing to the right - this can be used for your asteroids down the road too.
4. Don't declare any duplicate variables in your `Spaceship` class. You are inheriting all the variables you need from `Mover`
5. Make sure your `Spaceship` constructor initializes all 9 of the `protected` variables it inherits from `Mover`

Samples of Student Work
----------------------- 
[Excellent](https://mikamarciales.github.io/AsteroidsGame/)
[Gravity Well](https://ansue1234.github.io/AsteroidsGame/)
[Pretty Intense, but cool background effects](https://darya-ver.github.io/AsteroidsGame/)
[Basic but complete](https://felixzhuk.github.io/AsteroidsGame/)
[Star wars, nice booster](https://garvingit.github.io/AsteroidsGame/)
[Retro](https://connac.github.io/AsteroidsGame/)
[Toast](https://kachow4.github.io/AsteroidsGame/)


Part 2: The Asteroid Field
=====================================
Now that we have a functioning space ship, we'll add some asteroids to our game. We'll write an asteroid class that `extends Mover`. Your task is to create the Asteroid class. It should extend Mover. The asteroids should should have an iregular polygon shape or 5-7 sides. You do not need to randomize the shape but might find this useful later. The asteroid should be able to draw itself in 3 different sizes (small, medium, large). The asteroid should spin as it moves about in space.

Once you are able to get one asteroid to work (float across the screen and spin) you will create an array of asteroids of random size and position.

Eventually we will make the Asteroiuds cabable of detecting whether or not they are touching another Mover. If it is another asteroid then they will bounce off of each other. If it your spaceship then game over, or deduct health.

Recommended steps to completing this section
-----------------------------------
*  Make the `Asteroid` class extend `Mover` in your Asteroid.pde file. You will need to write a constructor and the code to "finish" the `abstract` methods from Mover class.
* Polygon Shape: Think about using two arrays of floats, one for x coordinates, xCoords, and one for y coordinates, yCoords
  * So xCoords[0] yCoords[0] is your first coordinate, OR xCoords[i] yCoords[i] and your i-th coordinate pair.
  * Using this pattern you can use beginShape(), vertex(), endShape() to draw your asteroid.
* Now add just a single asteroid in the main AsteroidsGame.pde. 
  * Initialize it in setup
  * Call `update()`, then `show()`. Make sure you can see it and are happy with its shape before going to the next step, spin.
* Spin: Use a `float` member variable in the `Asteroid` class to track how much it has spun (in degrees). Also make sure to declare it appropriately (should it be `public` or `private`?).
  * Override `update()` and increment your spin variable a little bit, spin += 0.3 (or however fast you want it to spin)
  * right before you call beginShap, you can rotate(radians(spin))
* Modify your code so that you have an array of Asteroids.


Part 3: Collision Detection
===========================
The goal of this part is to make your asteroids bounce off of each other. You will need to detect when one asteroid is touching another and then update the direction it is traveling (and if you want it to look more realistic probably its speed and spin direction).

The idea behind collision detection is to think about whether or not two Mover objects occupy the same space. If you were to look at just the x & y values of two Movers you might find that one has (23, 50.0) and the second has (24, 49.0). Simply comparing their coordinates is not sufficient (these two obviously have different positions). You must also think about their "radius of influence". If the Movers have each have a radius of 5, then they will intersect. So how can we visualize it? The easiest way is to think of the drawing a right triangle between the two coordinate values and ask if that hypotentuse is smaller than their two radius added.
```
  boolean collidingWith(Movable m) {
    //Can't collide with yourself
    if (this == m) {
      return false;
    }
    
    //How far away are OUR centers
    float d = dist(x, y, m.getX(), m.getY());    
    
    //If both of our radi added are greater than or equal to d, then we have collided
    if ((radius + m.getRadius()) >= d) {
     return true;  
    }
    return false;
 }
```

Recommended steps to implement collision detection
--------------------------------------------------
* Update the Mover class implementation of collidingWith to use the code above.
* In the main  AsteroidsGame pde file you will need to update the draw loop to check whether or not an asteroid is colliding with another asteroid.
  * Best to do this inside of function and call that function inside of draw.
* When you are checking if one asteroid is colliding with another asteroid you need to think about using a nested loop, that is, for each asteroid you have ask every other asteroid if it is colliding with the current asteroid.
  * To simplify things, you should just break the loop once you detect a collision and only alter the course for the "outer" asteroid
  * Also, there is a nice way to model this with Physics but it is kind of complicated. I'd just recommend altering the angle and speed some.
 * There is a problem that can occur when to objects collide and appear to "stick" together. This comes from asking to frequently if something is colliding with itself. When the time comes we will discuss possible solutions to solve this problem.
* Finally, you should update the AsteroidGame draw() method to also check if the Spaceship has collided with any of the Asteroids.


Extra Reading for Collision Detection
-------------------------------------
* There are few techniques one can explore with collision detection. Here are a couple of links the go into greater detail in case you are interested: (Or google search "processing collision detection")
  * [Several advanced](https://happycoding.io/tutorials/processing/collision-detection#circle-circle-collision)
  * [Processing Demo](https://processing.org/examples/circlecollision.html)


Part 4: Bullets and ArrayList
==============================
In this part you will update your program to create bullets fired from the ship. To keep track of the bullets fired you will need to store them. An array probably isn't the best way to keep track of a bunch of bullets because arrays have a fixed size and with something like a bullet you are constantly creating them. You can't easily add or remove bullets from an array. A better choice might be an `ArrayList`. 

The `ArrayList` class has a number of useful member methods:
- `boolean add(Object element)` // add an object to the end
- `void add(int index, Object element)`  // add an object at index, moves the thing that was there down by one 
- `Object get(int index)` //get the object at index
- `Object remove(int index)` // remove the object at index
- `Object set(int index, Object x)` //replace the object at index with new object and return the one that was there
- `int size()`

Using an `ArrayList` allows you to not have to care (as much) about the size of the array and lets you add as many things as you want to the array. You will still have to be careful not to index out of the list though.


Steps to completing this part
-----------------------------
* First you will want to make the Bullet class and have it extend Mover. 
  * You should add a private member to the Bullet class of type `int live` and instantiate it to 100 in the constructor (larger if you want it to go further).
  * You should override Bullet update(), call super.update() first but also update the "live" to subtracted by 1 each time update is called. This has the effect of limiting the range of the bullet, so live--;
  * Your bullet will look pretty simple, a small rectangle should do for its show() method, but anything you want will suffice (stars, hearts, happy faces). The only thing to check is wether or not the bullet is live, so `if (live > 0)` then do drawing work.
  * You should add a method `boolean isAlive()` to Bullet. Your ship can use this to detect whether or not the bullet is still available.
* Test to see if you can fire a bullet from the spaceship:
  * In Spaceship class, add a new method `void fire()`. This method create a new Bullet and store that in a new member variables bullet
  ```
  void fire(){
    if(myByllet != null && !myBullet.isAlive()){
     myBullet = new Bullet(); //Make sure you have declared a Bullet myBullet for the spaceship
    }
   }
  ``` 
  * Just because Spaceship has a bullet, doesn't mean you have told the bullet to `update()` or `show()` itself. In spaceship's update() and show() methods you should update() and show() your bullet respectively.
  * Once you have just one bullet firing, the next step would be to let the ship fire many bullets.
  * Use an ArrayList to add bullets
    * *Warning* You will need to manage how many bullets can be fired and when to remove bullets. Spaceship.update() is a good place to think about when to remove bullets and the Spaceship.fire() is a good place to think about limiting bullets.

* Bullets should be fired in the same direction that the spaceship was pointing when the ship was told to fire. The speed of the bullet should be faster than the ship is currently traveling. 


* You should add a method to SpaceShip that takes a Mover as a parameter and determines whether or not any of the bullets collides with that Mover (call the method `hasHitTarget(Mover target)`. 

* In the main AsteroidsGame program draw() method, you should ask each asteroid if the spaceship has hit the asteroid. If the asteroid has hit the target then you should remove it from the array (or disable it). So something like:
```
 for(Asteroid a: asteroids){ //Assuming asteroids is a Asteroid[]
   if( player1.hasHitTarget(a)){
    //mark the asteroid as hit?
    
    //update score?
    
    //think about what to do with that bullet, is it live still? 
    //Where/how would you control that?
   }
 }
 
 //After you know which asteroids have been hit, update your asteroids array
```
* For help modifying your game to use an `ArrayList` for bullets. You may find the [ArrayList worksheet](https://drive.google.com/open?id=13FqmR0E-aJSS-Qwqkwd35c2kHyGbe_UU) and the [ArrayList slide presentation](https://docs.google.com/presentation/d/1H3W6iqnXTDyel_c6UKKX8A9VFRfrR-F_eTDDGp1zG9s/edit#slide=id.p126) helpful.
* You may optionally convert your Asteroid[] to be an ArrayList if you like.

* At the time of this writing, these steps were still in flight, so in a week or two we will nail down the remaining steps.

Extensions
==========
If you have extra time, you might add some extra features to your Asteroids game. Have fun and be creative!
* Randomly shaped Asteroids
* Different types of weapons besides bullets
* Add a second ship (UFO) that appears after a while and shoots at the space ship
* Create a pulse wave explosion that destroys everything within a certain range.
* Keep track of the score and/or the health of the ship

*This assignment was addapted from https://github.com/APCSLowell/AsteroidsGame
