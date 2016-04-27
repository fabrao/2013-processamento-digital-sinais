function H = FFT3(x)

    n = length(x);  % x = tamanho do vetor
    
    if n == 1 % Se tamanho do vator = 1 -> retorna vetor
        H = x;
    
    else % Senão separa e transforma vetor 
        m = n/2; % m = metade do tamanho do vetor
        
        vet_top = FFT3(x(1:2:(n-1))); % Separa sequencia superior até n==1(recursivo)
        vet_bot = FFT3(x(2:2:n)); % Separa sequencia inferior até n==1 (recursivo)
        
        w = exp(-2 * pi * 1i / n) .^ (0:m-1);
        
        z = w .* vet_bot;
        
        H = [ vet_top + z , vet_top - z ]; % Vetor transformado.
    end
end