load fbh23.txt
load fbh302.txt
load fbh642.txt
load fbh751.txt

H = linspace(0, 2, 30);
T = [296.15 575.15 915.15 1024.15]';
method = 'linear';

BH1 = interp1(fbh23(:, 1), fbh23(:, 2), H, method, 'extrap');
BH2 = interp1(fbh302(:, 1), fbh302(:, 2), H, method, 'extrap');
BH3 = interp1(fbh642(:, 1), fbh642(:, 2), H, method, 'extrap');
BH4 = interp1(fbh751(:, 1), fbh751(:, 2), H, method, 'extrap');

figure("Name", "3D Map");
surf(H, T, [BH1; BH2; BH3; BH4]);
xlabel("H [kA/m]")
ylabel("T [K]")
zlabel("B [T]")

figure("Name", "Parametric Graph");
hold on;
plot(H, BH1, 'LineWidth', 2);
plot(H, BH2, 'LineWidth', 1);
plot(H, BH3, 'LineWidth', 1);
plot(H, BH4, 'LineWidth', 1.5);
legend(num2str(T) + " K");
xlabel("H [kA/m]");
ylabel("B [T]");