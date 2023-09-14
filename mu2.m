function out = mu2(Bin)
    load bh21.txt

    HB = [bh21(:, 2), bh21(:, 1)];

    H = interp1(HB(:, 1), HB(:,2)*1000, Bin, 'linear', 'extrap');

    mu = Bin./H/(4*pi*10^-7);
    mu(isnan(mu)) = 1;
    mu(isinf(mu)) = 1;

    out = mu;
end
