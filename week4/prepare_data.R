# Download data files and store them in data folder

library(tools)

dir.create("data")

datafiles <- c(
  "https://www.who.int/childgrowth/standards/wfa_girls_z_exp.txt",
  "https://www.who.int/childgrowth/standards/wfa_boys_z_exp.txt",
  "https://www.who.int/childgrowth/standards/wfa_girls_p_exp.txt",
  "https://www.who.int/childgrowth/standards/wfa_boys_p_exp.txt"
) 
  
for (file in datafiles) {
  filename <- paste(getwd(), "/data/", basename(file), sep = "")
  download.file(file, filename, sep="")
}
