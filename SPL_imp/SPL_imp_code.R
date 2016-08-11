# path where file is saved
setwd("C:/Users/USER/Desktop/R/16.6")

# shows path which was set
getwd()

# name of file
data_file = "rdata_Pay_What_You_Want_Preismodell_2016-06-16_11-29.csv"

# loading data set without specification of columns
data = read.table(file = data_file, header = FALSE, sep = "\t", quote = "\"", 
                  dec = ".", row.names = "CASE", 
                  col.names = c("CASE", "NULL", "NULL", "NULL", "NULL", "NULL",
                                "E001", "E002", "E003_01", "E004", "E004_02", 
                                "E004_03", "E004_04", "E004_05", "E004_16", 
                                "E004_06", "E004_07", "E004_08", "E004_09", 
                                "E004_10", "E004_12", "E004_13", "E004_14", 
                                "E004_15", "E004_15a", "E005", "E006", 
                                "J001_01", "J001_02", "J003", "J004", "J005",
                                "J006", "J007", "J008", "P001_01", "P002",
                                "P005", "P003", "P004_01", "P004_02", "PP01",
                                "PP02_01", "PP02_02", "ZG01_CP", "ZG01", 
                                "P101_01", "P101_02", "P102", "P103_01", "P104",
                                "P105_01", "P106_01", "P106_02", "P106_03",
                                "P106_04", "SD01", "SD02", "SD04", "SD04_01", 
                                "SD04_02", "SD04_03", "SD04_04", "SD04_05",
                                "SD04_06", "SD04_07", "SD04_08", "SD04_09", 
                                "SD04_10", "SD04_11", "SD04_11a", "SD06", 
                                "SD07", "SD08", "NULL", "NULL", "NULL", "NULL",
                                "NULL", "NULL", "NULL", "NULL", "NULL"), 
                  stringsAsFactors = FALSE, na.strings = "NA", 
                  skip = 1, check.names = TRUE, fill = TRUE, comment.char = "")

# some data types have to be changed
data$E004 = as.numeric(data$E004)
data$ZG01 = as.numeric(data$ZG01)
data$SD04 = as.numeric(data$SD04)

# reload of dataset where can use the changed data types of variables
# above reads file in table format and creates data frame from it, 
# with cases corresponding to lines and variables to fields in file
# (source:
# https://stat.ethz.ch/R-manual/R-devel/library/utils/html/read.table.html)

data = read.table(file = data_file, header = FALSE, sep = "\t", quote = "\"",
                  dec = ".", row.names = "CASE", 
                  col.names = c("CASE", "NULL", "NULL", "NULL", "NULL", 
                                "NULL", "E001", "E002", "E003_01", "E004", 
                                "E004_02", "E004_03", "E004_04", "E004_05",
                                "E004_16", "E004_06", "E004_07", "E004_08",
                                "E004_09", "E004_10", "E004_12", "E004_13", 
                                "E004_14", "E004_15", "E004_15a", "E005", 
                                "E006", "J001_01", "J001_02", "J003", 
                                "J004", "J005", "J006", "J007", "J008", 
                                "P001_01", "P002", "P005", "P003", "P004_01",
                                "P004_02", "PP01", "PP02_01", "PP02_02", 
                                "ZG01_CP", "ZG01", "P101_01", "P101_02", "P102",
                                "P103_01", "P104", "P105_01", "P106_01",
                                "P106_02", "P106_03", "P106_04", "SD01", "SD02",
                                "SD04", "SD04_01", "SD04_02", "SD04_03", 
                                "SD04_04", "SD04_05", "SD04_06", "SD04_07",
                                "SD04_08", "SD04_09", "SD04_10", "SD04_11", 
                                "SD04_11a", "SD06", "SD07", "SD08", "NULL", 
                                "NULL", "NULL", "NULL","NULL", "NULL", "NULL",
                                "NULL", "NULL"), 
                  colClasses = c("integer", "NULL", "NULL", "NULL", "NULL", 
                                 "NULL", "factor", "factor", "character", 
                                 "numeric", "logical", "logical", "logical",
                                 "logical", "logical", "logical", "logical", 
                                 "logical", "logical", "logical", "logical", 
                                 "logical", "logical", "logical", "character",
                                 "factor", "factor", "integer", "integer", 
                                 "factor", "factor", "factor", "factor", 
                                 "factor", "factor", "numeric", "factor", 
                                 "factor", "factor", "numeric", "numeric", 
                                 "factor", "character", "character", "integer",
                                 "numeric", "integer", "integer", "factor", 
                                 "character", "factor", "character", "integer",
                                 "integer", "integer", "integer", "factor", 
                                 "factor", "numeric", "logical", "logical", 
                                 "logical", "logical", "logical", "logical", 
                                 "logical", "logical", "logical", "logical", 
                                 "logical", "character", "factor", "factor", 
                                 "factor", "NULL", "NULL", "NULL", "NULL", 
                                 "NULL", "NULL", "NULL", "NULL", "NULL"), 
                  na.strings = "NA", skip = 1, check.names = TRUE, fill = TRUE,
                  comment.char = "")
