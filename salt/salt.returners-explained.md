# returners explained

## Question
Hey, I've set the necessary options in my master config to email results.

    smtp.from: salt
    smtp.to: some@email.address
    smtp.host: localhost
    smtp.subject: result for minion {{ grains['host'] }}

if I now set `event_return: smtp` in that same master config then it works as expected. I get emails. Sadly in a json format but that's for another question...

Now, if I remove that `event_return: smtp` line and just add --return=smtp on the commandlijne then i would expect the same to happen but sadly it doesn't. No email gets sent. I've run the debug mode and the smtp module gets loaded but that's it. there's not even an attempt to send it.

What am I doing wrong? I feel like I followed every manual I could find on this and it should just work.. but it doesn't.

## Answer

`--return` gets sent to the minion so that the minion returns through the method selected. there are several types of returners.

* standard returners which is what the --return is for. this causes minions to return their data directly.

* event returners. these are just the event_bus passed to the even_return function of a returner. and are handled on the master.

* master job cache. these are returner that store and retrieve job information for the master. smtp does not work for this kind of returner. as there is no way to retrieve from a send only system.

* external job cache, these are returners that the minion connects to the external job system instead of returnering the event to the job. used in conjunction with master job cache it can be a way of leveraging a system to handle the job return data without flooding the maser.

for what you are looking or you might be better off with instead of a returner a reactor. which can detect the job information and format the data into the email that is sent.

[source](https://www.reddit.com/r/saltstack/comments/srlnm8/event_return_in_master_config_works_return_on/hwvzikx/?context=3)