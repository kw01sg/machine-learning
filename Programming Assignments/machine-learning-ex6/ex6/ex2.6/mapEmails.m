function email_indices = mapEmails(rawEmails)

m = size(rawEmails, 2);

email_indices = cell(m, 1);

vocabList = getVocabList();

for i = 1:m
    email = rawEmails{i};
    word_indices = [];
    for j = 1:numel(email)
        [if_exist, s_index] = ismember(email{j}, vocabList);
    
        if if_exist
            word_indices = [word_indices; s_index];
        endif
    endfor
    
    email_indices{i} = word_indices;
endfor

endfunction