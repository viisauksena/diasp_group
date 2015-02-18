SELECT DISTINCT posts.id,
                posts.author_id,
                posts.diaspora_handle,
                posts.text
FROM   `posts`
       INNER JOIN `share_visibilities`
               ON `share_visibilities`.`shareable_id` = `posts`.`id`
                  AND `share_visibilities`.`shareable_type` = 'Post'
       INNER JOIN `contacts`
               ON `contacts`.`id` = `share_visibilities`.`contact_id`
       INNER JOIN `aspect_memberships`
               ON `aspect_memberships`.`contact_id` = `contacts`.`id`
       INNER JOIN `aspects`
               ON aspects.id = `aspect_memberships`.`aspect_id`
WHERE  `posts`.`pending` = 0
       AND `share_visibilities`.`hidden` = 0
       AND `contacts`.`user_id` = 
10
       AND `contacts`.`receiving` = 1
       AND `posts`.`type` IN ( 'StatusMessage', 'Reshare' )
ORDER  BY posts.id DESC 