data


# verbal expression of values of variables

data$E001    = factor(data$E001, levels = c("1", "2", "X-9"),
                      labels = c("Ja", "Nein", "nicht beantwortet"), 
                      ordered  = FALSE)
data$E002    = factor(data$E002, levels = c("1", "2", "X-9"),
                      labels = c("Ja", "Nein", "nicht beantwortet"), 
                      ordered  = FALSE)
data$E005    = factor(data$E005, levels = c("1", "2", "3", "4", "5", "X-9"),
                      labels = c("taeglich", "mehrmals in der Woche", 
                                 "einmal in der Woche", "alle zwei Wochen",
                                 "seltener", "nicht beantwortet"),
                      ordered = FALSE)
data$E006    = factor(data$E006, levels = c("1", "2", "3", "X-9"), 
                      labels = c("Smartphone/ Tablet", "lokaler PC", 
                                 "beides", "nicht beantwortet"), 
                      ordered = FALSE)
data$J001_01 = factor(data$J001_01, levels = c("1", "2", "3", "4", "5", "X-9"),
                      labels = c("stimme gar nicht zu", 
                                 "stimme eher nicht zu", "teils teils", 
                                 "stimme eher zu", "stimme voll zu", 
                                 "keine Angabe"), 
                      ordered = TRUE)
data$J001_02 = factor(data$J001_02, levels = c("1", "2", "3", "4", "5", "X-9"),
                      labels = c("stimme gar nicht zu", 
                                 "stimme eher nicht zu", "teils teils", 
                                 "stimme eher zu", "stimme voll zu", 
                                 "keine Angabe"), 
                      ordered = TRUE)
data$J003    = factor(data$J003, levels = c("1", "2", "X-9"),
                      labels = c("Ja", "Nein", "nicht beantwortet"), 
                      ordered = FALSE)
data$J004    = factor(data$J004, levels = c("1", "2", "X-9"),
                      labels = c("regelmaessig (Abo)", "einmalig 
                                 (zum Beispiel fuer einen bestimmten Artikel)", 
                                 "nicht beantwortet"), 
                      ordered = FALSE)
data$J005    = factor(data$J005, levels = c("1", "2", "3", "4", "5", "X-9"),
                      labels = c("Nur so kann ich das gesamte Angebot nutzen.", 
                                 "Ich kann es mir leisten.", 
                                 "Ich moechte, dass die Zeitung weiter erhalten 
                                 bleibt.", 
                                 "Die meisten Leute in meinem Umfeld zahlen.", 
                                 "Sonstiges", "nicht beantwortet"), 
                      ordered = FALSE)
data$J006    = factor(data$J006, levels = c("1", "2", "3", "4", "5", "X-9"),
                      labels = c("Die Zeitungsanbieter verdienen schon ueber 
                                 Werbeanzeigen genug.", 
                                 "Ich kann es mir nicht leisten.", 
                                 "Ich habe schon immer alles kostenlos im 
                                 Internet lesen koennen.", 
                                 "Die meisten Leute in meinem Umfeld zahlen
                                 nichts.", 
                                 "Sonstiges", "nicht beantwortet"), 
                      ordered = FALSE)
