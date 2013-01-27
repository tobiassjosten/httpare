module Main where

import Network.HTTP

main :: IO ()
main = do
	response <- Network.HTTP.simpleHTTP (getRequest "http://www.haskell.org/")
	responseCode <- getResponseCode response
	putStrLn $ getCodeAsString responseCode

isSuccess :: ResponseCode -> Bool
isSuccess (a, _, _) = a == 2

getCodeAsString :: ResponseCode -> String
getCodeAsString (a, b, c) = show a ++ show b ++ show c
