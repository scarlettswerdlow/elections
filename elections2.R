###########################################################################
#                                                                         #
#  2015 Chicago mayoral election analysis II                              #
#  Coded by Scarlett Swerdlow                                             #
#  scarlett.swerdlow@gmail.com                                            #
#  February 26, 2015                                                      #
#                                                                         #
###########################################################################

library( plyr )

##################
#  LOAD IN DATA  #
##################

mayoral_2015 <- read.csv( "~/elections/mayoral_2015.csv", header = TRUE )
mayoral_2011_by_2015 <- read.csv( "~/elections/mayoral_2011_by_2015.csv", header = TRUE )
mayoral <- merge( mayoral_2011_by_2015, mayoral_2015, by.x = "Ward", by.y = "Ward" )

###########################
#  CALCULATE VOTE SHARES  #
###########################

mayoral$Emanuel_2011_s <- mayoral$Emanuel_2011/mayoral$Votes_2011
mayoral$Del.Valle_s <- mayoral$Del.Valle/mayoral$Votes_2011
mayoral$Mosely.Braun_s <- mayoral$Mosely.Braun/mayoral$Votes_2011
mayoral$Chico_s <- mayoral$Chico/mayoral$Votes_2011
mayoral$Watkins_s <- mayoral$Watkins/mayoral$Votes_2011
mayoral$Walls_2011_s <- mayoral$Walls_2011/mayoral$Votes_2011

mayoral$Emanuel_2015_s <- mayoral$Emanuel_2015/mayoral$Votes_2015
mayoral$Wilson_s <- mayoral$Wilson/mayoral$Votes_2015
mayoral$Fioretti_s <- mayoral$Fioretti/mayoral$Votes_2015
mayoral$Garcia_s <- mayoral$Garcia/mayoral$Votes_2015
mayoral$Walls_2015_s <- mayoral$Walls_2015/mayoral$Votes_2015

mayoral$Emanuel_diff_pp <- (mayoral$Emanuel_2015_s - mayoral$Emanuel_2011_s)*100

#########################################
#  IDENTIFY WARDS WITH BIGGEST CHANGES  #
#########################################

inc <- mayoral$Ward[ mayoral$Emanuel_diff_pp > 0 ]
dec <- mayoral$Ward[ mayoral$Emanuel_diff_pp < 0 ]
best <- mayoral[ mayoral$Emanuel_diff_pp >= quantile( mayoral$Emanuel_diff_pp, .9 ), ]
worst <- mayoral[ mayoral$Emanuel_diff_pp <= quantile( mayoral$Emanuel_diff_pp, .1 ), ]

###############################
#  WRITE DATA TO CSV FOR MAP  #
###############################

write.csv( mayoral, "~/elections/2011_2015_data.csv" )