data$J007    = factor(data$J007, levels = c("1", "2", "X-9"), 
                      labels = c("Ja", "Nein", "nicht beantwortet"), 
                      ordered  = FALSE)
data$J008    = factor(data$J008, levels = c("1", "2", "X-9"), 
                      labels = c("regelmaessig (Abo)", "einmalig 
                                 (zum Beispiel fuer einen bestimmten Artikel)", 
                                 "nicht beantwortet"), 
                      ordered = FALSE)
data$P002    = factor(data$P002, levels = c("1", "2", "3", "X-9"),
                      labels = c("einmalig", "monatlich", "jaehrlich", 
                                 "nicht beantwortet"), 
                      ordered = FALSE)
data$P005    = factor(data$P005, levels = c("1", "2", "X-9"), 
                      labels = c("Ja", "Nein", "nicht beantwortet"), 
                      ordered  = FALSE)
data$P003    = factor(data$P003, levels = c("1", "2", "3", "4", "X-9"),
                      labels = c("Ja", "Erhoehung des Beitrags auf 
                                 %P004_01% Euro", 
                                 "Reduzierung des Beitrags auf %P004_02% Euro",
                                 "Nein", "nicht beantwortet"), 
                      ordered = FALSE)
data$PP01    = factor(data$PP01, levels = c("1", "2", "3", "4", "X-9"),
                      labels = c("Ja", "Erhoehung des Beitrags auf 
                                 %PP02_01% Euro", 
                                 "Reduzierung des Beitrags auf %PP02_02% Euro",
                                 "Nein", "nicht beantwortet"), 
                      ordered = FALSE)
data$ZG01    = factor(data$ZG01, levels = c("1", "2"), 
                      labels = c("0,42 Euro", "10,00 Euro"), 
                      ordered = TRUE)
data$P101_01 = factor(data$P101_01, levels = c("1", "2", "3", "4", "5", "X-9"),
                      labels = c("stimme gar nicht zu", "stimme eher nicht zu",
                                 "teils teils", "stimme eher zu", 
                                 "stimme voll zu", "nicht beantwortet"), 
                      ordered = TRUE)
data$P101_02 = factor(data$P101_02, levels = c("1", "2", "3", "4", "5", "X-9"),
                      labels = c("stimme gar nicht zu", "stimme eher nicht zu",
                                 "teils teils", "stimme eher zu", 
                                 "stimme voll zu", "nicht beantwortet"), 
                      ordered = TRUE)
data$P102    = factor(data$P102, levels = c("1", "2", "3", "4", "X-9"), 
                      labels = c("Ja", "Erhoehung des Beitrags auf 
                                 %P103_01% Euro", 
                                 "Reduzierung des Beitrags auf %P103_02% Euro",
                                 "Nein", "nicht beantwortet"), 
                      ordered = FALSE)
data$P104    = factor(data$P104, levels = c("1", "2", "3", "4", "X-9"), 
                      labels = c("Ja", "Erhoehung des Beitrags auf 
                                 %P105_01% Euro", 
                                 "Reduzierung des Beitrags auf %P105_02% Euro",
                                 "Nein", "nicht beantwortet"), 
                      ordered = FALSE)
data$P106_01 = factor(data$P106_01, levels = c("1", "2", "3", "4", "5", "X-9"),
                      labels = c("stimme gar nicht zu", "stimme eher nicht zu",
                                 "teils teils", "stimme eher zu", 
                                 "stimme voll zu", "nicht beantwortet"), 
                      ordered = TRUE)
data$P106_02 = factor(data$P106_02, levels = c("1", "2", "3", "4", "5", "X-9"),
                      labels = c("stimme gar nicht zu", "stimme eher nicht zu",
                                 "teils teils", "stimme eher zu",
                                 "stimme voll zu", "nicht beantwortet"), 
                      ordered = TRUE)
