# Pendulum-on-cart
Modelling and simulation of a cart-pendulum system

## Requirements
This demonstration requires `MATLAB` version `R2011a` or higher installed on your PC

## Dependencies
You will need these tool boxes in `MATLAB` 
- `Control systems toolbox`

## Code
Run the file `Inverted_pendulum_cart.m` in MATLAB 
feel free to play with the system parameters:
- m is mass of pendulum, M is that of cart
- l is the length of the massless pole on which the pendulum rests
- b is the damping variable 

- the cart pendulum system is then controlled with a designed linear quadratic regulator. Ode45 integrator is used to calculate the system states and simulate the cart pendulum system using the `cartpendulum_system(...)` function .

feel free to try out new penalty matrices **Q** and **R** for the lqr regulator. make sure they are positive semi-definite matrices. 
the controller is designed using the default matrices as shown below

Q =  
     
     1 0 0 0
     0 1 0 0
     0 0 10 0
     0 0 0 50
     
R = 

     0.001^2
     
`cartpendulum_system.m` contains the ODEs for a pendulum on a cart system.
`system_draw.m` draws and displays the simulation based on the simulation data generated in the `Inverted_pendulum_cart.m`

