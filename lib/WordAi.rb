class WordAi

	def initialize
    # Defaults go here in the future.
	end

	def madlib(body)

		# Replaces {}, {|},{|||||||||}, etc
		output = body.gsub(/(\{\}|\{\|*\})/,'')
		#srand(Time.now.nsec + rand(999999999999999))	
	

		while true do 
			vars = output.scan(/\{[^\{\}]+?\}/)

			if vars.count == 0
		            # No more madlib eval's, break out
			    break
			end


			# Evaluate the spintax on the run
			vars.each do |ind|
		   		parts = ind.gsub(/(\{|\})/,'').split(/\|/)
		   		output = output.gsub(ind,parts[rand(parts.size)])
			end

		end

		return output

	end

  # TBS User Definition & Setting
  def user
    return @user
  end

  def user=(value)
    @user = value
  end


	# WordAi Password Definition & Setting
  def pass
    return @pass
  end

  def pass=(value)
  	@pass = value
  end

  # WordAi Slider Value
  def slider
    return @slider
  end

  def slider=(value)
  	@slider = value
  end

  # WordAi Protected Words (no spaces, separated by commas)
  def protected
    return @protected
  end

  def protected=(value)
  	@protected = value
  end

  # WordAi Speed Value (on = no nested)
  def speed
    return @speed
  end

  def speed=(value)
  	@speed = value
  end

  # WordAi No Original Setting - on = Do NOT return original word back.
  def nooriginal
    return @nooriginal
  end

  def nooriginal=(value)
  	@nooriginal = value
  end

  def spin(body)

    require 'rubygems'
    require 'mechanize'

    if (@user == nil) || (@pass == nil) || (@slider == nil) || (body == nil)
      raise "You have not set your username (@user), password (@pass), slider value (@slider) or Body."
    end

    agent = Mechanize.new

    agent.read_timeout = 600

    api_url = "http://beta.WordAi.com/spinit.php"

    data = Hash.new
    data['s'] = body
    data['slider'] = @slider
    data['api'] = "true"
    data['email'] = @user
    data['pass'] = @pass
    data['speed'] = @speed if @speed != nil
    data['protected'] = @protected if @protected != nil
    data['nooriginal'] = @nooriginal if @nooriginal != nil


  # Post & Get Result
  spin_return = agent.post(api_url,data).content

  # Return (still in spintax, NOT evaluated)
  return spin_return


  end

end
