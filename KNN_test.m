%%
%���ļ����ڲ���KNN�㷨��Ч����ֱ�����м���
load('knn.mat')
[train_X,test_X,train_y,test_y]=train_test_split2(x,y,0.3); %���ֲ��Լ���ѵ����
[M,N]=size(test_X);
class=zeros(1,M);
for i=1:M
    class(i) = KNN(train_X,train_y,test_X(i,:),20);%���ʹ��KNN���ж�
end
%%
%��ͼ
ttt=1:1:M;
stem(ttt,class,'ro');
hold on;
stem(ttt,test_y,'bo');
hold off;