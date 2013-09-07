module Players where
import System.Random
import Data.List

type Player = String
type Match = (Player, Player)
type Round = [Match]
type Tournament = [Round]

rounds :: Fractional f => [a] -> f
rounds players = 
  let n = genericLength players in
    (n/2)*(n-1)

ourplayers = ["James", "Gus", "Sean", "Cait", "SBW", "Jake", "Alex", "Lynne"]

playersToRound :: [Player] -> Round
playersToRound ps = zip left right
  where halved = halve ps
        left = reverse.fst $ halved
        right = snd halved

halve xs = splitAt (n `div` 2) xs
    where n = length xs

rotate :: [a] -> [a]
rotate lst = [(head lst), (last lst)] ++ ((tail.init) lst)

playersToTournament ::[Player] -> Tournament
playersToTournament ps = playersToTournamentAux ps (length ps)
  where 
    playersToTournamentAux ps n = 
      case n of
        0 -> []
        _ -> (playersToRound ps):playersToTournamentAux (rotate ps) (n-1) 

format :: Tournament -> [String]
format t = map showRound t
  where showRound r = unlines (map showMatch r)
        showMatch m = (fst m) ++ " vs. " ++ (snd m)

main = putStrLn $ unlines (format (playersToTournament ourplayers))
