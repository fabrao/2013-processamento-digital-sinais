function y = FFT2(n)
    
    %fprintf('n1 = ');   fprintf('%d  ', n); fprintf('\n\n');
    
    x = length(n); %Tamanho do Vetor de entrada
    n = n(bitrevorder(1:x));  %Realoca o vetor para divisão (posições pares ind_final impares)
    q = round(log(x)/log(2)); %Parte inteira (Numero de Passos para divisões)
    
    %fprintf('q = ');   fprintf('%d  ', q);    fprintf('\n\n');
    
    %fprintf('n2 = ');	fprintf('%d  ', n);	fprintf('\n\n');

    
    for j = 1:q
        %fprintf('\n\nFOR 1\n');
        %fprintf('j = %d  \n', j);

        m = 2^(j-1);
        d = exp(-2 *pi * 1i /m).^(0:m-1);
        
        %fprintf('m = %d  \n', m);
        
        %fprintf('d = %d ', d);
        %fprintf('\n\n');

        for k = 1:2^(q-j)
            %fprintf('\nFOR 2 \n\n');
            %fprintf('2^(q-j) = %d  \n', 2^(q-j));
            %fprintf('k = %d  \n', k);
  
           
            ind_inicial = (k-1)*2*m+1;                              % Indice Inicial
                %fprintf('ind_inicial = %d  \n', ind_inicial);
            
            ind_final = k*2*m;                                      % Indice Final
                %fprintf('ind_final = %d  \n', ind_final);
            
            ind_mid = ind_inicial + (ind_final - ind_inicial + 1) / 2;    % Indice Mediano
                %fprintf('ind_mid = %d  \n\n', ind_mid);
                        
            
            %%%%%%%%%% SEPARA EM DUAS SEQUÊNCIAS %%%%%%%%%%
            sequencia_cima = n(ind_inicial:(ind_mid - 1));   
                %fprintf('sequencia_cima = %d  \n', sequencia_cima);
            
            sequencia_baixo = n(ind_mid:ind_final);
                %fprintf('sequencia_baixo = %d  \n', sequencia_baixo);
            
                
            z = d .* sequencia_baixo;
                %fprintf('z = ');    fprintf('%d  ', z);     fprintf('\n\n');
            
            y = [sequencia_cima + z, sequencia_cima - z];
                %fprintf('y = ');    fprintf('%d  ', y);     fprintf('\n\n');
                
            n(ind_inicial:ind_final) = y;
                %fprintf('n = ');    fprintf('%d  ', n);     fprintf('\n\n');
            
        end
    end
end