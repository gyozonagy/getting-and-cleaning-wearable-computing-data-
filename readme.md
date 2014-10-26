## run_analisys.R  - explanation

===================

The input text files should be in c:/courseproject dictionary, so we change the working directory to this folder.<br><br>
###reading texts from test & train subdirectories
files we read: subject, activity, acivity_labels, and the 9 sensory datafiles from "test" and "train" files into dataframes
### rbinding test and train dataframes
we produce:<br>
df_acti -- for activities, merged with activity labels<br>
df_subj -- for measured subjects
df1 --  test1 + train1 -- /body_acc_x measurement data/<br>
df2 --  test2 + train2 -- /body_acc_y measurement data/<br>
df3 --  test3 + train3 -- /body_acc_z measurement data/<br><br>
df4 --  test4 & train4 -- /body_gyro_x measurement data<br>
df5 --  test5 & train5 -- /body_gyro_y measurement data<br>
df6 --  test6 & train6 -- /body_gyro_z measurement data<br><br>
df7 --  test7 & train7 -- /total_acc_x measurement data/<br>
df8 --  test8 & train8 -- /total_acc_y measurement data/<br>
df9 --  test9 & train9 -- /total_acc_z measurement data/<br>
### calculating means on measurements
m1,..m9  <- contains the means of 128 packed measurements in df1..df9

### calculating standard deviation on measurements
sd1,..sd9  <- contains the standard deviations of 128 packed measurements in df1..df9
### packing the final dataframe columns up
ads also column names, which makes datframe df more redable.<br>
here we accomplished task 4
### generating averages for each subject/activity
In nested loop we take possible subjects from 1 to 30, and<br>
possible activities (1-6) for each subject. <br>
select part of (main) dataframe df belonging to the given sub/act pair. <br>
average the colums into the row of "outdf"<br>
rbind  the new row into outdf, if sub/act pair exists.<br>
### writing outfile.txt
merging act_name back to df and outdf which has to getting rid before average calculation, for technical reasosns 



 

