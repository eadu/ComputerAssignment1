% %Exericse 1.a
X = randi([1 6], 1, 100);
binCenters = [1:6];
figure;
hist(X, binCenters);
title("Draw = 100");
xlabel("Sample Space");
ylabel("Number of occurences");

%Exericse 1.b
X = randi([1 6], 1, 10000);
binCenters = [1:6];
figure;
hist(X, binCenters);
title("Draw = 10000");
xlabel("Sample Space");
ylabel("Number of occurences");

%Exericse 1.c
X = randi([1 6], 1, 100);
Y = randi([1 6], 1, 100);
Z = X + Y;
binCenters = [2:12];
figure;
hist(Z, binCenters);
title("Z1,...,Z100 Plot");
xlabel("Sample Space");
ylabel("Number of Occurences");

%Exericse 1.d
X = randi([1 6], 1, 10000);
Y = randi([1 6], 1, 10000);
Z = X + Y;
binCenters = [2:12];
figure;
hist(Z, binCenters);
title("Z1,...,Z10000 Plot");
xlabel("Sample Space");
ylabel("Number of Occurences");

%Exercise 1.e
[counts,centers] = hist(Z, binCenters);
probability = sum(counts(5:7)) / sum(counts);

%Exercise 1.f
num = 10000;
Z = zeros(1, num);
for i = 1:10
    X = randi([1 6], 1, num);
    Z = Z + X;
end
figure;
binCenters = [10:60];
hist(Z, binCenters);
title("Z1,...,Z10000 for K = 10");
xlabel("Sample Space");
ylabel("Number of Occurences");

%Exercise 1.g
num = 10000;
Z = zeros(1, num);
for i = 1:100
    X = randi([1 6], 1, num);
    Z = Z + X;
end
figure;
binCenters = [100:600];
hist(Z, binCenters);
title("Z1,...,Z10000 for K = 100");
xlabel("Sample Space");
ylabel("Number of Occurences");

%Exercise 2
Nset = round(logspace(2,5,100));
temp = 1;
vowels = [1,5,9,15,21];
for lcv = 1:numel(Nset)
    X = randi([1 26], 1, Nset(lcv));
    Y = randi([1 25], 1, Nset(lcv));
   
    count = 0;
    count1 = 0;
    for i = 1:Nset(lcv)
        if X(i) >= Y(i)
            Y(i) = Y(i) - 1;
        end
        if ismember(X(i),vowels) == 1 && ismember(Y(i),vowels) == 0
            %first one is a vowel, the 2nd is a consonant
            count = count + 1;
        elseif ismember(X(i), vowels) == 0 && ismember(Y(i),vowels) == 1
                %first one is consonant, second one is a vowel
                count1 = count1 + 1;
                %count = count + 1;
        %end
        end
    end
    prob_est(lcv) = (count / Nset(lcv)) + (count1 / Nset(lcv));
    prob_true(lcv) = 2 * (21/130);
    error = (abs((prob_est(lcv) - prob_true(lcv)) / (prob_true(lcv)))) * 100;
    if(error < 5.0 && temp == 1)
        minN = Nset(lcv);
        temp = 0;
    end
end
figure;
minN
hold all;
plot(Nset, prob_est);
plot(Nset, prob_true);
title("Probability of Drawing a vowel and a consonant in 2 Draws");
xlabel("Number of Experiments");
ylabel("Probability");
plot(Nset, (prob_true + std(prob_est)) / sqrt(Nset));
plot(Nset, (prob_true - std(prob_est)) / sqrt(Nset));