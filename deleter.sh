#!/bin/sh
#
# Script to delete not longer existant posts in Diaspora* for a fake user
# (where the fakeuser makes his own post to the group/aspects)
#
# 

# TODO get the list of all actual posts which i can see from others
# we do this actually regulary to find new posts so we dont have to do it twice
# only thing needed, save the id portion one post per line seperatly

# TODO get the list of all posts i repost (combine posting with something like echo "nr" >> liste)

# combine these ... sort these and than go through
# bsp. check if nextline = thisline

# take all these numbers and check for http:response 
# like curl -s -o /dev/null -I -w "%{http_code}" https://pod.rauberhaus.de/posts/9417 --insecure

# mysql query my own posts for this post - get this number
# search for this specific blabla wrote string 

# delete this number


######
# second approach 
# misuse the reshare function - normal post dont have a root_guid
# so after making the post we imideatly check for our last post und write there the at this moment still known
# origin-post_id
# therefore on line +-50 https://github.com/diaspora/diaspora/blob/f532efeac5731d47f8b8f7b966af59da5796c47f/app/controllers/status_messages_controller.rb it would be awesome to have the possibility to write root_guid
# or just crawl the textfield - because we wrote it there

#
# than later mysql check, all posts i can see ohne die die gleiche status_message mit root_guid von meinen posts haben
# die dabei rausploppen 1. löschen (wenn nur noch bei mir)
# oder 2. post nachholen (wenn irgendwie verpasst , mit check älter als 15 min.)
