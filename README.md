# Bashodoro 🍅

Bashodoro is a simple Pomodoro timer implemented as a bash script, with an optional BitBar plugin for easy access from your macOS menu bar.

## Prerequisites

- macOS (for the BitBar plugin)
- BitBar installed (for the BitBar plugin, install using `brew install bitbar`)
- `terminal-notifier` (for macOS notifications, install using `brew install terminal-notifier`)

## Installation

1. Clone this repository:

```bash
git clone https://github.com/yourusername/bashodoro.git
```

2. Copy the bashodoro.sh script to a directory in your PATH, e.g.:

```bash
ln -s bashodoro/bashodoro.sh ~/bin/
chmod +x ~/bin/bashodoro.sh
```

3. (Optional) Set up the BitBar plugin:
* Create a link to the bashodoro-bitbar-plugin.1s.sh script in your BitBar plugins directory:

```bash
ln -s bashodoro/bashodoro-bitbar-plugin.1s.sh /path/to/bitbar/plugins/bashodoro.1s.sh
```

* Refresh BitBar.

## Usage
* Run `bashodoro.sh` with the desired duration in minutes, e.g.:

```bash
bashodoro.sh 25
```

* If using the BitBar plugin, you can start and stop timers by clicking the 🍅 icon in the menu bar and selecting a duration or "Stop".

## License
This project is open-source and available under the MIT License. See the LICENSE file for details.


