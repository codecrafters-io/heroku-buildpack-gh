Heroku buildpack: gh
=========================

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpacks) that
allows one to run [`gh`](https://github.com/cli/cli) (GitHub's official command line tool) in a dyno 
alongside application code.

Usage
-----

Example usage:

    $ heroku config:set GITHUB_TOKEN=`<github-personal-access-token>`

    $ heroku buildpacks:add https://github.com/codecrafters-io/heroku-buildpack-gh

    $ git push heroku master
    ...

    remote: -----> gh app detected
    remote: === Fetching and vendoring gh into slug
    remote: === Installing profile.d script
    remote: === gh installation done
    ...

    $ heroku run 'gh --version'
    Running `gh --version` attached to terminal... up, run.3706
    gh version 2.4.0 (2021-12-21)
    https://github.com/cli/cli/releases/tag/v2.4.0
