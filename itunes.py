iTunes = SBApplication.applicationWithBundleIdentifier_("com.apple.iTunes")
track = iTunes.currentTrack().name()
artist = iTunes.currentTrack().artist()
if track and artist:
    vim.command("let g:foo = \" {0} - {1}\"".format(track, artist))
else:
    vim.command("let g:foo = ''")
