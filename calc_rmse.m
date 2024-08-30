function rm = calc_rmse(plant,ident)
   
    if (length(plant)>length(ident))
        plant = plant(1:length(ident),:);
    elseif (length(ident)>length(plant))
        ident = ident(1:length(plant),:);
    end

    for i=1:size(plant,2)
        %val(i) = sqrt(immse(plant(:,i),ident(:,i))); 
        val(i)  = sqrt(mean ((plant(:,i)-ident(:,i)).^2));  
    end
rm = val;

fprintf(' RMSE                     :[%s]\n', num2str(val));
end