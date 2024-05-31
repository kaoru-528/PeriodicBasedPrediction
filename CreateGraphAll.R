library(ggplot2)
WSEPath = paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/src/WaveletShrinkageEstimation.R")
source(WSEPath)
Data = LoadData(DataPath = "/DS/DS2.txt")

name = "DS2_A1"
DataTransform = "A1"
ThresholdName = "ut"
ThresholdMode = "h"
for(i in seq(1, 8, by = 1)){
data = Wse(Data=Data, DataTransform=DataTransform, ThresholdName=ThresholdName, ThresholdMode=ThresholdMode, Index=Index, Var = 1)
Cs = data$Cs
Ds = data$Ds
dDs = data$Denoise_Ds

coeLength = length(Cs)

tmp_Cs_4_1 = list()

tmp_Ds_2_1 = list()
tmp_Ds_2_2 = list()
tmp_Ds_2_3 = list()
tmp_Ds_2_4 = list()
tmp_Ds_3_1 = list()
tmp_Ds_3_2 = list()
tmp_Ds_4_1 = list()

tmp_dDs_2_1 = list()
tmp_dDs_2_2 = list()
tmp_dDs_2_3 = list()
tmp_dDs_2_4 = list()
tmp_dDs_3_1 = list()
tmp_dDs_3_2 = list()
tmp_dDs_4_1 = list()

coe = list()
# coe_name_list
coe_name = list("C[4][1]","D[1][1]","D[1][2]","D[1][3]","D[1][4]","D[2][1]","D[2][2]","D[3][1]","Donise_D[1][1]","Donise_D[1][2]","Donise_D[1][3]","Donise_D[1][4]","Donise_D[2][1]","Donise_D[2][2]","Donise_D[3][1]")


for(j in seq(1, length(Ds), by=1)){
tmp_Cs_4_1 = c(tmp_Cs_4_1,Cs[[j]][[4]][1])

tmp_Ds_2_1 = c(tmp_Ds_2_1,Ds[[j]][[2]][1])
tmp_Ds_2_2 = c(tmp_Ds_2_2,Ds[[j]][[2]][2])
tmp_Ds_2_3 = c(tmp_Ds_2_3,Ds[[j]][[2]][3])
tmp_Ds_2_4 = c(tmp_Ds_2_4,Ds[[j]][[2]][4])
tmp_Ds_3_1 = c(tmp_Ds_3_1,Ds[[j]][[3]][1])
tmp_Ds_3_2 = c(tmp_Ds_3_2,Ds[[j]][[3]][2])
tmp_Ds_4_1 = c(tmp_Ds_4_1,Ds[[j]][[4]][1])

tmp_dDs_2_1 = c(tmp_dDs_2_1,dDs[[j]][[2]][1])
tmp_dDs_2_2 = c(tmp_dDs_2_2,dDs[[j]][[2]][2])
tmp_dDs_2_3 = c(tmp_dDs_2_3,dDs[[j]][[2]][3])
tmp_dDs_2_4 = c(tmp_dDs_2_4,dDs[[j]][[2]][4])
tmp_dDs_3_1 = c(tmp_dDs_3_1,dDs[[j]][[3]][1])
tmp_dDs_3_2 = c(tmp_dDs_3_2,dDs[[j]][[3]][2])
tmp_dDs_4_1 = c(tmp_dDs_4_1,dDs[[j]][[4]][1])
}

# coe_list
coe = list(tmp_Cs_4_1,tmp_Ds_2_1,tmp_Ds_2_2,tmp_Ds_2_3,tmp_Ds_2_4,tmp_Ds_3_1,tmp_Ds_3_2,tmp_Ds_4_1,tmp_dDs_2_1,tmp_dDs_2_2,tmp_dDs_2_3,tmp_dDs_2_4,tmp_dDs_3_1,tmp_dDs_3_2,tmp_dDs_4_1)

title = paste0(name,"\n",coe_name[[i]])
filename_graph = paste0("./OUTPUT/",name,"_",coe_name[[i]], ".png")
x = seq(1, length(coe[[i]]), by = 1)
df <- data.frame(x = as.integer(x), y = as.numeric(coe[[i]]))
if(i == 1){
    ggplot(df, aes(x = x, y = y)) +
    geom_point(col = "blue", size = 4) +
    geom_line(col = "blue", size = 1) +
    labs(
        x = "number",
        y = expression(paste("value of coefficient ", {c[0][0]}, sep = ""))
    ) +
    theme(
        panel.background = element_rect(fill = "transparent", colour = "black"),
        panel.grid = element_blank(),
        text = element_text(size = 24))+
    scale_x_continuous(breaks = seq(5,60,5))
    ggsave(filename_graph, width = 13.44, height = 9.14)
}
else if(i == 2){
    ggplot(df, aes(x = x, y = y)) +
    geom_point(col = "blue", size = 4) +
    geom_line(col = "blue", size = 1) +
    labs(
        x = "number",
        y = expression(paste("value of coefficient ", {d[2][0]}, sep = ""))
    ) +
    theme(
        panel.background = element_rect(fill = "transparent", colour = "black"),
        panel.grid = element_blank(),
        text = element_text(size = 24))+
    scale_x_continuous(breaks = seq(5,60,5))
ggsave(filename_graph, width = 13.44, height = 9.14)
}
else if(i == 3){
    ggplot(df, aes(x = x, y = y)) +
    geom_point(col = "blue", size = 4) +
    geom_line(col = "blue", size = 1) +
    labs(
        x = "number",
        y = expression(paste("value of coefficient ", {d[2][1]}, sep = ""))
    ) +
    theme(
        panel.background = element_rect(fill = "transparent", colour = "black"),
        panel.grid = element_blank(),
        text = element_text(size = 24))+
    scale_x_continuous(breaks = seq(5,60,5))
ggsave(filename_graph, width = 13.44, height = 9.14)
}
else if(i == 4){
    ggplot(df, aes(x = x, y = y)) +
    geom_point(col = "blue", size = 4) +
    geom_line(col = "blue", size = 1) +
    labs(
        x = "number",
        y = expression(paste("value of coefficient ", {d[2][1]}, sep = ""))
    ) +
    theme(
        panel.background = element_rect(fill = "transparent", colour = "black"),
        panel.grid = element_blank(),
        text = element_text(size = 24))+
    scale_x_continuous(breaks = seq(5,60,5))
ggsave(filename_graph, width = 13.44, height = 9.14)
}
else if(i == 5){
    ggplot(df, aes(x = x, y = y)) +
    geom_point(col = "blue", size = 4) +
    geom_line(col = "blue", size = 1) +
    labs(
        x = "number",
        y = expression(paste("value of coefficient ", {d[2][3]}, sep = ""))
    ) +
    theme(
        panel.background = element_rect(fill = "transparent", colour = "black"),
        panel.grid = element_blank(),
        text = element_text(size = 24))+
    scale_x_continuous(breaks = seq(5,60,5))
ggsave(filename_graph, width = 13.44, height = 9.14)
}
else if(i == 6){
    ggplot(df, aes(x = x, y = y)) +
    geom_point(col = "blue", size = 4) +
    geom_line(col = "blue", size = 1) +
    labs(
        x = "number",
        y = expression(paste("value of coefficient ", {d[1][0]}, sep = ""))
    ) +
    theme(
        panel.background = element_rect(fill = "transparent", colour = "black"),
        panel.grid = element_blank(),
        text = element_text(size = 24))+
    scale_x_continuous(breaks = seq(5,60,5))
ggsave(filename_graph, width = 13.44, height = 9.14)
}
else if(i == 7){
    ggplot(df, aes(x = x, y = y)) +
    geom_point(col = "blue", size = 4) +
    geom_line(col = "blue", size = 1) +
    labs(
        x = "number",
        y = expression(paste("value of coefficient ", {d[1][1]}, sep = ""))
    ) +
    theme(
        panel.background = element_rect(fill = "transparent", colour = "black"),
        panel.grid = element_blank(),
        text = element_text(size = 24))+
    scale_x_continuous(breaks = seq(5,60,5))
ggsave(filename_graph, width = 13.44, height = 9.14)
}
else{
ggplot(df, aes(x = x, y = y)) +
geom_point(col = "blue", size = 4) +
geom_line(col = "blue", size = 1) +
labs(
    x = "number",
    y = expression(paste("value of coefficient ", {d[0][0]}, sep = ""))
) +
theme(
    panel.background = element_rect(fill = "transparent", colour = "black"),
    panel.grid = element_blank(),
    text = element_text(size = 24))+
    scale_x_continuous(breaks = seq(5,60,5))
ggsave(filename_graph, width = 13.44, height = 9.14)
}
}