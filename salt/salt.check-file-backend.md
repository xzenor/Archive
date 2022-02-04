# salt Check file-backend

To debug. find out what you re getting on the masters using the fileserver runner.
first checking if the update is working `salt-run fileserver.update backend=git -l trace`

Then checking what envs you are getting. maybe you don't have one that is coming in as base so will need a ref `salt-run fileserver.envs backend=git`

Next check the fileserver to see if the mount point looks right `salt-run fileserver.file\_list backend=git` and look to make sure the top file is shown on the root level.

it is possible you don't have the right envs lined up. don't have the mount point or root setup right. ect.

[source](https://www.reddit.com/r/saltstack/comments/sjkjwn/comment/hvfmj4p/?utm_source=share&utm_medium=web2x&context=3)