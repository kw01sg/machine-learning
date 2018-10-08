function preProcess()
    rawEmails = [];
    labels = [];
    spamDir = 'spam';
    hamDir = 'ham';

    spamList = readdir(spamDir);
    hamList = readdir(hamDir);

    % process spam files
    disp('Processing Spam Files...');
    for i = 1:numel(spamList)
        disp(['Processing Spam Files #' num2str(i) '...']);
        ## skip special files . and ..
        if (regexp (spamList{i}, "^\\.\\.?$"))
            continue;
        endif

        filePath = [spamDir '\' spamList{i}];

        fileContent = readFile(filePath);
        tokenizedEmail = processEmail(fileContent);
        rawEmails = [rawEmails, {tokenizedEmail}];
        labels = [labels; 1];
    endfor

    % process ham files
    disp('Processing Ham Files...');
    for i = 1:numel(hamList)
        disp(['Processing Ham Files #' num2str(i) '...']);
        ## skip special files . and ..
        if (regexp (hamList{i}, "^\\.\\.?$"))
            continue;
        endif

        filePath = [hamDir '\' hamList{i}];

        fileContent = readFile(filePath);
        tokenizedEmail = processEmail(fileContent);
        rawEmails = [rawEmails, {tokenizedEmail}];
        labels = [labels; 0];
    endfor

    disp('Saving raw emails and labels ...');
    save 'rawEmails.m' rawEmails;
    save 'labels.m' labels;    
    
    saveVocabList();
endfunction