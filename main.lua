print("Welcome to blackjack")

print("To start a new game use /new")
print("To add another card to your deck use /add")
print("To show current deck state use /deck")
print("To show current sum of card values in your deck use /sum")
print("To check for win use /check")
print("To exit program write /quit")

Quit=false

--values of cards
N = {
    ["Ace"] = 1,
    ["Two"] = 2,
    ["Three"] = 3,
    ["Four"] = 4,
    ["Five"] = 5,
    ["Six"] = 6,
    ["Seven"] = 7,
    ["Eight"] = 8,
    ["Nine"] = 9,
    ["Ten"] = 10,
    ["Jack"]=10,
    ["Queen"]=10,
    ["King"]=10,
}

--current state of the deck
Deck = {}

--hand (current cards owned by player)
Hand={}
--dealer (current cards owned by dealer) Always hits if under 17, hit/stand
Dealer={}

--keys for accesing current state of the deck
Colors={"Hearts","Diamonds","Clubs","Spades"}
Cards = {"Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"}

-- init deck (full by default)
function NewGame ()
    Deck= {}
    Dealer={}
    Hand={}
    for i=1,13 do
    Deck[Cards[i]] = {}
    for j=1,4 do
        Deck[Cards[i]][Colors[j]] = 1 --1 card of each type by default
    end	
    end
end

while not Quit do
    local s = io.read("*l") -- read command
        if s=="/new" then
        print("Started new game. Use /add to add cards to your deck")
        NewGame()
    elseif s=="/add" then
        print("Added new card to deck")
        local i,j,card
        repeat
            i = math.random(1,13)
            j = math.random(1,4)
            card= Deck[Cards[i]][Colors[j]]
        until card ==1
        card=card-1 --delete card from deck
        table.insert(Hand,Cards[i].." of "..Colors[j])
        print(Hand[1])
    elseif s=="/deck" then
        for c in pairs (Deck) do
            print(Deck[c])
        end
    end
end
