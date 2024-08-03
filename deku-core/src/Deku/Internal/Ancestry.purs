module Deku.Internal.Ancestry
  ( root
  , element
  , dyn
  , portal
  , fixed
  , toStringRepresentationInDOM
  , unsafeFakeAncestry
  , hasElementParent
  , unsafeCollectLineage
  , Ancestry
  , DekuAncestry(..)
  ) where

import Prelude

import Data.Maybe (Maybe(..))
import Data.String as String

-- Fixed and Element track total
data DekuAncestry
  = Element Int DekuAncestry
  | Dyn Int DekuAncestry
  | Portal Int DekuAncestry
  | Fixed Int DekuAncestry
  | Root

instance Show DekuAncestry where
  show (Element i a) = "Element " <> show i <> " " <> show a
  show (Dyn i a) = "Dyn " <> show i <> " " <> show a
  show (Portal i a) = "Portal " <> show i <> " " <> show a
  show (Fixed i a) = "Fixed " <> show i <> " " <> show a
  show Root = "Root"

derive instance Eq DekuAncestry
derive instance Ord DekuAncestry

data Ancestry = RealAncestry { rep :: String, lineage :: DekuAncestry, hasElementParent :: Boolean } | FakeAncestry { rep :: String }

instance Eq Ancestry where
  eq (RealAncestry a) (RealAncestry b) = a.rep == b.rep
  eq (FakeAncestry a) (FakeAncestry b) = a.rep == b.rep
  eq (RealAncestry a) (FakeAncestry b) = a.rep == b.rep
  eq (FakeAncestry a) (RealAncestry b) = a.rep == b.rep

instance Ord Ancestry where
  compare (RealAncestry a) (RealAncestry b) = compare a.rep b.rep
  compare (FakeAncestry a) (FakeAncestry b) = compare a.rep b.rep
  compare (RealAncestry a) (FakeAncestry b) = compare a.rep b.rep
  compare (FakeAncestry a) (RealAncestry b) = compare a.rep b.rep

instance Show Ancestry where
  show (RealAncestry a) = "RealAncestry " <> show a
  show (FakeAncestry a) = "FakeAncestry " <> show a

hasElementParent :: Ancestry -> Boolean
hasElementParent (RealAncestry a) = a.hasElementParent
hasElementParent (FakeAncestry { rep }) = String.contains (String.Pattern "e") rep

root :: Ancestry
root = RealAncestry { rep: "", lineage: Root, hasElementParent: false }

element :: Int ->  Ancestry -> Ancestry
element i (RealAncestry a) = RealAncestry
  { rep: a.rep <> "e" <> show i, lineage: Element i a.lineage, hasElementParent: true }
element i (FakeAncestry a) = FakeAncestry
  { rep: a.rep <> "e" <> show i  }

dyn :: Int -> Ancestry -> Ancestry
dyn i (RealAncestry a) = RealAncestry
  { rep: a.rep <> "d" <> show i, lineage: Dyn i a.lineage, hasElementParent: false }
dyn i (FakeAncestry a) = FakeAncestry
  { rep: a.rep <> "d" <> show i  }

portal :: Int -> Ancestry -> Ancestry
portal i (RealAncestry a) = RealAncestry
  { rep: a.rep <> "p" <> show i, lineage: Portal i a.lineage, hasElementParent: a.hasElementParent }
portal i (FakeAncestry a) = FakeAncestry
  { rep: a.rep <> "p" <> show i }

fixed :: Int -> Ancestry -> Ancestry
fixed i (RealAncestry a) = RealAncestry
  { rep: a.rep <> "f" <> show i, lineage: Fixed i a.lineage, hasElementParent: a.hasElementParent  }
fixed i (FakeAncestry a) = FakeAncestry
  { rep: a.rep <> "f" <> show i  }

toStringRepresentationInDOM :: Ancestry -> String
toStringRepresentationInDOM (RealAncestry { rep }) = rep
toStringRepresentationInDOM (FakeAncestry { rep }) = rep

unsafeFakeAncestry :: String -> Ancestry
unsafeFakeAncestry rep = FakeAncestry { rep }

unsafeCollectLineage :: Ancestry -> Maybe DekuAncestry
unsafeCollectLineage (RealAncestry { lineage }) = Just lineage
unsafeCollectLineage (FakeAncestry _) = Nothing