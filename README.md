# Personal site of John Kary

<http://johnkary.net>

Powered by [Jekyll](http://github.com/mojombo/jekyll)

# Development

To build the site and allow Jekyll to serve it:

    $ jekyll serve --drafts

To build the site as-is to the build directory:

    $ jekyll build --future --drafts

# Deployment

To deploy the latest version:

    $ cp bin/deploy.example bin/deploy
    
    # Customize with paths/hosts
    $ vi bin/deploy
    
    # Update .ssh/config with a host for johnkarydotnetdeploy
    $ vi ~/.ssh/config
    
    # Ship it!
    $ bash bin/deploy

# License

Refer to `license/index.md`
