function label = treemodel(input)    
	model = loadLearnerForCoder('ClassificationTree.mat');    
	label = predict(model,input);
end
