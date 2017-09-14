require "yaml"

def load_library(path)
  emoticons = YAML.load_file(path)
  newHash = {}
  new_hash= {}

  emoticons.each do |key, value|
      newHash[value[1]] = key.to_s
      new_hash[value[0]] = value[1]
  end
  emoticon_hash = {"get_meaning" => newHash, "get_emoticon" => new_hash}
end

def get_japanese_emoticon(path, english_emoticon)
  loaded = load_library(path)
    loaded["get_emoticon"].each do |key, value|
      if key == english_emoticon
        return value
      elsif !loaded["get_emoticon"].include?(english_emoticon)
        return "Sorry, that emoticon was not found"
      else
    end
  end
end

def get_english_meaning(path, japanese_emoticon)
  loaded = load_library(path)
    loaded["get_meaning"].each do |key, value|
    return value if key == japanese_emoticon
  end
    return "Sorry, that emoticon was not found" if !loaded["get_meaning"].include?(japanese_emoticon)
end
