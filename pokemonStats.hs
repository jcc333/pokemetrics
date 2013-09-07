module PokemonStats where
import Data.List
import Data.List.Extras.Argmax
import Control.Arrow
import Control.Monad
import Types
import CSV

data Pokemon = Pokemon {number :: Int,
                        name :: String,
                        hp :: Int,
                        attack :: Int,
                        defense :: Int,
                        spAttack :: Int,
                        spDefense :: Int,
                        speed :: Int,
                        types :: [Type]}
                        deriving(Show, Read) 

pokemonFromRecord :: Record -> Pokemon
pokemonFromRecord r = Pokemon (read (r !! 0)::Int)
                              (r !! 1)
                              (read (r !! 2)::Int)
                              (read (r !! 3)::Int)
                              (read (r !! 4)::Int)
                              (read (r !! 5)::Int)
                              (read (r !! 6)::Int)
                              (read (r !! 7)::Int)
                              (readTypeString (r !! 8))

pokemonFromCSV csv = map pokemonFromRecord $ tail csv

naiveMeanRating p =
  realToFrac (sum $ map (\ trait -> trait p) $ combatStats) / numStats
  where 
    combatStats = [hp, attack, defense, spAttack, spDefense, speed] 
    numStats = genericLength combatStats

bestType :: [Type] -> [Pokemon] -> Type
bestType ts ps = argmax  (\t -> typeValue t ps) ts

bestTypeGenOne = bestType generationOneTypes

typeValue :: Fractional f => Type -> [Pokemon] -> f
typeValue t ps = sum $ map (multiplier t) listTypes
  where listTypes = concat $ map types ps

main filepath = do
  fileResults <- parseCSV filepath
  case fileResults of
    Left err -> print err
    Right val -> putStr $ unlines $ map show $ pokemonFromCSV val

