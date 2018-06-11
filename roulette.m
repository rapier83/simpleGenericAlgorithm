% ---
% # Title: This function returns roullet choice result.
% ## Authour: KJ, Huzen Dev. House
% ## We dream some dramatic change, 
% ## We make dramatic machines for people.
% ---

% Input an 1-dimension numeric matrix,

function result = roulette(m, n, varargin) 
    Defaults = {};
    IDX = ~cellfun('isempty', varargin);
    Defaults(IDX) = varargin(IDX);
    if isempty(Defaults)
        t = 'none';
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
    
    %% Section 2: - Set Roll-Board     
    %   The boarder starts from 0 to max(m)
    %   If you need the casino roulette, input vector like [1; 1; ...];
    %   If shuffle is `ON` number will be replaced.
    switch t
        case 'shuffle'
            % shuffle function is`v(randperm(length(v))`
            m = m(randperm(length(v1)));
        case 'sort'
            m = sort(m);
        case 'none'
            
    end
    
    % Set boarder by culmulative summary
    % the random number `pin` will roll roulette, and be stop 
    % some range in where from 0 to sum of stop point
    b = [0; cumsum(m);];
    
    % check is result of roulette
    % `n` if and only if `sum(check)`
    chk = zeros(length(m),1);
    
    %% Section 3: - Roll Dice
    %   
    for i = 1:n
        c = repmat(rand * max(b), 1, length(m) + 1)'
        s = c < b;
        idx = find(s~=0, 1, 'first');
        chk(idx-1) = chk(idx-1) + 1;
    end
    
    result = chk;
end
