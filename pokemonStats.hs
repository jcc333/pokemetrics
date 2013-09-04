module PokemonStats where
import Data.List
import Data.List.Extras.Argmax
import Types
import Text.CSV

(|>) a b = b a

data Pokemon = Pokemon {number :: Int,
                        name :: String,
                        hp :: Int,
                        attack :: Int,
                        defense :: Int,
                        spAttack :: Int,
                        spDefense :: Int,
                        speed :: Int,
                        types :: [Type]} deriving(Show)

readPokemon :: [[Char]] -> Pokemon
-- map a list of strings (a line of a csv) to a Pokemon

naiveMeanRating p =
  realToFrac (sum $ map (\ trait -> trait p) $ allStats) / numStats
  where 
    allStats = [number, hp, attack, defense, spAttack, spDefense, speed] 
    numStats = genericLength allStats

