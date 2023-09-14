function out = mu4(Bin, T)
    load bh300.txt
    load bh400.txt
    load bh500.txt
    load bh550.txt
    load bh600.txt
    load bh800.txt

    H = ones(length(Bin), 1);

    HB(:, :, 1) = [bh300(:, 2), bh300(:, 1)];
    HB(:, :, 2) = [bh400(:, 2), bh400(:, 1)];
    HB(:, :, 3) = [bh500(:, 2), bh500(:, 1)];
    HB(:, :, 4) = [bh550(:, 2), bh550(:, 1)];
    HB(:, :, 5) = [bh600(:, 2), bh600(:, 1)];
    HB(:, :, 6) = [bh800(:, 2), bh800(:, 1)];

    temperatures = [573.1500 673.1500  773.1500  823.1500 873.15 1073.15];
    
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
        
        index_sup = index_inf+1;
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


    

