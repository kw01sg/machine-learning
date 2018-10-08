function saveVocabList()
    % load varible rawEmails 
    load 'rawEmails.m';

    vocabList = struct();

    for i = 1:numel(rawEmails)
        for j = 1:numel(rawEmails{i})
            if isfield(vocabList, rawEmails{i}{j})
                vocabList.(rawEmails{i}{j}) = vocabList.(rawEmails{i}{j}) + 1;
            else
                vocabList.(rawEmails{i}{j}) = 1;
            endif
        endfor
    endfor

    removeFields = {};
    for [value, key] = vocabList
        if value < 20
            removeFields = [removeFields; key];
        endif
    endfor
    
    vocabList = rmfield(vocabList, removeFields);
    
    save 'vocabList.m' vocabList;
endfunction