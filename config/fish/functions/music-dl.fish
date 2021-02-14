function music-dl
	youtube-dl \
		--output "%(album)s/%(playlist_index)s - %(title)s.%(ext)s" \
		--extract-audio \
		--format 251 \
		--add-metadata \
		$argv[1]
end
