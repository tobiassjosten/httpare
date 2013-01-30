module Httpare.Site where

data Site = Site {
	domain :: String
	, protocol :: String
	, paths :: [String]
}

makeSite :: String -> Site
makeSite domain = Site domain "http" ["/"]
