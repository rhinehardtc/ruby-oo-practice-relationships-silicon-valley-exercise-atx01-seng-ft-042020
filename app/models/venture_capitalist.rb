class VentureCapitalist
    attr_reader :name
    attr_accessor :net_worth
    @@all = []

    def initialize(name, net_worth)
        @name = name
        @net_worth = net_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select {|person| person.net_worth >= 1000000000}
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def funding_rounds
        found = FundingRound.all.select {|round| round.venture_capitalist == self}
        found.count
    end

    def portfolio
        found = FundingRound.all.select {|round| round.venture_capitalist == self}
        found.uniq
    end

    def biggest_investment
        the_moneys = portfolio.map {|round| round.investment}
        the_moneys.max
    end

    def invested(domain)
        domains = portfolio.select {|round| round.startup.domain == domain}
        the_moneys = domains.map {|round| round.investment}
        the_moneys.sum
    end
end
