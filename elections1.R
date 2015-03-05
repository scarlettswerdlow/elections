###########################################################################
#                                                                         #
#  2015 Chicago mayoral election analysis I                               #
#  Coded by Scarlett Swerdlow                                             #
#  scarlett.swerdlow@gmail.com                                            #
#  February 25, 2015                                                      #
#                                                                         #
###########################################################################

library( plyr )

##################
#  LOAD IN DATA  #
##################

mayoral_2015 <- read.csv( "~/elections/mayoral_2015.csv", header = TRUE )
mayoral_2011 <- read.csv( "~/elections/mayoral_2011.csv", header = TRUE )
wards <- read.csv( "~/elections/wards.csv", header = TRUE )

################################
#  CALCULATE 2015 VOTE SHARES  #
################################

mayoral_2015 <- merge( mayoral_2015, wards, by.x = "Ward", by.y = "WARD"  )

mayoral_2015$Emanuel_2015_s <- mayoral_2015$Emanuel_2015/mayoral_2015$Votes_2015
mayoral_2015$Wilson_s <- mayoral_2015$Wilson/mayoral_2015$Votes_2015
mayoral_2015$Fioretti_s <- mayoral_2015$Fioretti/mayoral_2015$Votes_2015
mayoral_2015$Garcia_s <- mayoral_2015$Garcia/mayoral_2015$Votes_2015
mayoral_2015$Walls_s <- mayoral_2015$Walls/mayoral_2015$Votes_2015

write.csv( mayoral_2015, "~/elections/2015data.csv" )

################################
#  CALCULATE 2011 VOTE SHARES  #
################################

mayoral_2011 <- merge( mayoral_2011, wards, by.x = "Ward", by.y = "WARD"  )

mayoral_2011$Emanuel_2011_s <- mayoral_2011$Emanuel_2011/mayoral_2011$Votes_2011

write.csv( mayoral_2011, "~/elections/2011data.csv" )

###########################
#  COMPARE 2011 AND 2015  #
###########################

length( mayoral_2015$Ward[ mayoral_2015$Emanuel_2015_s > .5 ] )
length( mayoral_2011$Ward[ mayoral_2011$Emanuel_2011_s > .5 ] )