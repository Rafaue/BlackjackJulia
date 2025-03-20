export Deck, shuffle!, deal!

using Random

struct Deck
    cards::Vector{Card}
end

function Deck()
    cards = Card[]
    suits = ["♥", "♦", "♣", "♠"]
    
    for suit in suits
        for rank in 1:13
            push!(cards, Card(suit, rank))
        end
    end
    
    return Deck(cards)
end

function shuffle!(deck::Deck)
    Random.shuffle!(deck.cards)
    return deck
end

function deal!(deck::Deck)
    if isempty(deck.cards)
        error("Talia jest pusta!")
    end
    return pop!(deck.cards)
end
