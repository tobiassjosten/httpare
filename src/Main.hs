module Main where

import Network.HTTP
import System.Environment (getArgs)

main :: IO ()
main = do
	args <- getArgs
	let
		sourceSite = "http://" ++ (head args)
		targetSite = "http://" ++ (head $ tail args)

	mapM_ putStrLn $ check targetSite $ check sourceSite ["/"]

check :: String -> [String] -> [String]
check site [] = []
check site urls = check' site urls []

check' :: String -> [String] -> [String] -> [String]
check' site [] newUrls = newUrls
check' site urls newUrls = newUrls ++ check' site (tail urls) newNewUrls
	where
		isSuccessful = True -- Check response for `head urls`
		newNewUrls = if isSuccessful then newUrls ++ [head urls] else newUrls

getCodeAsString :: ResponseCode -> String
getCodeAsString (a, b, c) = show a ++ show b ++ show c
