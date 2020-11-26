%%
%该文件用于测试KNN算法的效果，直接运行即可
load('knn.mat')
[train_X,test_X,train_y,test_y]=train_test_split2(x,y,0.3); %划分测试集与训练集
[M,N]=size(test_X);
class=zeros(1,M);
for i=1:M
    class(i) = KNN(train_X,train_y,test_X(i,:),20);%逐个使用KNN法判断
end
%%
%绘图
ttt=1:1:M;
stem(ttt,class,'ro');
hold on;
stem(ttt,test_y,'bo');
hold off;