require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
piper = Startup.new("piper", "Bob Marley", "Doodoo")
bezos = VentureCapitalist.new("Jeff Bezos", 1000000000)
cameron = VentureCapitalist.new("Cameron", 3000000000000)
marshall = VentureCapitalist.new("Marshall", 30000000)
round_1 = FundingRound.new(piper, cameron, "good as hell", -20)
round_2 = FundingRound.new(piper, marshall, "sproop", 30)
round_3 = FundingRound.new(piper, marshall, "sproop", 100)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line