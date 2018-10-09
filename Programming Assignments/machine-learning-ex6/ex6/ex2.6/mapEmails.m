function email_indices = mapEmails(rawEmails)

m = size(rawEmails, 2);

vocabList = getVocabList();

email_indices = zeros(m, numel(vocabList));

for i = 1:m
    email = rawEmails{i};
    word_indices = [];
    for j = 1:numel(email)
        [if_exist, s_index] = ismember(email{j}, vocabList);
    
        if if_exist
            email_indices(i, s_index) = 1;
        endif
    endfor
    
endfor

endfunction