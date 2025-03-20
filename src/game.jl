export play

function play()
    println("Witaj w grze Blackjack!")
    println("------------------------")
    
    balance = 100  # Startowy balans
    
    while true
        println("\nAktualny balans: $balance")
        
        #  Zainicjalizowanie graczy
        player = Player("Gracz")
        dealer = Player("Krupier")
        
        # Przygotowanie talii
        deck = Deck()
        shuffle!(deck)
        
        # Początkowe rozdanie
        add_card!(player, deal!(deck))
        add_card!(dealer, deal!(deck))
        add_card!(player, deal!(deck))
        add_card!(dealer, deal!(deck))
        
        # Pokazywanie kart
        println("Twoje karty: $player")
        println("Karta krupiera: $(dealer.hand[1])")
        
        # Pobieranie stawki  gracza
        println("Podaj stawkę (0, aby wyjść):")
        bet = 0  
        while true
            try
                bet = parse(Int, readline())
                if bet == 0
                    println("Dziękujemy za grę!")
                    return
                elseif bet > balance
                    println("Nie masz wystarczających środków na taką stawkę.")
                elseif bet <= 0
                    println("Stawka musi być dodatnia.")
                else
                    break
                end
            catch e
                println("Nieprawidłowa stawka. Spróbuj ponownie.")
            end
        end
        
        # Tura gracza
        player_turn(player, deck)
        
        # Tura krupiera (tylko jeśli gracz n przekroczył 21)
        if !is_bust(player)
            dealer_turn(dealer, deck)
            println("Karty krupiera: $dealer")
        end
        
        # Wyświetlanie wyniku
        display_result(player, dealer)
        
        # Aktualizujowanie balansu gracza
        if is_bust(player)
            println("Przegrywasz stawkę.")
            balance -= bet
        elseif is_bust(dealer)
            println("Wygrana! Otrzymujesz podwójną stawkę.")
            balance += bet
        elseif calculate_score(player) > calculate_score(dealer)
            println("Wygrana! Otrzymujesz podwójną stawkę.")
            balance += bet
        elseif calculate_score(dealer) > calculate_score(player)
            println("Przegrywasz stawkę.")
            balance -= bet
        else
            println("Remis. Stawka zostaje zwrócona.")
        end
        
        # Sprawdzanie czy gracz ma srodki
        if balance <= 0
            println("Nie masz wiecej kasy, wypad z kasyna!")
            sleep(5)  # Czekaj 5 seknd przed zakończeniem gry
            break
        end
        
        # Pytanie o kontynuację gry
        println("\nCzy chcesz zagrać kolejną turę? (tak/nie)")
        choice = readline()
        
        if lowercase(choice) == "tak"
            continue
        elseif lowercase(choice) == "nie"
            println("Dziękujemy za grę!")
            break
        else
            println("Nieprawidłowy wybór. Spróbuj ponownie.")
        end
    end
end

function player_turn(player::Player, deck::Deck)
    while true
        println("\nCo chcesz zrobić?")
        println("1. Dobierz kartę (hit)")
        println("2. Zostań (stand)")
        
        choice = readline()
        
        if choice == "1"
            add_card!(player, deal!(deck))
            println("Twoje karty: $player")
            
            if is_bust(player)
                println("Przekroczyłeś 21! Przegrywasz.")
                break
            end
        elseif choice == "2"
            println("Zostajesz z kartami: $player")
            break
        else
            println("Nieprawidłowy wybór. Spróbuj ponownie.")
        end
    end
end

function dealer_turn(dealer::Player, deck::Deck)
    println("\nTura krupiera:")
    
    # Krupier dobiera do osiągnięcia co najmniej 17 punktów.
    while calculate_score(dealer) < 17
        add_card!(dealer, deal!(deck))
        println("Krupier dobiera: $dealer")
    end
end

function display_result(player::Player, dealer::Player)
    player_score = calculate_score(player)
    dealer_score = calculate_score(dealer)
    
    println("\n--- Wynik gry ---")
    println("Twoje karty: $player")
    println("Karty krupiera: $dealer")
    
    if is_bust(player)
        println("Przegrałeś! Przekroczyłeś 21.")
    elseif is_bust(dealer)
        println("Wygrałeś! Krupier przekroczył 21.")
    elseif player_score > dealer_score
        println("Wygrałeś! Masz więcej punktów niż krupier.")
    elseif dealer_score > player_score
        println("Przegrałeś! Krupier ma więcej punktów.")
    else
        println("Remis! Masz tyle samo punktów co krupier.")
    end
end

