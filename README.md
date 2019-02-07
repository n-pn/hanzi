# Hanzi

Utilities for dealing with chinese characters

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     hanzi:
       github: nipinium/hanzi
   ```

2. Run `shards install`

## Usage

```crystal
require "hanzi"

# Convert pinyin numbers to tone marks
puts Hanzi::Pinyin.number_to_tone("pin1 yin1")
# => "pīn yīn"
```

## LICENSE

MIT
