% ---
% # Title: This function returns roullet choice result.
% ## Authour: KJ, Huzen Dev. House
% ## We dream some dramatic change, 
% ## We make dramatic machines for people.
% ---

% Input an 1-dimension numeric matrix,
% If you don't need index number, roulette(m,n, **true**)

function result = roulette(m, n) 

    %% Section 1: - Data Cleaning
    % ## All data must have an one column or row.
    % Function have return 1 where amount of `m` is 1 or 0.

    if or((numel(m) == 0), (numel(m) == 1 ))
        result = 1;
        return;
    end
    
    % The data should be [n1; n2; ... ] ,like column vector form, or
    % [n1 n2   ... ] ,like row vector form will be transpose.
    % It's not nessecery but I wrote for normalization.
    if size(m,2) ~= 1
        m = m';
    end

    % * NaN is turned to be 0.
    m(isnan(m)) = 0;

    %% Section 2: - Set Boarder     
    %   The boarder starts from 0 to max(m)
    boarders = [0];
    t = 0;
    for i = 1:numel(m)
        t = t+m(i);
        boarders = [boarders; t];
        n = 1;
    end
    
end
