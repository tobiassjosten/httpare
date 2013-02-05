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
		url = head urls
		newNewUrls = if checkUrl url then newUrls ++ [url] else newUrls

checkUrl url = do
	response <- Network.HTTP.simpleHTTP (getRequest url)
	responseCode <- getResponseCode response
	isSuccessful responseCode

isSuccessful :: ResponseCode -> Bool
isSuccessful (2, _, _) = True
isSuccessful (3, _, _) = True
isSuccessful responseCode = False

getCodeAsString :: ResponseCode -> String
getCodeAsString (a, b, c) = show a ++ show b ++ show c
