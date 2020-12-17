# windy-gridworld-problem
For the problem, alpha and epsilon are initialized as 0.5 and 0.1 respectively. Q was created as a
matrix of arrays which can also be called as cell arrays. It has the dimension of 7x10 which represents
the gridworld. In each location in the Q cell, there is a list which represent the action value for each
action. The first element in the list represents left, second represents up, third represents right and the
fourth represents down. It is initialized arbitrarily to zeros including the terminal state. For all the states,
the reward will be -1 and for reaching the terminal state, the reward will be +1. Now the algorithm is
looped for each episode and I have set the number of episodes to be 200. The first state is initialized as
[4,1]. From the Q matrix, following e-greedy algorithm, the first action is taken. Now another loop is
started which goes on till the terminal state is reached. The R is stored and based on action, the next
state is evaluated and hence the next action too by following e-greedy algorithm. Now, by using the
update step given for SARSA, the Q value is updated. The old state is now saved as the new state and
the old action as the new action. By using this, the loop proceeds till a terminal state is reached. The
time steps and the corresponding episode count during that time step is recorded in an array which can
later be plotted to observe how it varies. Since the arrangement of the cell array for Q varies from how
an actual coordinate system looks like, it has to be switched in order to plot this graph. 

## Discussion:
Sometimes, the algorithm is not able to converge to an optimal policy and gets stuck in between. This
tends to happen because it is a drawback in the system as given in the book. The book states that SARSA
doesn’t solve this unique problem and that is why we need to move to a different technique. But again,
most of the times, the algorithm converges to an optimal policy. Sometimes it also converges to an
alternate path which is slightly different from the original one. This is stated in the example in the book
too where they had the shortest step length of 15 but had an average length of 17.
