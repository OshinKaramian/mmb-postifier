mmb-postifier
=============

Small Ruby App Mediocre Music Blog uses to compile Songs of The Week posts.  This DSL (Domain Specific Language) will query the Grooveshark and Spotify APIs to gather links and build out playlists.

#Setup
1.  Install Ruby.  If you're on a Mac you're already good to go.
2.  You may need a few Ruby gems.  Type gem install json into the command line.
3.  Create a .sotw file.  There are 2 example files including in this package.
4.  In the command line at the root folder type ruby sotw.rb [filename].sotw

The output text should be all that's needed to compile the post! Shazaam!
