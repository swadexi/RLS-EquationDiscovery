function fitR = calc_fitR(y_actual,y_pred)
 %Coefficient of determination (R²):
    if (size(y_actual,1)>size(y_pred,1))
        y_actual = y_actual(1:length(y_pred),:);    
    elseif (size(y_pred,1)>size(y_actual,1))
        y_pred = y_pred(1:length(y_actual),:);
    end
    
    fit_percent = zeros(1,size(y_actual,2));
    for i=1:size(y_actual,2)
        y_mean = mean(y_actual(:,i));        
        ss_res = sum((y_pred(:,i) - y_actual(:,i)).^2);
        ss_tot = sum((y_actual(:,i) - y_mean).^2);
        R2 = 1 - (ss_res / ss_tot);
        fit_percent(i) = R2*100;       
    end
    
   fitR =fit_percent;
   
   fprintf('\n Fitness Scores           :[%s] %% \n', num2str(fit_percent));
end