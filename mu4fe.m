function out = mu4fe(Bin, T)
    load fbh302.txt
    load fbh642.txt
    load fbh751.txt

    H = ones(length(Bin), 1);

    HB(:, :, 1) = [fbh302(:, 2), fbh302(:, 1)];
    HB(:, :, 2) = [fbh642(:, 2), fbh642(:, 1)];
    HB(:, :, 3) = [fbh751(:, 2), fbh751(:, 1)];

    temperatures = [575.15 915.15 1024.15];
    
    for i=1:length(Bin)
        
        temp = (T(i) >= temperatures);
        temp = temperatures(temp);

        if length(temp) == length(temperatures)
            T_inf = temp(end-1);
            index_inf = length(temperatures)-1;
        elseif length(temp) > 0
            T_inf = temp(end);
            index_inf = length(temp);
        else
            T_inf = temperatures(1);
            index_inf = 1;
        end
        
        index_sup = index_inf + 1;
        T_sup = temperatures(index_sup);

        H_inf = interp1(HB(:, 1, index_inf), HB(:, 2, index_inf)*1000, Bin(i), 'linear', 'extrap');
        H_sup = interp1(HB(:, 1, index_sup), HB(:, 2, index_sup)*1000, Bin(i), 'linear', 'extrap');

        H(i) = H_inf + (H_sup-H_inf)*(T(i)-T_inf)/(T_sup-T_inf);
    end
    
    mu = Bin./H/(4*pi*10^-7);
    mu(isnan(mu)) = 1;
    mu(isinf(mu)) = 1;

    out = mu;
end


    

