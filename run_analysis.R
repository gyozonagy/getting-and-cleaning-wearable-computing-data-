
setwd("C:/courseproject")
test_subj  <- read.table("test/subject_test.txt")
#test_X <- read.table("test/X_test.txt")
test_y <- read.table("test/y_test.txt") 
train_subj <- read.table("train/subject_train.txt")
#train_X <- read.table("train/X_train.txt")
train_y <- read.table("train/y_train.txt") 
acti_labels <- read.table("activity_labels.txt")
colnames(acti_labels) <- c("activity","act_names")
df_subj <- rbind(test_subj,train_subj)
df_acti <- rbind(test_y,train_y)
colnames(df_acti) <- c("activity")
df_acti <- merge(df_acti,acti_labels)

test1 <- read.table("test/Inertial Signals/body_acc_x_test.txt") 
train1 <- read.table("train/Inertial Signals/body_acc_x_train.txt") 
df1 <- rbind(test1,train1)

test2 <- read.table("test/Inertial Signals/body_acc_y_test.txt") 
train2 <- read.table("train/Inertial Signals/body_acc_y_train.txt")
df2 <- rbind(test2,train2) 

test3 <- read.table("test/Inertial Signals/body_acc_z_test.txt")
train3 <- read.table("train/Inertial Signals/body_acc_z_train.txt")
df3 <- rbind(test3,train3) 

test4 <- read.table("test/Inertial Signals/body_gyro_x_test.txt")
train4 <- read.table("train/Inertial Signals/body_gyro_x_train.txt")
df4 <- rbind(test4,train4) 

test5 <- read.table("test/Inertial Signals/body_gyro_y_test.txt") 
train5 <- read.table("train/Inertial Signals/body_gyro_y_train.txt") 
df5 <- rbind(test5,train5) 

test6 <- read.table("test/Inertial Signals/body_gyro_z_test.txt") 
train6 <- read.table("train/Inertial Signals/body_gyro_z_train.txt") 
df6 <- rbind(test6,train6) 

test7 <- read.table("test/Inertial Signals/total_acc_x_test.txt") 
train7 <- read.table("train/Inertial Signals/total_acc_x_train.txt") 
df7 <- rbind(test7,train7) 

test8 <- read.table("test/Inertial Signals/total_acc_y_test.txt") 
train8 <- read.table("train/Inertial Signals/total_acc_y_train.txt") 
df8 <- rbind(test8,train8)
 
test9 <- read.table("test/Inertial Signals/total_acc_z_test.txt")
train9 <- read.table("train/Inertial Signals/total_acc_z_train.txt")
df9 <- rbind(test9,train9) 

m1 <- rowMeans(df1)
m2 <- rowMeans(df2)
m3 <- rowMeans(df3)
m4 <- rowMeans(df4)
m5 <- rowMeans(df5)
m6 <- rowMeans(df6)
m7 <- rowMeans(df7)
m8 <- rowMeans(df8)
m9 <- rowMeans(df9)
sd1 <- apply(df1,1,sd)
sd2 <- apply(df2,1,sd)
sd3 <- apply(df3,1,sd)
sd4 <- apply(df4,1,sd)
sd5 <- apply(df5,1,sd)
sd6 <- apply(df6,1,sd)
sd7 <- apply(df7,1,sd)
sd8 <- apply(df8,1,sd)
sd9 <- apply(df9,1,sd)


df <- data.frame(df_subj,df_acti,m1,sd1,m2,sd2,m3,sd3,m4,sd4,m5,sd5,m6,sd6,m7,sd7,m8,sd8,m9,sd9)
colnames(df) <- c("subject","activity","act_names","mean_body_acc_x","stdev_body_acc_x","mean_body_acc_y","stdev_body_acc_y","mean_body_acc_z","stdev_body_acc_z","mean_body_gyro_x","stdev_body_gyro_x","mean_body_gyro_y","stdev_body_gyro_y","mean_body_gyro_z","stdev_body_gyro_z","mean_tot_acc_x","stdev_tot_acc_x","mean_tot_acc_y","stdev_tot_acc_y","mean_tot_acc_z","stdev_tot_acc_z")

#ordf <- df[order(df$subject, df$activity),]
df$act_names <- NULL

outdf <- data.frame(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
colnames(outdf) <- c("subject","activity","mean_body_acc_x","stdev_body_acc_x","mean_body_acc_y","stdev_body_acc_y","mean_body_acc_z","stdev_body_acc_z","mean_body_gyro_x","stdev_body_gyro_x","mean_body_gyro_y","stdev_body_gyro_y","mean_body_gyro_z","stdev_body_gyro_z","mean_tot_acc_x","stdev_tot_acc_x","mean_tot_acc_y","stdev_tot_acc_y","mean_tot_acc_z","stdev_tot_acc_z")

for (sub in 1:30) {
for (act in 1:6)  {
    sel_act_sub <- df[df$subject == sub & df$activity == act,]
    mean_act_sub <- colMeans(sel_act_sub)
    if (!is.na(mean_act_sub[1])) {
        outdf <- rbind(outdf,mean_act_sub)
    }
}}
outdf = outdf[-1,]  
outdf <- merge(outdf,acti_labels)

write.table(outdf, file = "outfile.txt",row.name=FALSE)
df <- merge(df,acti_labels)

