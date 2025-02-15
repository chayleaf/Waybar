waybar-mpris(5)

# NAME

waybar - MPRIS module

# DESCRIPTION

The *mpris* module displays currently playing media via libplayerctl.

# CONFIGURATION

*player*: ++
	typeof: string ++
	default: playerctld ++
	Name of the MPRIS player to attach to. Using the default value always
	follows the currenly active player.

*ignored-players*: ++
	typeof: []string ++
	Ignore updates of the listed players, when using playerctld.

*interval*: ++
	typeof: integer ++
	Refresh MPRIS information on a timer.

*format*: ++
	typeof: string ++
	default: {player} ({status}) {dynamic} ++
	The text format.

*format-[status]*: ++
	typeof: string ++
	The status-specific text format.

*tooltip*: ++
	typeof: bool ++
	default: true ++
	Option to disable tooltip on hover.

*tooltip-format*: ++
	typeof: string ++
	default: {player} ({status}) {dynamic} ++
	The tooltip text format.

*tooltip-format-[status]*: ++
	typeof: string ++
	The status-specific tooltip format.

*artist-len*: ++
	typeof: integer ++
	Maximum length of the Artist tag (Wide/Fullwidth Unicode characters
	count as two). Set to zero to hide the artist in `{dynamic}` tag.

*album-len*: ++
	typeof: integer ++
	Maximum length of the Album tag (Wide/Fullwidth Unicode characters count
	as two). Set to zero to hide the album in `{dynamic}` tag.

*title-len*: ++
	typeof: integer ++
	Maximum length of the Title tag (Wide/Fullwidth Unicode characters count
	as two). Set to zero to hide the title in `{dynamic}` tag.

*dynamic-len*: ++
	typeof: integer ++
	Maximum length of the Dynamic tag (Wide/Fullwidth Unicode characters ++
	count as two). The dynamic tag will not truncate any tags beyond their ++
	set length limits, instead, it will attempt to fit as much of the ++
	available tags as possible. It is recommended you set title-len to ++
	something less than or equal to this value, so the title will always be ++
	displayed.

*dynamic-priority*: ++
	typeof: []string ++
	default: ["title", "length", "position", "artist", "album"] ++
	Priority of the tags when truncating the Dynamic tag (absence in this
	list means force inclusion).

*truncate-hours*: ++
	typeof: bool ++
	default: true ++
	Whether to hide hours when media duration is less than an hour long.

*enable-tooltip-len-limits*: ++
	typeof: bool ++
	default: false ++
	Option to enable the length limits for the tooltip as well. By default
	the tooltip ignores all length limits.

*ellipsis*: ++
	typeof: string ++
	default: "…" ++
	This character will be used when any of the tags exceed their maximum
	length. If you don't want to use an ellipsis, set this to empty string.

*rotate*: ++
	typeof: integer ++
	Positive value to rotate the text label.

*max-length*: ++
	typeof: integer ++
	The maximum length in character the module should display.

*min-length*: ++
	typeof: integer ++
	The minimum length in characters the module should take up.

*align*: ++
	typeof: float ++
	The alignment of the text, where 0 is left-aligned and 1 is right-aligned.
	If the module is rotated, it will follow the flow of the text.

*on-click*: ++
	typeof: string ++
	default: play-pause ++
	Overwrite default action toggles.

*on-middle-click*: ++
	typeof: string ++
	default: previous track ++
	Overwrite default action toggles.

*on-right-click*: ++
	typeof: string ++
	default: next track ++
	Overwrite default action toggles.

*player-icons*: ++
	typeof: map[string]string ++
	Allows setting _{player-icon}_ based on player-name property.

*status-icons*: ++
	typeof: map[string]string ++
	Allows setting _{status-icon}_ based on player status (playing, paused,
	stopped).


# FORMAT REPLACEMENTS

*{player}*: The name of the current media player

*{status}*: The current status (playing, paused, stopped)

*{artist}*: The artist of the current track

*{album}*: The album title of the current track

*{title}*: The title of the current track

*{length}*: Length of the track, formatted as HH:MM:SS

*{dynamic}*: Use _{artist}_, _{album}_, _{title}_ and _{length}_, automatically omit++
           empty values

*{player-icon}*: Chooses an icon from _player-icons_ based on _{player}_

*{status-icon}*: Chooses an icon from _status-icons_ based on _{status}_

# EXAMPLES

```
"mpris": {
	"format": "{player_icon} {dynamic}",
	"format-paused": "{status_icon} <i>{dynamic}</i>",
	"player-icons": {
		"default": "▶",
		"mpv": "🎵"
	},
	"status-icons": {
		"paused": "⏸"
	},
	// "ignored-players": ["firefox"]
}
```

# STYLE

- *#mpris*
- *#mpris.${status}*
- *#mpris.${player}*
