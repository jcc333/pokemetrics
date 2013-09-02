module PokemonStats where
import Data.List
import Data.List.Split
import Data.List.Extras.Argmax
import Text.CSV

(|>) a b = b a

data Type = Normal
          | Fight
          | Flying
          | Poison
          | Ground
          | Rock
          | Bug
          | Ghost
          | Fire
          | Water
          | Grass
          | Electric
          | Psychic
          | Ice
          | Dragon
          deriving(Show, Read)

readTypeString :: [Char] -> [Type]
readTypeString typeString = map (\s->read s::Type) $ splitOn "/" typeString

data Pokemon = Pokemon {number :: Int,
                        name :: String,
                        hp :: Int,
                        attack :: Int,
                        defense :: Int,
                        spAttack :: Int,
                        spDefense :: Int,
                        speed :: Int,
                        types :: [Type]} deriving(Show)

naiveMeanRating p =
  realToFrac (sum $ map (\ trait -> trait p) $ allStats) / numStats
  where 
    allStats = [number, hp, attack, defense, spAttack, spDefense, speed] 
    numStats = genericLength allStats

