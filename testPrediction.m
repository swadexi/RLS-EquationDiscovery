function prediksi = testPrediction(X, y,bias_term,B,library)
X = library.nonlinearize(X,bias_term);

    for st = 1:size(B,2)
        w_rls = B(:,st);
        prediksi{st}=[y(:,st) X*w_rls];
        fitx= calc_fitR(y(:,st),X*w_rls);
        msex = calc_rmse(y(:,st), X * w_rls);
    end
end