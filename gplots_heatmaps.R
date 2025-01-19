#Script para generar Heatmaps
library(gplots)

#Importar Tablas de conteos y generar una matriz
qmtx <- read.table("edgeR_normcounts.tsv", stringsAsFactors = F, header = T)
rownames(qmtx) <- qmtx$GeneID

# extraer lista de los genes con expresion diferencial 
degAll <- read.csv("listaTodosDeg.csv", header = F, stringsAsFactors = F)

#vector para la funcion heatmap
degmtx <- qmtx[which(qmtx$GeneID %in% degAll$V1),]
degmtx <- degmtx[,2:19]

z.mat <- t(scale(t(degmtx), scale=TRUE, center=TRUE))
heatmap.2(z.mat,
          dendrogram="both", 
          scale="none", 
          trace = "none",
          col = colorRampPalette(c('green2', 'grey21', 'firebrick2'))(1000),
          #col = colorRampPalette(c('green', 'red'))(100),
          #col = greenred(1000),
          key= TRUE,
          symkey = FALSE,
          density.info = "none",
          key.title = NA,
          key.xlab = "Row Z-Score",
          cexCol = 1,
          labRow = NA,
          keysize = 1
          )

