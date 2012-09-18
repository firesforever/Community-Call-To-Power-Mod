-- Edited by Horem, added proper syntax --
ALTER TABLE PolicyBranchTypes ADD "PolicyCat" text default NULL; 
UPDATE PolicyBranchTypes SET PolicyCat = 'NULL';

