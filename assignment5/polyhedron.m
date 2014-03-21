%% plot the vertex and constraint data given in problem 2
%% CSCI 5654, Assignment 5, Fall 2013
%% Kelly Kaoudis


function polyhedron()
    %% x + y + z - b = 0
    A = [-89 18 -1 -72;
         -55 14 -1 -42;
         -29 10 -1 -20;
         -19  8 -1 -12;
         -11  6 -1 -6;
         -41 12 -1 -30;
         -71 16 -1 -56;
         206 -25 1 560;
         140 -21 1  300;
         32 -13 1 20;
         56 -15 1 60;
         82 -17 1 120;
         110 -19 1 200;
         172 -23 1 420;
         -109 20 -1 -90;
         242 -27 1 720;];
     
     V = [1 1 1;
          2 4 8;
          3 9 27;
          4 16 64;
          5 25 125;
          6 36 216;
          7 49 343;
          8 64 512;
          9 81 729;
          10 100 1000];
     
    %  for i = 1:16
    %      for j = 1:10
    %          if((A(i,1)*V(j,1) + A(i,2)*V(j,2) + A(i,3)*V(j,3)) == A(i,4))
    %              fprintf('VERTEX %i BELONGS TO FACE %i \n', j, i);
    %          end
    %      end
    %  end
    
       scatter3(1,1,1)
       hold on
       
       scatter3(2,4,8)
       hold on
       
       scatter3(3,9,27)
       hold on
       
       scatter3(4,16,64) 
       hold on
       
       scatter3(5,25,125)
       hold on
       
       scatter3(6, 36, 216)
       hold on
       
       scatter3(7,49,343)
       hold on
       
       scatter3(8,64,512)
       hold on
       
       scatter3(9,81, 729)
       hold on
       
       scatter3(10,100,1000)
       hold on
    
       %%F1
      fill3( [1 8 9], [1 64 81], [1 512 729],'r');
      hold on
      
      %%F2
      fill3( [1 6 7], [1 36 49], [1 216 343], 'g');
      hold on
      
      %%F3
      fill3([1 4 5], [1 16 25], [1 64 125], 'b'  );
      hold on
      
      %%F4
      fill3([1 3 4], [1 9 16], [1 27 64], 'y');
      hold on
      
      %%F5
      fill3([1 2 3], [1 4 9], [1 8 27], 'm');
      hold on
      
      %%F6
      fill3([1 5 6], [1 25 36], [1 125 216], 'c');
      hold on
      
      %%F7
      fill3([1 7 8], [1 49 64], [1 343 512], 'r');
      hold on
      
      %%F8
      fill3([7 8 10], [49 64 100], [343 512 1000], 'g');
      hold on
      
      %%F9
      fill3([5 6 10], [25 36 100], [125 216 1000], 'b');
      hold on
      
      %%F10
      fill3([1 2 10], [1 4 100], [1 8 1000], 'y');
      hold on
      
      %%F11
      fill3([2 3 10], [4 9 100], [8 27 1000], 'm');
      hold on
      
      %%F12
      fill3([3 4 10], [9 16 100], [27 64 1000], 'c');
      hold on
      
      %%F13
      fill3([4 5 10], [16 25 100], [64 125 1000], 'r');
      hold on
      
      %%F14
      fill3([6 7 10], [36 49 100], [216 343 1000], 'g');
      hold on
      
      %%F15
      fill3([1 9 10], [1 81 100], [1 729 1000], 'b');
      hold on
      
      %%F16
      fill3([8 9 10], [64 81 100], [512 729 1000], 'y');
      hold on
     
      view(0,90)
end