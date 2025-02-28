
/*
 ▀█▀▄▀▄█▀▄█ █
  █ ▀▄▀█▀▄▀▄█
  Simple, Clean, Elegant

 Page: https://toru.codeberg.page/
 Mastodon: @averagetiger89
 Repository: https://codeberg.org/toru
 Email: torupublic11@waifu.club
  
*/

/*
░█▀▄░█▀▄▀█░█▀▀░█▀▀▄░█░▒█
░█░█░█░▀░█░█▀▀░█░▒█░█░▒█
░▀▀░░▀░░▒▀░▀▀▀░▀░░▀░░▀▀▀
*/

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int centered = 0;                    /* -c option; centers dmenu on screen */
static int min_width = 500;                    /* minimum width when centered */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"Jetbrains Mono:size=10"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#ffffff", "#000000" },
	[SchemeSel] = { "#000000", "#ffffff" },
	[SchemeOut] = { "#000000", "#ffffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;
static unsigned int lineheight = 3;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
