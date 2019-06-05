function split = splitstring(str)
%
% split = splitstring(str)
%
% Split a string into vertically concatenated strings.
%
%


%
% splitstring.m
%
% Original Author: Doug Greve
% CVS Revision Info:
%    $Author: nicks $
%    $Date: 2007/01/10 22:02:34 $
%    $Revision: 1.2 $
%
% Copyright (C) 2002-2007,
% The General Hospital Corporation (Boston, MA). 
% All rights reserved.
%
% Distribution, usage and copying of this software is covered under the
% terms found in the License Agreement file named 'COPYING' found in the
% FreeSurfer source code root directory, and duplicated here:
% https://surfer.nmr.mgh.harvard.edu/fswiki/FreeSurferOpenSourceLicense
%
% General inquiries: freesurfer@nmr.mgh.harvard.edu
% Bug reports: analysis-bugs@nmr.mgh.harvard.edu
%

if(nargin ~= 1)
  msg = 'USAGE: split = splitstring(str)';
  qoe(msg);error(msg);
end

nstr = 1;
[split nscanned ] = sscanf(str,'%s',1);

while(nscanned > 0)
  fmt = repmat('%*s ',[1 nstr]);
  fmt = [fmt '%s'];
  [tmp nscanned] = sscanf(str,fmt,1);
  if(~isempty(tmp))
    split = strvcat(split,tmp);
    nstr = nstr + 1;
  end
end

return
