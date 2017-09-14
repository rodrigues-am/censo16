##################################################
### Cria sumário de formação inicial para 2015
### Censo Escolar 2015 - Docente
##################################################

# Carrega bibliotecas
library(tidyverse) # carrega bibliotecas tidyr, dplyr, ggplot, etc

#### Carrega dados dos estados ####

doc.sd <- read.csv("/data/censoescolar/2016/DADOS/DOCENTES_SUDESTE.CSV", sep = "|") %>%
  filter(TP_TIPO_DOCENTE==c(1,5), # professores ativos 
         TP_TIPO_TURMA!=5,TP_TIPO_TURMA!=4, # professores que não estão em AEE
         IN_DISC_FISICA==1) # professores de física

doc.co <- read_delim("/data/censoescolar/2016/DADOS/DOCENTES_CO.CSV", 
                     "|", escape_double = FALSE, trim_ws = TRUE) %>%
  filter(TP_TIPO_DOCENTE %in% c(1,5), # professores ativos 
         TP_TIPO_TURMA!=5,TP_TIPO_TURMA!=4, # professores que não estão em AEE
         IN_DISC_FISICA==1) # professores de física

doc.sul <- read_delim("/data/censoescolar/2016/DADOS/DOCENTES_SUL.CSV", 
                      "|", escape_double = FALSE, trim_ws = TRUE) %>%
  filter(TP_TIPO_DOCENTE %in% c(1,5), # professores ativos 
         TP_TIPO_TURMA!=5,TP_TIPO_TURMA!=4, # professores que não estão em AEE
         IN_DISC_FISICA==1) # professores de física

doc.nt <- read_delim("/data/censoescolar/2016/DADOS/DOCENTES_NORTE.CSV", 
                     "|", escape_double = FALSE, trim_ws = TRUE) %>%
  filter(TP_TIPO_DOCENTE==c(1,5), # professores ativos 
         TP_TIPO_TURMA!=5,TP_TIPO_TURMA!=4, # professores que não estão em AEE
         IN_DISC_FISICA==1) # professores de física

doc.nd <- read_delim("/data/censoescolar/2016/DADOS/DOCENTES_NORDESTE.CSV", 
                     "|", escape_double = FALSE, trim_ws = TRUE) %>%
  filter(TP_TIPO_DOCENTE==c(1,5), # professores ativos 
         TP_TIPO_TURMA!=5,TP_TIPO_TURMA!=4, # professores que não estão em AEE
         IN_DISC_FISICA==1) # professores de física


#### Arranjo final ####

# Agrupa dados docentes nacionais
doc16 <- rbind(doc.co, doc.nd, doc.nt, doc.sd, doc.sul)

# remove variaveis auxiliares
rm(doc.co, doc.nd, doc.nt, doc.sd, doc.sul)