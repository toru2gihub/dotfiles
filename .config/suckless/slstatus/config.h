/* See LICENSE file for copyright and license details. */

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
░█▀▀░█░░█▀▀░▀█▀░█▀▀▄░▀█▀░█░▒█░█▀▀
░▀▀▄░█░░▀▀▄░░█░░█▄▄█░░█░░█░▒█░▀▀▄
░▀▀▀░▀▀░▀▀▀░░▀░░▀░░▀░░▀░░░▀▀▀░▀▀▀
*/

/* interval between updates (in ms) */
const unsigned int interval = 1000;

/* text to show if no value can be retrieved */
static const char unknown_str[] = "n/a";

/* maximum output string length */
#define MAXLEN 2048

static const char vol[]         = "[ `amixer sget Master | tail -n 1 | awk '{print $6;}'` = \"[on]\" ] \
                                   && printf \"`amixer sget Master | tail -n 1 | awk '{print $5;}' | grep -Po '\\[\\K[^%]*'`%%\" \
                                   || printf 'Off'";

static const char mic[]         = "[ `amixer sget Capture | tail -n 1 | awk '{print $6;}'` = \"[on]\" ] \
                                   && printf \"`amixer sget Capture | tail -n 1 | awk '{print $5;}' | grep -Po '\\[\\K[^%]*'`%%\" \
                                   || printf 'Off'";

static const struct arg args[] = {
{run_command,  " %s ",        vol },
{cpu_perc,     " %s%% ",      NULL },
{ram_perc,     " %s%% ",      NULL },
{datetime,     " %s",    "%a %d %b %y" },
{datetime,     " %s",        "%r" },
};
