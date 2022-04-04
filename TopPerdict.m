function [Names] = TopPerdict(score,Class)
    %% set up
   [SScore,Indx] = sort(score,2);
   [x,y] = size(Indx);
   %% images
   for i = 1:x % Gose down though each image to be clasifed
       scoT = 0;
       %% top five
       for j = 1:5 % Gose left from right though top 5 choices
            Names(i,j) =  Class(Indx(i,y-j+1));
            % store cofidince levels
            sco = SScore(i,y-j+1);
            %Scores(i,j) = sco;
            %scoT = scoT+sco;
       end
       %Scores(i,1) = scoT/5;
   end
   %fprintf('\nAvrge first 5 choices: %f\n', mean(Scores))
   %fprintf('\nAvrge first choice: %f\n\n', sum(SScore(:,y))/x)
end %save