function X = frtrans(t,x,w)
% FTRANS   Reverse fourier transformation
%
%   frtrans(t,x,w) returns the reverse fourier transformation
%     of x.
%
%     Some parameters have to fulfil special conditions:
%
%       t: column vector
%       x: vector
%       w: row vector
%
%     t and x have to hold the same number of elements .

%X = 1/2/pi*trapz(w, (diag(x)*exp(j*w.'*t.').') );
X = 1/2/pi*trapz(w, diag(x)*exp(j*t*w));

end
