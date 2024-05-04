function X = ftrans(t, x, w)
% FTRANS   Fourier transformation
%
%   ftrans(t,x,w) returns the Fourier transformation of x at
%     the frequency points w with respect to the given time
%     axis.
%
%     Some parameters have to fulfill special conditions:
%
%       t: column vector
%       x: vector
%       w: row vector
%
%     t and x have to hold the same number of elements .

X = trapz(t, diag(x)*exp(-j*t*w));

end
