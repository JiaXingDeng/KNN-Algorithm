function [class] = KNN(trainingSample,trainingLabels,testingSample,k)
%%
%使用knn法
% trainingSample指样本数据,trainingLabels指样本标签，a指梯度下降学习率，k指k近邻法中选取的临近点数
% 输出中class指数据输出的类别
% EXAMPLE：
%load('knn.mat');
%class = KNN(train_X,train_y,test_X(1,:),20);
[M,~] = size(trainingSample);
Distance = zeros(M,1);
for i = 1:M
    training = trainingSample(i,:);
    Distance(i) = sum(sqrt((training - testingSample).^2)); %计算距离，使用欧式距离
end
[~,ind]= sort(Distance);%对距离进行排序
labs = trainingLabels(ind(1:k));%取出最近的k个点的标签
All_labs = unique(labs);%找出k个点中存在的类别
LabNum = length(All_labs);
Vote=zeros(LabNum,1);
for i=1:LabNum
    Vote(i) = length(find(labs==All_labs(i)));%计算每个点代表的类别
end
[~,ind]=max(Vote);%取出结果对应标签
class = All_labs(ind);
end

