module Httpare.Comparison where

import Httpare.Site

data Comparison = Comparison {
	source :: Site
	, target :: Site
	, history :: [String]
}

makeComparison :: [String] -> Comparison
makeComparison domains = Comparison sourceSite targetSite []
	where
		sourceSite = makeSite $ head domains
		targetSite = makeSite $ head $ tail domains

url :: Site -> String
url site = protocol site ++ "://" ++ domain site ++ (head $ paths site)
