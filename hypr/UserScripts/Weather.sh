#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Weather info for Waybar using wttr.in
# Auto detects city via IP

# Directory and cache setup
cachedir="$HOME/.cache/rbn"
mkdir -p "$cachedir"

# Get city automatically via IP
city=$(curl -s https://ipinfo.io/city)
city="${city:-Unknown}"

cachefile="$cachedir/weather-${city// /_}"

# Cache age check (30 minutes)
cacheage=0
[ -f "$cachefile" ] && cacheage=$(( $(date +%s) - $(stat -c %Y "$cachefile") ))

if [ $cacheage -gt 1800 ] || [ ! -s "$cachefile" ]; then
    # Fetch weather from wttr.in
    mapfile -t data < <(curl -s "https://wttr.in/${city}?0qnT" 2>&1)
    # Save only first 3 lines for simplicity
    echo "${data[0]}" > "$cachefile"
    echo "${data[1]}" >> "$cachefile"
    echo "${data[2]}" >> "$cachefile"
fi

# Read cached data
mapfile -t weather < "$cachefile"

# Clean and prepare variables
temperature=$(echo "${weather[2]}" | sed -E 's/([0-9]+)\.\./\1 to /g' | xargs)
condition_text=$(echo "${weather[1]}" | tr '[:upper:]' '[:lower:]' | xargs)

# Map weather condition to icon & class
case "$condition_text" in
"clear"|"sunny")
    condition=""; weather_class="sunnyDay";;
"partly cloudy"|"partly sunny")
    condition="󰖕"; weather_class="cloudyFoggyDay";;
"cloudy"|"overcast")
    condition=""; weather_class="cloudyFoggyDay";;
"fog"|"freezing fog")
    condition=""; weather_class="cloudyFoggyNight";;
"patchy rain possible"|"patchy light drizzle"|"light drizzle"|"patchy light rain"|"light rain"|"light rain shower"|"mist"|"rain")
    condition="󰼳"; weather_class="rainyDay";;
"moderate rain at times"|"moderate rain"|"heavy rain at times"|"heavy rain"|"moderate or heavy rain shower"|"torrential rain shower"|"rain shower")
    condition=""; weather_class="rainyDay";;
"patchy snow possible"|"patchy sleet possible"|"patchy freezing drizzle possible"|"freezing drizzle"|"heavy freezing drizzle"|"light freezing rain"|"moderate or heavy freezing rain"|"light sleet"|"ice pellets"|"light sleet showers"|"moderate or heavy sleet showers")
    condition="󰼴"; weather_class="snowyIcyDay";;
"blowing snow"|"moderate or heavy sleet"|"patchy light snow"|"light snow"|"light snow showers")
    condition="󰙿"; weather_class="snowyIcyDay";;
"blizzard"|"patchy moderate snow"|"moderate snow"|"patchy heavy snow"|"heavy snow"|"moderate or heavy snow with thunder"|"moderate or heavy snow showers")
    condition=""; weather_class="snowyIcyNight";;
"thundery outbreaks possible"|"patchy light rain with thunder"|"moderate or heavy rain with thunder"|"patchy light snow with thunder")
    condition=""; weather_class="severe";;
*)
    condition=""; weather_class="default";;
esac

# Output JSON for Waybar
json_output="{\"text\":\"$temperature $condition\", \"alt\":\"$city\", \"tooltip\":\"$city: $temperature ${weather[1]}\", \"class\":\"$weather_class\"}"
echo -e "$json_output"

# Optional: save simplified cache for display
cached_weather=" $temperature  \n$condition ${weather[1]}"
echo -e "$cached_weather" > "$HOME/.cache/.weather_cache"
