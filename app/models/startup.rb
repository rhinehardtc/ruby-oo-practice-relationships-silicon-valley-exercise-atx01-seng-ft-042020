class Startup
    attr_reader :founder
    attr_accessor :name, :domain
    @@all = []
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(new_founder, new_domain)
        @founder = new_founder
        @domain = new_domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        Startup.all.find {|startup| startup.founder == founder}
    end

    def sign_contract(venturist, invest_type, amount)
        FundingRound.new(self, venturist, invest_type, amount)
    end

    def num_funding_rounds
        found = FundingRound.all.select {|round| round.startup == self}
        found.count
    end

    def investors
        found = FundingRound.all.select {|round| round.startup == self}
        found.uniq
    end

    def big_investors
        found = FundingRound.all.select {|round| VentureCapitalist.tres_commas_club.include?(round.venture_capitalist)}
        found.uniq
    end

end
