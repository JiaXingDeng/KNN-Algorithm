function [class] = KNN(trainingSample,trainingLabels,testingSample,k)
%%
%ʹ��knn��
% trainingSampleָ��������,trainingLabelsָ������ǩ��aָ�ݶ��½�ѧϰ�ʣ�kָk���ڷ���ѡȡ���ٽ�����
% �����classָ������������
% EXAMPLE��
%load('knn.mat');
%class = KNN(train_X,train_y,test_X(1,:),20);
[M,~] = size(trainingSample);
Distance = zeros(M,1);
for i = 1:M
    training = trainingSample(i,:);
    Distance(i) = sum(sqrt((training - testingSample).^2)); %������룬ʹ��ŷʽ����
end
[~,ind]= sort(Distance);%�Ծ����������
labs = trainingLabels(ind(1:k));%ȡ�������k����ı�ǩ
All_labs = unique(labs);%�ҳ�k�����д��ڵ����
LabNum = length(All_labs);
Vote=zeros(LabNum,1);
for i=1:LabNum
    Vote(i) = length(find(labs==All_labs(i)));%����ÿ�����������
end
[~,ind]=max(Vote);%ȡ�������Ӧ��ǩ
class = All_labs(ind);
end

