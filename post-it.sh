#!/bin/sh
#
# Skript to Post a Comment as a fake User to simulate 
# group functionality.
# there have to be a user on any pod (where you can query
# the diaspora* pod database)
#
# TODO - get _session_cookie
#
# TODO - get CSRF Token
#
# TODO - at least learn how long you can use a session which is never closed
# TODO - make my own small database
# TODO - check all POSTS for existance - otherwise mark numbers for deleting (make some extracheck in case its just a networkerror)


#
# original still works but my special more down actually not
# so well ... see comments there.
#
# curl --data "status_message[text]=happyhippo&aspect_ids[]=all_aspects&commit=submit&authenticity_token=qid3LoDHTaDsinMgHtQD/h2WoGupGmq0pdoGJGVTTqw=" https://pod.rauberhaus.de/status_messages --insecure -b _diaspora_session=qDEzMWUyOVhxelJiadaddcmkdaDADCAACAXADCDCAaadcdf32242423211zNGWlE0aW5iLzFvNUM5cWQxVXE4aDVlREtjZEViK2RrN0MwRS9JcUkzMkYvdjJ3YnNtbGR5TXVWNjJtNG9VQll6b2ExL25VcllrazBhUHpUQlVhVjhIM1BQRzhxTlZnbkZHKzlmdW0yR3N5bm9TeWYzMmg2WWRVaDRQbnBDWjhjRldXTUdoQUcwN2ZoYVhEb0dFNlowYVVBdGd4NFBuMUhWNENSVXAzSzVIczkwemhVcGVsT01aVE9iS3BtaVVGdlJLKzBlZHV6R323qqQaxyqwq11qy2d421s1a11xc44SWSWwb1ZUREhyYXZPYURDSTJRN3IwK2xzVzY5bGIwMHlXaVlZU2xwRXNUMU1OaEJ4eWNtMDZ4Vzd1bHl1YS9mdU9RRjVCU3pMcGR4TG1YZ3ZvRW5kRTFMbWd4aG5MUTB2NjNJeFkvcjcrcDB0TFNNZjNEdzJVLS1SemcwSXNlQ2NEV1lEEE9OM09acVFBDT0%3D--91a223223225766ecdfae3cb2e33321138377702
# 

# now we learn something about Markdown language
# and here we want to get some info of correct author, in some way a valid link to author ID Page/wherever AND  postnumber
post="[test](/u/test 'test') [schrieb](/posts/9396 '9396')  
hulahupp"
pod=https://pod.rauberhaus.de
# how in hell to parse this right? know its working, just these damn single double whatsoever quotes :-)
auth_token='qid3ADAddldmdmcdkmdcdkkcdddckdcdpdoGJGVTTqw='
sessioncookie=RDEzMWUyOVhxelJtY1BwNGZlRzlXL3asasmxkaskxaskx332323mdk3mdk2dm2m3k1k1mk3k134mk4m2km1km3mdmekcamasxmlsaxMwRS9JcUkzMkYvdjJ3YnNtbGR5TXVWNjJtNG9VQll6b2ExL25VcllrazBhUHpUQlVhVjhIM1BQRzhxTlZnbkZHKzlmdW0yR3N5bm9TeWYzMmg2WWRVaDRQbnBDWjhjRldXTUdoQUcwN2ZoYVhEb0dFNlowYVVBdGd4NFBuMUhWNENSVXAzSzVIczkwemhVcGVsT01aVE9iS3BtaVVGdlJLKzBlZHV6RGtkblQrZWlnRTM3NkVhcFMybzB2R2doQTQwb1ZUREhyYXZPYURDSTJRN3IwK2xzVzY5bGIwMHlXaVlZU2xwRXNUMU1OaEJ4eWNtMDZ4Vzd1bHl1YS9mdU9RRjVCU3pMcGR4TG1YZ3ZvRW5kRTFMbWd4aG5MUTB2NjNJeFkvcjcrcDB0TFNNZjNEdzJVLS1SemcwSXNlQ2NEVxdxdwwe3322222222233d3dd1a511470075766ecdfqwqddffadc59b38377702

# 
# and ready steady go ... 
curl --data "status_message[text]=$post&aspect_ids[]=all_aspects&commit=submit&authenticity_token=$auth_token" $pod/status_messages --insecure -b _diaspora_session=$sessioncookie

# and we need to know our last own post or last date or whatever and set it here,
# we need this when checking for new posts .. because we dont want to crosscheck the whole history
# possibly we have a list of post ID numbers on our pod to check against, and that would open a 
# possibility to make our fake reposts deleteable (when originpost doesnt exist anymore)
 