data$P106_03 = factor(data$P106_03, levels = c("1", "2", "3", "4", "5", "X-9"),
                      labels = c("stimme gar nicht zu", "stimme eher nicht zu",
                                 "teils teils", "stimme eher zu",
                                 "stimme voll zu", "nicht beantwortet"), 
                      ordered = TRUE)
data$P106_04 = factor(data$P106_04, levels = c("1", "2", "3", "4", "5", "X-9"),
                      labels = c("stimme gar nicht zu", "stimme eher nicht zu",
                                 "teils teils", "stimme eher zu",
                                 "stimme voll zu", "nicht beantwortet"), 
                      ordered = TRUE)
data$SD01    = factor(data$SD01, levels = c("1", "2"), 
                      labels = c("weiblich", "maennlich"),
                      ordered = FALSE)
data$SD02    = factor(data$SD02, 
                      levels = c("1", "2", "3", "4", "5", "6", "7", "X-1",
                                 "X-9"), 
                      labels = c("Schueler/-in, besuche eine allgemeinbildende
                                 Vollzeitschule", 
                                 "Von der Schule abgegangen ohne
                                 Hauptschulabschluss", "Hauptschulabschluss 
                                 (Volksschulabschluss)", 
                                 "Realschulabschluss (Mittlere Reife)", 
                                 "Fachhochschulreife, Abschluss einer 
                                 Fachoberschule", 
                                 "Allgemeine oder fachgebundene 
                                 Hochschulreife/Abitur", 
                                 "Abitur ueber den zweiten Bildungsweg
                                 nachgeholt", 
                                 "Einen anderen Schulabschluss", "nicht 
                                 beantwortet"), 
                      ordered = FALSE)
data$SD06    = factor(data$SD06, 
                      levels = c("1", "2", "3", "4", "5", "6", "7", "8", "9", 
                                 "10", "X-9"), 
                      labels = c("Vollzeiterwerbstaetig", 
                                 "Teilzeiterwerbstaetig",
                                 "Altersteilzeit (unabhaengig davon, ob in der
                                 Arbeits- oder Freistellungsphase befindlich)", 
                                 "Geringfuegig erwerbstaetig, 450-Euro-Job, 
                                 Minijob", "Ein-Euro-Job (bei Bezug 
                                 von Arbeitslosengeld II)", 
                                 "Gelegentlich oder unregelmaessig 
                                 beschaeftigt",
                                 "In einer beruflichen Ausbildung/Lehre", 
                                 "Freiwilliges Soziales/ oekologisches Jahr", 
                                 "Mutterschafts-, Erziehungsurlaub, Elternzeit 
                                 oder sonstige Beurlaubung (Altersteilzeit unter
                                 C angeben)", 
                                 "Nicht erwerbstaetig (einschliesslich: 
                                 Schueler(n)/-innen oder Studierende, die nicht 
                                 gegen Geld arbeiten, Arbeitslosen, 
                                 Vorruhestaendler(n)/-innen, 
                                 Rentner(n)/-innen ohne Nebenverdienst)", 
                                 "nicht beantwortet"), 
                      ordered = FALSE)
data$SD07   = factor(data$SD07, levels = c("1", "2", "3", "4", "5", "6", "7", 
                                           "X-9"), 
                     labels = c("Schueler/-in an einer allgemeinbildenden 
                                Schule", "Student/-in", "Rentner/-in,
                                Pensionaer/-in, im Vorruhestand", "Arbeitslose",
                                "Dauerhaft Erwerbsunfaehige", 
                                "Hausfrauen/Hausmaenner", "Sonstiges", 
                                "nicht beantwortet"), 
                     ordered = FALSE)
data$SD08   = factor(data$SD08, levels = c("1", "2", "3", "4", "5", "6",
                                           "X-9"), 
                     labels = c("0 Euro - 500 Euro", "501 Euro - 1000 Euro", 
                                "1001 Euro - 2000 Euro", 
                                "2001 Euro - 3000 Euro", 
                                "ueber 3000 Euro", "Ich moechte dazu keine 
                                Angabe machen.", "nicht beantwortet"),
                     ordered = FALSE)
data
