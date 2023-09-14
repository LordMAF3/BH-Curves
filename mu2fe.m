function out = mu2fe(Bin)
    load fbh23.txt

    HB = [fbh23(:, 2), fbh23(:, 1)];

    H = interp1(HB(:, 1), HB(:,2)*1000, Bin, 'linear', 'extrap');

    mu = Bin./H/(4*pi*10^-7);
    mu(isnan(mu)) = 1;
    mu(isinf(mu)) = 1;

    out = mu;
end
