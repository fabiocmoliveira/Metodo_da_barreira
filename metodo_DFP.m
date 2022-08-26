function x1=metodo_DFP(f,g,x0,parametros_DFP,parametros_dicotomica)


%Parâmetros para a busca dicotômica
% ci=1e-5;
% intmaxdico=100;
% intervalodico=[0 10];
ci=parametros_dicotomica{1};
intmaxdico=parametros_dicotomica{2};
intervalodico=parametros_dicotomica{3};

%Parâmetros para o DFP
% epsilon=1e-5;
% intmax=100;
epsilon=parametros_DFP{1};
intmax=parametros_DFP{2};

%Início do processo iterativo
int=0;
D=eye(length(x0));%Matriz para a primeira estimativa deve ser positiva definida
while int<intmax
   
    %Direção de descida
    d=-D*g(x0);
    
    %Minimização para o passo ótimo 
    falpha=@(alpha)f(x0+alpha*d);
    alphamin=dicotomica1D(falpha,ci,ci/10,intervalodico,intmaxdico);
    
    %Próximo ponto
    x1=x0+alphamin*d;
    
     %Convergência
    if abs(x1-x0)<epsilon
        
%         disp('Convergência')
        break
        
    end
    
    %Atualização da estimativa da Hessiana
    s=x1-x0;
    y=g(x1)-g(x0);
    if s'*y<=0
        
        D=eye(length(x0));
        disp('reset')
    
    else
        
        D=D+s*s'/(s'*y)-D*(y*y')*D/(y'*D*y);
    
    end
    
    %Número de iterações
    int=int+1;
    x0=x1;
    if int==intmax
        
        disp('Número máximo de iterações atingido')
        break
        
    end    
    
end
% disp(x1)
% disp(f(x1))
