
ALTER TABLE PolicyBranchTypes
ADD PolicyCat TEXT;
UPDATE PolicyBranchTypes SET 'PolicyCat' = Default;

