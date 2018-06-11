% ---
% # Title: This function returns roullet choice result.
% ## Authour: KJ, Huzen Dev. House
% ## We dream some dramatic change, 
% ## We make dramatic machines for people.
% ---

% Input an 1-dimension numeric matrix,
% If you don't need index number, roulette(m,n, **true**)

function result = roulette(m, r, shuffle, sort) 
    %% Section 0: - Check Arguments
    
    if isempty(shuffle)
        shuffle = false;
    end
    if isempty(sort)
        sort = false;
    end

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
    
    % if shuffle is true let it do `v(randperm(length(v))`
    m = m(randperm(length(v1)));

    %% Section 2: - Set Roll-Board     
    %   The boarder starts from 0 to max(m)
    %   If you need the casino roulette, input vector like [1; 1; ...];
    %   If shuffle is `ON` number will be replaced.
        
    board = cumsum(m);
    
    %% Section 3: - Roll Dice
    %   
    numroll = int16(rand(1,r) * sum(m)); 
    check = zeros(length(m));
    cursor = 1;
    while cursor < r
        if cursor == r
            isin = (number(cursor) < numroll);
        else
            isin = all(m(cursor) >= numroll ...
                && m(cursor + 1) < numroll);
        end
        if isin == 1
            check(cursor) = check(cursor) + 1;
            cursor = cursor + 1;
        end
    end
    
end
