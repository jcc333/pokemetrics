module Types where
import Data.List.Split

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

generationOneTypes = [Normal, Fight, Flying, Poison, Ground,
                      Rock, Bug, Ghost, Fire, Water,
                      Grass, Electric, Psychic, Ice, Dragon]

readTypeString :: [Char] -> [Type]
readTypeString typeString = map (\s->read s::Type) $ splitOn "/" typeString

multiplier Normal Rock  = 0.5
multiplier Normal Ghost = 0

multiplier Fight Normal = 2
multiplier Fight Flying = 0.5
multiplier Fight Poison = 0.5
multiplier Fight Rock = 2
multiplier Fight Psychic = 0.5
multiplier Fight Ice = 2

multiplier Flying Fight = 2
multiplier Flying Rock = 0.5
multiplier Flying Bug = 2
multiplier Flying Grass = 2
multiplier Flying Electric = 0.5

multiplier Poison Poison = 0.5
multiplier Poison Ground = 0.5
multiplier Poison Rock = 0.5
multiplier Poison Bug = 2
multiplier Poison Ghost = 0.5
multiplier Poison Grass = 2

multiplier Ground Flying = 0
multiplier Ground Poison = 2
multiplier Ground Rock = 2
multiplier Ground Bug = 0.5
multiplier Ground Fire = 2
multiplier Ground Grass = 0.5
multiplier Ground Electric = 0.5

multiplier Rock Fight = 0.5
multiplier Rock Flying = 2
multiplier Rock Ground = 0.5
multiplier Rock Bug = 2
multiplier Rock Fire = 2
multiplier Rock Ice = 2

multiplier Bug Fight = 0.5
multiplier Bug Flying = 0.5
multiplier Bug Poison = 2
multiplier Bug Ghost = 0.5
multiplier Bug Fire = 0.5
multiplier Bug Grass = 2
multiplier Bug Psychic = 2

multiplier Ghost Normal = 0
multiplier Ghost Ghost = 2
multiplier Ghost Psychic = 0

multiplier Fire Rock = 0.5
multiplier Fire Bug = 2
multiplier Fire Fire = 0.5
multiplier Fire Water = 0.5
multiplier Fire Grass = 2
multiplier Fire Ice = 2
multiplier Fire Dragon = 0.5

multiplier Water Ground = 2
multiplier Water Rock = 2
multiplier Water Fire = 2
multiplier Water Water = 0.5
multiplier Water Grass = 0.5
multiplier Water Dragon = 0.5

multiplier Grass Flying = 0.5
multiplier Grass Poison = 0.5
multiplier Grass Ground = 2
multiplier Grass Rock = 2
multiplier Grass Bug = 0.5
multiplier Grass Fire = 0.5
multiplier Grass Water = 2
multiplier Grass Grass = 0.5
multiplier Grass Dragon = 0.5

multiplier Electric Flying = 2
multiplier Electric Ground = 0.5
multiplier Electric Water = 2
multiplier Electric Grass = 0.5
multiplier Electric Electric = 0.5
multiplier Electric Dragon = 0.5

multiplier Psychic Fight = 2
multiplier Psychic Poison = 2
multiplier Psychic Psychic = 0.5

multiplier Ice Flying = 2 
multiplier Ice Ground = 2
multiplier Ice Water = 0.5
multiplier Ice Grass = 2
multiplier Ice Ice = 0.5
multiplier Ice Dragon = 2

multiplier Dragon Dragon = 2

multiplier _ _ = 1
