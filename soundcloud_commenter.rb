class SoundcloudCommenter

  def initialize(dict_location = 'dictionaries/hot.txt')
    @dict_location = dict_location
  end

  def mark
    unless @mark
      @mark = MarkyMarkov::TemporaryDictionary.new
      @mark.parse_file(@dict_location)
    end
    @mark
  end

  def mark_comment
    cmt = mark.generate_n_words(rand(average_dict_line_length*2) + 1)
    in_dictionary?(cmt) ? mark_comment : cmt
  end

  def literate
    unless @literate
      @literate = LiterateRandomizer.create(:source_material_file => @dict_location)
    end
    @literate
  end

  def literate_comment
    cmt = literate.sentence
    in_dictionary?(cmt) ? literate_comment : cmt
  end

  def gabbler
    unless @gabbler
      @gabbler = Gabbler.new
      @gabbler.learn(File.read(@dict_location))
    end
    @gabbler
  end

  def gabbler_comment
    cmt = gabbler.sentence
    in_dictionary?(cmt) ? gabbler_comment : cmt
  end

  def generate_comment
    case SecureRandom.random_number(2)
    when 0
      puts 'mark'
      mark_comment
    when 1
      puts 'literate'
      literate_comment
    when 2
      puts 'gabbler'
      gabbler_comment
    end
  end

  def inspect
    "#<SoundcloudCommenter:#{object_id}>"
  end

  private

  def in_dictionary?(string, dict = @dict_location)
    in_file = false
    File.open(dict).each_line do |li|
      in_file = true if li.match(string)
    end
    in_file
  end

  def average_dict_line_length
    unless @average_dict_line_length
      sum = 0
      File.read(@dict_location).each_line do |li|
        sum += li.split(" ").size
      end
      file_length = `wc -l #{@dict_location}`.split.first.to_i
      @average_dict_line_length = (sum / file_length).to_i
    end
    @average_dict_line_length
  end

end