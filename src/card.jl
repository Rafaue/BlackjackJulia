export Card, value

struct Card
    suit::String
    rank::Int
end

function Base.show(io::IO, card::Card)
    ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    print(io, ranks[card.rank] * card.suit)
end

function value(card::Card)
    if card.rank == 1
        return 11  # As
    elseif card.rank > 10
        return 10  # Figury
    else
        return card.rank
    end
end
