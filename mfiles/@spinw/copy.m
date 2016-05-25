function objC = copy(obj)
% clones spinw object with all data
%
% newObj = COPY(obj)
%
% Use this command instead of the '=' sign if you want to
% create an independent duplicate of an sw class object.
%
% Input:
%
% obj       spinw class object.
%
% Output:
%
% newObj    New spinw class object that contains all the data of
%           obj.
%
% Example:
%
% cryst = spinw;
% cryst.addmatrix('label','J1','value',3.1415)
%
% cryst1 = cryst;
% cryst2 = cryst.copy;
%
% cryst.addmatrix('label','J1','value',1)
% J1a = cryst1.matrix.mat;
% J1b = cryst2.matrix.mat;
%
% Where J1a will be a matrix with 1 in the diagonal, while J1b
% has 3.1415 in the diagonal. If cryst is changed, cryst1 will
% be changed as well and viece versa, since they point to the
% same object. However cryst2 is independent of cryst.
%
% See also SPINW, SPINW.STRUCT.
%

objS = struct(obj);
objC = spinw(objS);

% copy the private properties
objC.propl  = obj.propl;
objC.sym    = obj.sym;
objC.symb   = obj.symb;
objC.fid    = obj.fid;
objC.ver    = obj.ver;

% add new listeners to the new object
if ~isempty(objC.cache.matom)
    % add listener to lattice and unit_cell fields
    objC.propl    = addlistener(objC,'lattice',  'PostSet',@objC.modmatom);
    objC.propl(2) = addlistener(objC,'unit_cell','PostSet',@objC.modmatom);
end

% % empty the cache of the new object
% fieldN = fieldnames(objC.cache);
% for ii = 1:numel(fieldN)
%     objC.cache.(fieldN{ii}) = [];
% end

end