function [state] = matterState(s='none', t=20)
% YOUR NAME: Jiacheng Sun
% DATE: Sep 24, 2018
%
% DESCRIPTION: A function to determine the state of matter of a given substance
% at teh given temperature.
%
% Usage: matterState(s, t)
%
% s - a character string giving the substance 
% t - a scalar describing temperature in degrees
%
% The output will be solid, liquid, or gas, unless the temperature given is
% exactly the melting or boiling point of the substance, in which case the
% output will be either melting or boiling.
%
% Example: >> state = matterState('water') 
%          state = liquid
%
% Example: >> state = matterState('water',-10) 
%          state = solid
%
% Example: >> state = matterState('water', 0)
%          state = melting
%
% Example: >> state = matterState('water', 100)
%          state = boiling

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Your switch to determine the substance
 
    switch s
      case 'water'
        state = getState(t, 0 , 100);

      case 'oxygen'
        state = getState(t, -218.8 , -183);

      case 'nitrogen'
        state = getState(t, -210 , -195.8);

      case 'sodium'
        state = getState(t, 97.7 , 882.8);

      case 'methanol'
        state = getState(t, -97.6 , 64.7);

      case 'iron'
        state = getState(t, 1538 , 2862);

      case 'mercury'
        state = getState(t, -38.8 , 356.7);

      otherwise
      disp('Substance must be one of the following:')
      fprintf('water\n')
      fprintf('oxygen\n')
      fprintf('nitrogen\n')
      fprintf('sodium\n')
      fprintf('methanol\n')
      fprintf('iron\n')
      fprintf('mercury\n')
    end

% This is the end of the main function
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Below is a local function named getState. 
% Create this function first, then use it as needed in your main function.

function [state] = getState(t, mp, bp)
  if (t < mp)
    state = 'solid';
  elseif (t == mp)
    state = 'melting';
  elseif (t > mp & t <bp)
    state = 'liquid';
  elseif( t == bp )
    state = 'boiling';
  elseif (t > bp)
    state = 'gas';
  else
    error('Temperature must be a number.');
  end
end
