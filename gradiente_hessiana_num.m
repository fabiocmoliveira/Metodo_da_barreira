function [J,H]=gradiente_hessiana_num(f,x0,h)

n=length(x0);
J=zeros(n,1);
H=zeros(n,n);
versors_e=eye(n,n);
for i=1:n
    
    J(i)=(f(x0+h(i)*versors_e(:,i))-f(x0-h(i)*versors_e(:,i)))/(2*h(i));
    
    for j=1:n
        
%         H(i,j)=(f(x0+h(i)*versors_e(:,i)+h(j)*versors_e(:,j))...
%                 -f(x0+h(i)*versors_e(:,i))...
%                 -f(x0+h(j)*versors_e(:,j))...
%                 +f(x0))/(h(i)*h(j));

                
        H(i,j)=(f(x0+h(i)*versors_e(:,i)+h(j)*versors_e(:,j))...
                -f(x0-h(i)*versors_e(:,i)+h(j)*versors_e(:,j))...
                -f(x0+h(i)*versors_e(:,i)-h(j)*versors_e(:,j))...
                +f(x0-h(i)*versors_e(:,i)-h(j)*versors_e(:,j)))/(4*h(i)*h(j));

    end
    
end
H=(H+H')/2;
end