WordAi
=========
**What is WordAi**

The WordAi Gem is a rubygem that assists with spinning content from WordAi (http://www.WordAi.com)

**Example uses?**

Here's a few examples to get you started. The main 2 (and only 2) functions right now are for the WordAi API and my madlib function (superspin/nested spin).

	# Evaluate spintax article

	require 'WordAi'

	bofu = WordAi.new

	puts bofu.madlib("{I|You|We} Write {Content|Words|Sentences}")

	# I Write Content / We Write Sentences / We Write Words / You Write Sentences / etc.

For WordAI:

	# Run a sentence through WordAI

	require 'WordAi'

	bofu = WordAi.new

	bofu.user = "email@address.com"

	bofu.pass = "secrets"

	bofu.slider = "50"

	puts bofu.spin("After finishing up on this code, I would like to get a reply with some other ways to phrase this sentence.")

	# After finishing {up on|through to} this {code|signal|rule}, {I would|I'd} {like to|prefer to|want to} get {a reply|a response|an answer} with {some other|various other} {ways to|methods to|approaches to} phrase this {sentence|word}.

Coded by Bofu2U - http://Contempt.me