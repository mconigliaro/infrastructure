# Transform a hash into a .gitconfig
def hash2gitconfig(hash)
  hash.inject([]) { |config,(section,pairs)|
    config + ["[#{section}]"] + pairs.inject([]) { |memo,(k,v)|
      memo + ["  #{k} = #{v}"]
    }
  }.join("\n")
end
