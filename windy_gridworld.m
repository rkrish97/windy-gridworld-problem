alpha = 0.5;
epsilon = 0.1;
for i=1:7
    Q(i,:) = {{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]},{[0 0 0 0]}};
end
Q{4,8}{1}=[0 0 0 0]; %terminal state
episode_count = 1;
t=0;
A=[0];
time_steps = [];
plot_epi_count = [];
while episode_count<200
    State = [4,1];
    if(epsilon<=rand())
        max_value = max(Q{State(1),State(2)}{1});
        ind = find(Q{State(1),State(2)}{1}==max_value);
        action = ind(randi(length(ind)));
    else
        action = randi(4);
    end
    R=-1;
    while R~=1
        t=t+1;
        if(action == 1) %left
            next_state = [State(1),State(2)-1];
        elseif(action==2) %up
            next_state = [State(1)-1,State(2)];
        elseif(action==3) %right
            next_state = [State(1),State(2)+1];
        elseif(action==4) %down
            next_state = [State(1)+1,State(2)];
        end
        if(ismember(State(2),[4,5,6,9]))
            next_state(1) = next_state(1) - 1;
        end
        if(ismember(State(2),[7,8]))
            next_state(1) = next_state(1) - 2;
        end
        if(next_state(2)<1)
            next_state(2) = State(2);
        end
        if next_state(2)>10
            next_state(2) = State(2);
        end
        if next_state(1)>7
            next_state(1) = State(1);
        end
        if next_state(1)<1
            next_state(1) = State(1);
        end
        if(next_state(1)==4&&next_state(2)==8)
            R=1;
        else
            R=-1;
        end
        if(epsilon<=rand())
            max_value = max(Q{next_state(1),next_state(2)}{1});
            ind = find(Q{next_state(1),next_state(2)}{1}==max_value);
            next_action = ind(randi(length(ind)));
        else
            next_action = randi(4);
        end
        Q{State(1),State(2)}{1}(action)= Q{State(1),State(2)}{1}(action) + alpha*(R + Q{next_state(1),next_state(2)}{1}(next_action) - Q{State(1),State(2)}{1}(action));
        State = next_state;
        action = next_action;
        time_steps = [time_steps, t];
        plot_epi_count = [plot_epi_count,episode_count];
    end
    episode_count=episode_count+1;
end
State = [4,1];
states = [];
max_value = max(Q{State(1),State(2)}{1});
ind = find(Q{State(1),State(2)}{1}==max_value);
action = ind(randi(length(ind)));
states = [states,State];
if(action == 1) %left
    next_state = [State(1),State(2)-1];
elseif(action==2) %up
    next_state = [State(1)-1,State(2)];
elseif(action==3) %right
    next_state = [State(1),State(2)+1];
elseif(action==4) %down
    next_state = [State(1)+1,State(2)];
end
while(~(next_state(1)==4&&next_state(2)==8))
    max_value = max(Q{State(1),State(2)}{1});
    ind = find(Q{State(1),State(2)}{1}==max_value);
    action = ind(randi(length(ind)));
    if(action == 1) %left
        next_state = [State(1),State(2)-1];
    elseif(action==2) %up
        next_state = [State(1)-1,State(2)];
    elseif(action==3) %right
        next_state = [State(1),State(2)+1];
    elseif(action==4) %down
        next_state = [State(1)+1,State(2)];
    end
    if(ismember(State(2),[4,5,6,9]))
            next_state(1) = next_state(1) - 1;
    end
        if(ismember(State(2),[7,8]))
            next_state(1) = next_state(1) - 2;
        end
        if(next_state(2)<1)
            next_state(2) = State(2);
        end
        if next_state(2)>10
            next_state(2) = State(2);
        end
        if next_state(1)>7
            next_state(1) = State(1);
        end
        if next_state(1)<1
            next_state(1) = State(1);
        end
        states = [states,next_state];
        State = next_state
end 
oddstates=[];
evenstates=[];
for(i=1:length(states))
    if mod(i,2)==0
       evenstates = [evenstates,states(i)];
    else
        oddstates = [oddstates,states(i)];
    end
    
end
for(i=1:length(oddstates))
    if(oddstates(i)==3)
        oddstates(i)=5;
    elseif(oddstates(i)==2)
        oddstates(i)=6;
    elseif(oddstates(i)==1)
        oddstates(i)=7;
    elseif(oddstates(i)==5)
        oddstates(i)=3;
    elseif(oddstates(i)==6)
        oddstates(i)=2;
    elseif(oddstates(i)==7)
        oddstates(i)=1;
    end
end
scatter(evenstates,oddstates);
figure;
plot(time_steps, plot_epi_count);