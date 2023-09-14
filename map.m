load bh21.txt
load bh300.txt
load bh400.txt
load bh500.txt
load bh550.txt
load bh600.txt

H = linspace(0, 1, 30);
T = [294.15 573.15 673.15 773.15 823.15 873.15]';
method = 'linear';

BH1 = interp1(bh21(:, 1), bh21(:, 2), H, method, 'extrap');
BH2 = interp1(bh300(:, 1), bh300(:, 2), H, method, 'extrap');
BH3 = interp1(bh400(:, 1), bh400(:, 2), H, method, 'extrap');
BH4 = interp1(bh500(:, 1), bh500(:, 2), H, method, 'extrap');
BH5 = interp1(bh550(:, 1), bh550(:, 2), H, method, 'extrap');
BH6 = interp1(bh600(:, 1), bh600(:, 2), H, method, 'extrap');

figure("Name", "3D Map");
surf(H, T, [BH1; BH2; BH3; BH4; BH5; BH6]);
xlabel("H [kA/m]")
ylabel("T [K]");
zlabel("B [T]");

figure("Name", "Parametric Graph");
hold on;
plot(H, BH1, 'LineWidth', 2);
plot(H, BH2, 'LineWidth', 1);
plot(H, BH3, 'LineWidth', 1);
plot(H, BH4, 'LineWidth', 1.5);
plot(H, BH5, 'LineWidth', 1.5);
plot(H, BH6, 'LineWidth', 1.5);
legend(num2str(T) + " K");
xlabel("H [kA/m]");
ylabel("B [T]");