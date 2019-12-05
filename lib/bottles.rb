class Bottles

  def song
    bottle_phrases(99, 0)
  end

  def verses (no_of_bottles_1, no_of_bottles_2)
    bottle_phrases(no_of_bottles_1, no_of_bottles_2)
  end

  def bottle_phrases(no_of_bottles_1, no_of_bottles_2)
    bottles_index = (no_of_bottles_2..no_of_bottles_1).to_a.reverse

    phrases = ""

    bottles_index.each do |bottle|
      phrases << (bottle_phrase(bottle) + "\n")
    end

    return (phrases.strip + "\n")
  end


  def verse (bottle_index)
    return bottle_phrase(bottle_index)
  end

  def bottle_phrase(bottle_index)
    @bottle_index = bottle_index

    phrase=<<-VERSE
#{bottle_status_on_wall().capitalize()}, #{pluralize_bottle()} of beer.
#{action_on_bottle()}, #{bottle_status_on_wall()}.
VERSE

    return phrase
  end


  def bottle_status_on_wall()
    "#{pluralize_bottle()} of beer on the wall"
  end

  def pluralize_bottle()
    @bottle_index == 0 ? "no more bottles" : (@bottle_index > 1 ? "#{@bottle_index} bottles" : "1 bottle")
  end

  def action_on_bottle()
    action = ""
    if @bottle_index >= 1
      action = "Take #{@bottle_index > 1 ? "one" : "it" } down and pass it around"
      @bottle_index -= 1
    else
      action = "Go to the store and buy some more"
      @bottle_index = 99
    end
    return action
  end

end
