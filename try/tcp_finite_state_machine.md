###The Simplified TCP Finite State Machine

In the case of TCP, the finite state machine can be considered to describe the “life stages” of a connection. 
Each connection between one TCP device and another begins in a null state where there is no connection, 
and then proceeds through a series of states until a connection is established. 
It remains in that state until something occurs to cause the connection to be closed again, 
at which point it proceeds through another sequence of transitional states and returns to the closed state.