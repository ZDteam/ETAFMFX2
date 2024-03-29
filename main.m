qfunction main(song_name)

close all;
warning off

clear all;

%% global setting
global ETAF_DEBUG;
ETAF_DEBUG = false;

global ETAF_RMZERO;
ETAF_RMZERO = false;
global ETAF_FS;
ETAF_FS = 16000;
global  ETAF_MULTIPLE_THREAD;
ETAF_MULTIPLE_THREAD = false;

%% args process
if nargin == 1
    song_name_list = {song_name};
else
    song_name_list = {...
        'ʮ��',...
        };
end

%% 
if( ETAF_MULTIPLE_THREAD)
    open_multiple_thread();
end
for i=1:length(song_name_list)
    
    if ( song_dir_validate(song_name_list{i}) == false )
        continue;
    end
    
    feature_mat = train(train_dir);

    test(test_dir,feature_mat,song_name);
    
end


end

