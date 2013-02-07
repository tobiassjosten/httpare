module Main where

import Control.Monad (filterM)
import Network.HTTP
import System.Environment (getArgs)

main :: IO ()
main = do
	args <- getArgs
	let
		sourceSite = head args
		targetSite = head $ tail args

	sourceUrls <- check sourceSite ["/"]
	check targetSite sourceUrls

	return ()

check :: String -> [String] -> IO [String]
check site urls = do
	putStrLn site
	filterM (checkUrl site) urls

checkUrl :: String -> String -> IO Bool
checkUrl site url = do
	response <- Network.HTTP.simpleHTTP (getRequest $ "http://" ++ site ++ url)
	responseCode <- getResponseCode response
	printResponse responseCode url
	return $ isSuccessful responseCode

isSuccessful :: ResponseCode -> Bool
isSuccessful (2, _, _) = True
isSuccessful (3, _, _) = True
isSuccessful responseCode = False

printResponse :: ResponseCode -> String -> IO ()
printResponse responseCode url
	| not $ isSuccessful responseCode = putStrLn $ (getCodeAsString responseCode) ++ " " ++ url
	| otherwise = return ()

getCodeAsString :: ResponseCode -> String
getCodeAsString (a, b, c) = show a ++ show b ++ show c
