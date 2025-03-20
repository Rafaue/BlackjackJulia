export Player, add_card!, calculate_score, is_bust

mutable struct Player
    name::String
    hand::Vector{Card}
    
    Player(name::String) = new(name, Card[])
end

function add_card!(player::Player, card::Card)
    push!(player.hand, card)
    return player
end

function calculate_score(player::Player)
    score = sum(value(card) for card in player.hand)
    aces = count(card -> card.rank == 1, player.hand)
    
    # Jeśli przekroczono 21 i są asy, zmniejsz wartość asów z 11 na 1
    while score > 21 && aces > 0
        score -= 10
        aces -= 1
    end
    
    return score
end

function is_bust(player::Player)
    return calculate_score(player) > 21
end

function Base.show(io::IO, player::Player)
    print(io, "$(player.name): [")
    for (i, card) in enumerate(player.hand)
        print(io, card)
        if i < length(player.hand)
            print(io, ", ")
        end
    end
    print(io, "] ($(calculate_score(player)))")
end
