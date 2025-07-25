print("Welcome to blackjack")

print("To start a new game use /new")
print("To add another card to your deck use /add")
print("To show current hand state use /hand")
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
        table.insert(Hand,Cards[i].." of "..Colors[j]) --concatenates strings
    elseif s=="/hand" then
        for c in pairs (Hand) do
            print(Hand[c])
        end
    elseif s=="/sum" then
        local s1=0; local s11=0 --if the deck contains an ace, we will have 2 different sums
        for c in pairs (Hand) do
            if(string.find(Hand[c],"Ace")~=nil) then --negation of equality
                s1=s1+1
                s11=s11+11
            else 
                local card_contents =string.match(Hand[c],"%S+")
                s1 = s1+ N[card_contents]
                s11 = s11 + N[card_contents]
            end
        end
        print(s1)
        if(s1~=s11) then print(s11) end
    elseif s=="/quit" then
        Quit=true
    end
end
