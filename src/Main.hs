module Main where

import Network.HTTP

data Site = Site {
	domain :: String
	, protocol :: String
	, paths :: [String]
}

data Comparison = Comparison {
	source :: Site
	, target :: Site
	, history :: [String]
}

main :: IO ()
main = do
	response <- Network.HTTP.simpleHTTP (getRequest $ url $ source comparison)
	responseCode <- getResponseCode response
	putStrLn $ getCodeAsString responseCode
	where
		sourceSite = Site "www.haskell.org" "http" ["/"]
		targetSite = Site "vvv.tobiassjosten.net" "http" []
		comparison = Comparison sourceSite targetSite []

url :: Site -> String
url site = protocol site ++ "://" ++ domain site ++ (head $ paths site)

getCodeAsString :: ResponseCode -> String
getCodeAsString (a, b, c) = show a ++ show b ++ show c
