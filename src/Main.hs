module Main where

import Httpare.Comparison
import Network.HTTP
import System.Environment (getArgs)

main :: IO ()
main = do
	args <- getArgs
	let comparison = makeComparison args
	response <- Network.HTTP.simpleHTTP (getRequest $ url $ source comparison)
	responseCode <- getResponseCode response
	putStrLn $ getCodeAsString responseCode

getCodeAsString :: ResponseCode -> String
getCodeAsString (a, b, c) = show a ++ show b ++ show c
