# HTTPare

Compare one site to another.

## Usage

*NB: I'm adopting [Readme Driven Development](http://tom.preston-werner.com/2010/08/23/readme-driven-development.html) for this project and so what you read here might not yet be implemented until a 1.0.0 release.*

You give **HTTPare** two arguments; one for the source site and one for the target site.

    $ httpare -r vvv.tobiassjosten.net local.tobiassjosten.net
    404 /about-tobias
    301 /blog -> /uber-blog

This is a sample output from a migration of my site site [`vvv.tobiassjosten.net`](http://vvv.tobiassjosten.net/). I'm keeping a local copy of the new site at `local.tobiassjosten.net` and using **HTTPare** I can see which paths differs between the old and the new site.

    404 /about-tobias

In the above example I can see that the old "About Tobias" page has gone missing and the `404` status code is a page not found.

    301 /blog -> /uber-blog

Here I see that I used to have a `/blog` page but it has been handled and redirected to a new URL. This usually means everything is fine, which is why **HTTPare** won't show redirects without the `--show-redirects` (`-r` for short) option.
