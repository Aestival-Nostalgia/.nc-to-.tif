library(raster)
library(ncdf4)
library(lattice) 
library(sp) 

#总而言之咱就是说不要用ArcMap去处理.nc文件了
#使用ArcMap去处理.nc文件极易出现各种各样的脑残问题，不要使用ArcMap去拆解.nc文件了
#源代码来自：https://www.bilibili.com/read/cv15816238

ncfile<-nc_open("G:/Geo_Data/SOM.nc") 

names(ncfile$var)

input_nc = 'G:/Geo_Data/SOM.nc'

varname = 'SOM'
#选择维度

raster1 = stack(input_nc, varname = varname)
print(raster1)
#查看栅格堆栈的基本信息

#设置输出路径名
outpath<-"G:/out"

#为文件名设置做准备
x1<-c(1:8)
x2<-paste("Depth_",x1,sep = "")
out_filename<-sapply(x2, function(x)paste(x,".tif",sep = ""))  #输出tif格式
out_path<-sapply(out_filename, function(x){paste(outpath,x,sep = "/")}) #输出路径名

#批量输出
for(i in 1:8){
             writeRaster(raster1[[i]],out_path[i], format = 'GTiff', overwrite = T)
             } 
