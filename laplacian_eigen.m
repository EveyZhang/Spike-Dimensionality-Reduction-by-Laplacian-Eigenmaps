function Low_dim_S = laplacian_eigen(S,dim)
%Laplacian Eigen
%Input:
%   X: Original high dimensional data
%   dim: Low dimension
%Output:
%   mappedX: Low dimensionality data
% 
%% Construct adjacency map
disp('call LE');
S1=S';
k=12;%KNN
[r c]=size(S1);% r=data length, c=number of neurons
W=squareform(pdist(S1,'euclidean')); %W:r by r
[tmp idx]=sort(W);
for i=1:size(W,1)
    non_adj=idx((2+k):end,i);
    W(i,non_adj)=0; % set the Weight of non-Nearest neighborhood to the 0
end
W=sparse(double(W));
W=max(W,W');

%% Calculate Weight
%1.Simplify, w=1 if the point i, j is connected, otherwise w=0
% Result£ºfail
%{
for i=1:r
    for j=1:c
        if W(i,j)==0
            W(i,j)=1;
        end
    end
end
%}
%2.based on heat kernel function
sigma=1.0;
for i=1:r
    for j=1:c
        if W(i,j)~=0
            W(i,j)=exp(-W(i,j)/(2*sigma^2));
        end
    end
end

%% Degree matrix
a=size(W,1);
D=zeros(a,a);
for i=1:a
    D(i,i)=sum(W(i,:));
    if isnan(D(i,i))||isinf(D(i,i))
        D(i,i)=0;
    end
end

%% eigenmaps
L=D-W;
for i=1:size(L,1)
    for j=1:size(L,2)
        if isnan(L(i,j))||isinf(L(i,j))
            L(i,j)=0;
        end
    end
end
opts.isreal=1;
opts.issym=1;
opts.disp=0;
%[V Lambda]=eigs(L,D,dim+1,'SM',opts);
%[VV eigenValue]=eig(L,D);
[Vector Lambda]=eigs(L,D,dim+1,0,opts);% 0 is sm
[Lambda zhanwei]=sort(diag(Lambda),'ascend');
Lambda=Lambda(2:dim+1);
%eigenValue=max(eigenValue,0);
%ratio=sum(sum(Lambda))/sum(sum(eigenValue))
S2=Vector(:,zhanwei(2:(dim+1)));
Low_dim_S=S2';

           
end

