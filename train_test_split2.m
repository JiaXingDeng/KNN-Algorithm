function [train_X,test_X,train_y,test_y]=train_test_split2(x,y,r)
%%
%该函数用于划分k近邻法所需的训练集和测试集
%x指数据,y指标签，r指测试集占样本总数的比例
%输出中，train_X和train_y表示训练集的数据和标签，test_X和test_y表示测试集的数据和标签
%EXAMPLE：
%load('knn.mat');
%[train_X,test_X,train_y,test_y]=train_test_split2(x,y,0.3)
data=[x,y];
trainindex = crossvalind('HoldOut',size(data,1),r);
testindex = ~trainindex;
traindata = data (trainindex,:);
testdata = data (testindex,:);
train_X = traindata(:,1:4);
test_X = testdata(:,1:4);
train_y = traindata(:,5);
test_y = testdata(:,5);